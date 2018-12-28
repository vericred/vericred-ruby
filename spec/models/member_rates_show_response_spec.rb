=begin
#Vericred API

## Getting Started

## Signing Up

Visit our [Developer Portal](https://developers.vericred.com) to
create an account.

Once you have created an account, you can create one Application for your
Production environment and another for a Sandbox (select the appropriate Plan when you create the Application).

## SDKs

Our API follows standard REST conventions, so you can use any HTTP client
to integrate with us. You will likely find it easier to use one of our
[autogenerated SDKs](https://github.com/vericred/?query=vericred-),
which we make available for several common programming languages.

## Authentication

To authenticate, pass the API Key you created in the Developer Portal as
a `Vericred-Api-Key` header.

`curl -H 'Vericred-Api-Key: YOUR_KEY' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Versioning

Vericred's API default to the latest version.  However, if you need a specific
version, you can request it with an `Accept-Version` header.

The current version is `v4`.  We also support `v2` and `v3`

`curl -H 'Vericred-Api-Key: YOUR_KEY' -H 'Accept-Version: v3' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Pagination

Endpoints that accept `page` and `per_page` parameters are paginated. They expose
four additional fields that contain data about your position in the response,
namely `Total`, `Per-Page`, `Link`, and `Page` as described in [RFC-5988](https://tools.ietf.org/html/rfc5988).

For example, to display 5 results per page and view the second page of a
`GET` to `/networks`, your final request would be `GET /networks?....page=2&per_page=5`.

## Sideloading

When we return multiple levels of an object graph (e.g. `Provider`s and their
`State`s we typically the associated data.  In this example, we would
provide an Array of `State`s and a `state_id` for each provider.  This is
done primarily to reduce the payload size since many of the `Provider`s
will share a `State`

### Simplified Example
```
{
  providers: [{ id: 1, state_id: 1}, { id: 2, state_id: 1 }],
  states: [{ id: 1, code: 'NY' }]
}
```

If you need the second level of the object graph, you can just match the
corresponding id.

## Selecting specific data

All endpoints allow you to specify which fields you would like to return.
This allows you to limit the response to contain only the data you need.

For example, let's take a request that returns the following JSON by default

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890',
    field_we_dont_care_about: 'value_we_dont_care_about'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY',
    field_we_dont_care_about: 'value_we_dont_care_about'
  }]
}
```

To limit our results to only return the fields we care about, we specify the
`select` in the query string for a `GET` or the body for a `POST`.

In this case, we want to select `name` and `phone` from the `provider` key,
so we would add the parameters `select=provider.name,provider.phone`.
We also want the `name` and `code` from the `states` key, so we would
add the parameters `select=states.name,states.code`.  The id field of
each document is always returned whether or not it is requested.

Our final request would be `GET /providers/12345?select=provider.name,provider.phone,states.name,states.code`

The response would be

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY'
  }]
}
```

# Plan and Rate Data

Vericred's Plan and Rate Data let you search and quote Major Medical and Ancillary Insurance Plans in a given area for a particular family in the Individual Market or a group of families in the Small Group Market.  Vericred provides the relevant data via this API and via our Bulk Format (documented [below](#Bulk Plan and Rate Data))

## Plans

A Plan defines a set of Benefits available to its purchaser.  For example, a Major Medical Plan would specify cost-share Benefits for services like a Primary Care Provider visit, a Specialist visit or an Emergency Room visit.  A Dental Plan might specify Benefits for Periodontics and Fluroride Treatments.  The Benefits for each Product type ([Major Medical](#header-major-medical), [Dental](#header-dental), and [Vision](#header-vision)) are documented below.

### Benefits Format

Benefits for Plans can be quite complex.  With the goals of capturing and standardizing the complexity while retaining a human-readable format, we have developed a [Bakus-Naur Form](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form)(BNF) context-free grammar, with which we present Benefits.

Benefit cost-share strings are formatted to capture:
 * Network tiers
 * Compound or conditional cost-share
 * Limits on the cost-share
 * Benefit-specific maximum out-of-pocket costs

**Example #1**
As an example, we would represent [this Summary of Benefits &amp; Coverage](https://s3.amazonaws.com/vericred-data/SBC/2017/33602TX0780032.pdf) as:

* **Hospital stay facility fees**:
  - Network Provider: `$400 copay/admit plus 20% coinsurance`
  - Out-of-Network Provider: `$1,500 copay/admit plus 50% coinsurance`
  - Vericred's format for this benefit: `In-Network: $400 before deductible then 20% after deductible / Out-of-Network: $1,500 before deductible then 50% after deductible`

* **Rehabilitation services:**
  - Network Provider: `20% coinsurance`
  - Out-of-Network Provider: `50% coinsurance`
  - Limitations & Exceptions: `35 visit maximum per benefit period combined with Chiropractic care.`
  - Vericred's format for this benefit: `In-Network: 20% after deductible / Out-of-Network: 50% after deductible | limit: 35 visit(s) per Benefit Period`

**Example #2**
In [this other Summary of Benefits &amp; Coverage](https://s3.amazonaws.com/vericred-data/SBC/2017/40733CA0110568.pdf), the **specialty_drugs** cost-share has a maximum out-of-pocket for in-network pharmacies.
* **Specialty drugs:**
  - Network Provider: `40% coinsurance up to a $500 maximum for up to a 30 day supply`
  - Out-of-Network Provider `Not covered`
  - Vericred's format for this benefit: `In-Network: 40% after deductible, up to $500 per script / Out-of-Network: 100%`

**BNF**

Here's a description of the benefits summary string, represented as a context-free grammar:

```
root                      ::= coverage

coverage                  ::= (simple_coverage | tiered_coverage) (space pipe space coverage_modifier)?
tiered_coverage           ::= tier (space slash space tier)*
tier                      ::= tier_name colon space (tier_coverage | not_applicable)
tier_coverage             ::= simple_coverage (space (then | or | and) space simple_coverage)* tier_limitation?
simple_coverage           ::= (pre_coverage_limitation space)? coverage_amount (space post_coverage_limitation)? (comma? space coverage_condition)?
coverage_modifier         ::= limit_condition colon space (((simple_coverage | simple_limitation) (semicolon space see_carrier_documentation)?) | see_carrier_documentation | waived_if_admitted | shared_across_tiers)
waived_if_admitted        ::= ("copay" space)? "waived if admitted"
simple_limitation         ::= pre_coverage_limitation space "copay applies"
tier_name                 ::= "In-Network-Tier-2" | "Out-of-Network" | "In-Network"
limit_condition           ::= "limit" | "condition"
tier_limitation           ::= comma space "up to" space (currency | (integer space time_unit plural?)) (space post_coverage_limitation)?
coverage_amount           ::= currency | unlimited | included | unknown | percentage | (digits space (treatment_unit | time_unit) plural?)
pre_coverage_limitation   ::= first space digits space time_unit plural?
post_coverage_limitation  ::= (((then space currency) | "per condition") space)? "per" space (treatment_unit | (integer space time_unit) | time_unit) plural?
coverage_condition        ::= ("before deductible" | "after deductible" | "penalty" | allowance | "in-state" | "out-of-state") (space allowance)?
allowance                 ::= upto_allowance | after_allowance
upto_allowance            ::= "up to" space (currency space)? "allowance"
after_allowance           ::= "after" space (currency space)? "allowance"
see_carrier_documentation ::= "see carrier documentation for more information"
shared_across_tiers       ::= "shared across all tiers"
unknown                   ::= "unknown"
unlimited                 ::= /[uU]nlimited/
included                  ::= /[iI]ncluded in [mM]edical/
time_unit                 ::= /[hH]our/ | (((/[cC]alendar/ | /[cC]ontract/) space)? /[yY]ear/) | /[mM]onth/ | /[dD]ay/ | /[wW]eek/ | /[vV]isit/ | /[lL]ifetime/ | ((((/[bB]enefit/ plural?) | /[eE]ligibility/) space)? /[pP]eriod/)
treatment_unit            ::= /[pP]erson/ | /[gG]roup/ | /[cC]ondition/ | /[sS]cript/ | /[vV]isit/ | /[eE]xam/ | /[iI]tem/ | /[sS]tay/ | /[tT]reatment/ | /[aA]dmission/ | /[eE]pisode/
comma                     ::= ","
colon                     ::= ":"
semicolon                 ::= ";"
pipe                      ::= "|"
slash                     ::= "/"
plural                    ::= "(s)" | "s"
then                      ::= "then" | ("," space) | space
or                        ::= "or"
and                       ::= "and"
not_applicable            ::= "Not Applicable" | "N/A" | "NA"
first                     ::= "first"
currency                  ::= "$" number
percentage                ::= number "%"
number                    ::= float | integer
float                     ::= digits "." digits
integer                   ::= /[0-9]/+ (comma_int | under_int)*
comma_int                 ::= ("," /[0-9]/*3) !"_"
under_int                 ::= ("_" /[0-9]/*3) !","
digits                    ::= /[0-9]/+ ("_" /[0-9]/+)*
space                     ::= /[ \t]/+
```


### Major Medical

Vericred's data covers all Major Medical Plans available in the Individual and Small Groups (2-50 or 2-100) Markets in the US.  These Plans are governed by CMS and are ACA-compliant.  We do not include certain Plans that fall outside of the ACA, for example, Faith-Based Plans or Short-Term Medical Plans

We support the following Benefits Fields for Major Medical Plans.  These represent the vast majority of fields available on a [Summary of Benefits and Coverage](https://www.healthcare.gov/health-care-law-protections/summary-of-benefits-and-coverage/)

The following are the appropriate Benefit Fields for Major Medical:

- ambulance
- child\_eye\_exam
- child\_eyewear
- chiropractic\_services
- diagnostic\_test
- durable\_medical\_equipment
- emergency\_room
- family\_drug\_deductible
- family\_drug\_moop
- family\_medical\_deductible
- family\_medical\_moop
- generic\_drugs
- habilitation\_services
- home\_health\_care
- hospice\_service
- imaging\_center
- imaging\_physician
- individual\_drug\_deductible
- individual\_drug\_moop
- individual\_medical\_deductible
- individual\_medical\_moop
- inpatient\_birth
- inpatient\_facility
- inpatient\_mental\_health
- inpatient\_physician
- inpatient\_substance
- lab\_test
- non\_preferred\_brand\_drugs
- nonpreferred\_generic\_drug\_share
- nonpreferred\_specialty\_drug\_share
- outpatient\_ambulatory\_care\_center
- outpatient\_facility
- outpatient\_mental\_health
- outpatient\_physician
- outpatient\_substance
- postnatal\_care
- preferred\_brand\_drugs
- prenatal\_care
- preventative\_care
- primary\_care\_physician
- rehabilitation\_services
- skilled\_nursing
- specialist
- specialty\_drugs
- urgent\_care

### Dental

Dental benefits are less standardized than [Major Medical](#header-major-medical).  Because of this, we have captured benefits for the most commonly specified services and procedures.  If a Plan only specifies cost-share for "Major", "Minor", "Elective", etc, we determine the category for each of the benefits that we support and display the appropriate value for its category.

To view the technical documentation, [click here](#dental-plans).

The following are the supported Benefit Fields for Dental:

- bridges
- crowns
- denture\_relines\_rebases
- denture\_repair\_and\_adjustments
- dentures
- emergency\_treatment
- endodontics
- family\_annual\_max
- family\_deductible
- fluoride\_treatment
- implants
- individual\_annual\_max
- individual\_deductible
- inlays
- onlays
- oral\_exam
- oral\_surgery
- orthodontics\_adult
- orthodontics\_child
- periodontal\_maintenance
- periodontics
- prophylaxis\_cleaning
- radiograph\_bitewings
- radiograph\_other
- restoration\_fillings
- sealant
- simple\_extraction
- space\_maintainers

### Vision

Vision benefits are similar in structure to [Dental](#header-dental).  Again, when benefits are broken out by category, we determine the appropriate category for each service or procedure and display the approprate value for its category.

To view the technical documentation, [click here](#vision-plans).

The following are the supported Benefit Fields for Vision:

- eye\_exam
- retinal\_imaging
- frame
- eyeglass\_lenses\_single\_vision
- eyeglass\_lenses\_bifocal
- eyeglass\_lenses\_trifocal
- eyeglass\_lenses\_lenticular
- uv\_coating
- tint
- standard\_antireflective\_coating
- premium\_antireflective\_coating
- standard\_polycarbonate\_lenses\_child
- standard\_polycarbonate\_lenses\_adult
- standard\_progressive\_lenses
- premium\_progressive\_lenses
- standard\_scratch\_resistance
- polarized\_lenses
- photochromatic\_lenses
- standard\_contact\_lens\_fit\_and\_follow\_up
- premium\_contact\_lens\_fit\_and\_follow\_up
- contact\_lenses\_conventional
- contact\_lenses\_disposable
- contact\_lenses\_medically\_necessary
- laser\_vision\_correction
- additional\_pairs\_of\_eyeglasses

## Rates

Rates are returned from the API as a part of [Quoting](#header-quoting).  We calculate Rates in one of two ways.

### Sheet Rates
When a Carrier supplies us with Sheet Rates, we display *exactly* the value provided to us.  For example, in the Major Medical market, most Carriers provide a single rate for each combination of Applicant age and tobacco status in a given [Rating Area](#header-rating-areas).  For example, in Austin, TX, a 21-year-old non-tobacco-user may be $312.41 per month while a 22-year-old tobacco-user may be $401.75 per month.  Certain Vision and Dental Carriers supply Sheet Rates as well, though it is less common.

### Rate Factors
Certain [Major Medical](#header-major-medical) Carriers and most [Vision](#header-vision) and [Dental](#header-dental) Carriers supply Rate Factors.  The attributes on which the factors are based are the same as [Sheet Rates](#header-sheet-rates) for the [Major Medical](#header-major-medical) market (due to restrictions on what factors may be used in ACA Plans, which limit the possible factors to age and tobacco status).

In [Dental](#header-dental) and [Vision](#header-vision), the types of [Rate Factors](#header-rate-factors) are more varied.  For example, SIC Code and Group size in the Group market and Gender in the Individual Market are commonly used [Rate Factors](#header-rate-factors)

Other common [Rate Factors](#header-rate-factors) for [Dental](#header-dental) and [Vision](#header-vision) products are Geographic and "Trend" (enrollment date) Factors.  In [Major Medical](#header-major-medical), these types of variance are handled by CMS-defined [Rating Areas](#header-rating-areas).

In order to calculate a Rate using [Rate Factors](#header-rate-factors), the following methodology is applied:

```
B = Base Rate
f = Rate Factor Function 1
f' = Rate Factor Function 2

B * f(x) * f'(y) [* f''(z)] ... = n
```

## Rating Areas
For [Major Medical](#header-major-medical) products, [CMS](https://www.cms.gov/) defines [Rating Areas](https://www.cms.gov/cciio/programs-and-initiatives/health-insurance-market-reforms/state-gra.html).  Under the ACA, *all* [Rate Factors](#header-rate-factors) in a Rating Area must be identical for a given time period.  E.g. in Arizona, the rate for a 21-year-old non-tobacco user must be identical in all counties contained in Rating Area 1 (Mohave, Coconino, Apache, and Navajo), but *may* be different than the rate for a 21-year-old non-tobacco user in all counties Rating Area 2 (Yavapai county only) for a given year in the Individual Market and a given quartern in the Small Group market.

[Rating Areas](#header-rating-areas) are defined either by County, Zip Code or both, depending on the State.  Because of this variance, all API endpoints that require a [Location](#header-specifying-the-location) require both `zip_code` and `fips_code` (a county code).  [Bulk Data](#bulkplanandratedata) for [Rating Areas](#bulkratingareas) and [Service Areas](#bulkserviceareas) also specifies locations using both `zip_code` and `fips_code`.

*Rating Areas do not apply to products other than [Major Medical](#header-major-medical)*

## Service Areas
CMS mandates that [Major Medical](#header-major-medical) Rates be defined by [Rating Areas](#header-rating-areas), which themselves define a geography in which Plans are offered.  Carriers often choose *not* to offer a Plan in and entire [Rating Area](#header-rating-areas) due to network coverage or other factors.  Instead, the Carrier would define a [Service Area](#header-service-areas) that specifies where a given Plan is offered.

Each Plan is available in a single [Service Area](#header-service-areas) and each [Service Area](#header-service-areas) is defined by either County, Zip Code, or both, depending on the Carrier.  Because of this variance, all API endpoints that require a [Location](#header-specifying-the-location) require both `zip_code` and `fips_code` (a county code). [Bulk Data](#bulkplanandratedata) for [Rating Areas](#bulkratingareas) and [Service Areas](#bulkserviceareas) also specifies locations using both `zip_code` and `fips_code`.

In [Dental](#header-dental) and [Vision](#header-vision) plans, we use a [Service Area](#header-service-areas) to define availability as well, although it typically mirrors a Geographic [Rate Factor](#header-rate-factors).

# Quoting

One of the primary use-cases for the Vericred API is to run Quotes to determine the Rate for a given family (in the Individual Market) or group (in the Small Group Market).  We support quoting across [Major Medical](#header-major-medical), [Vision](#header-vision), and [Dental](#header-dental).  In both cases, the process of generating a Quote is broken out into several steps:

1. Find all available [Plans](#header-plans) in the relevent [Service Areas](#header-service-areas) for the family or group.
1. Using [Business Rules](#header-business-rules) for each [Plan](#header-plans), determine if the family or group is eligible for that [Plan](#header-plans).
1. Using [Business Rules](#header-business-rules) for each [Plan](#header-plans), determine which members of the family or which members of each family in the group should be considered for Rating.
1. Using the [Sheet Rates](#header-sheet-rates) or [Rate Factors](#header-rate-factors) for each [Plan](#header-plans), determine the Rate the family, or for each family in the group.
1. If running a [Composite](#compositerates) quote, determine the portion of the total Rate that each family will pay.

## Individual Quotes
An Individual Quote is one for Plans that are available to a particular family, outside the context of their Employer.  In the [Major Medical](#header-major-medical) market, many of these Plans are available on [Healthcare.gov](https://www.healthcare.gov) or the State-Based Exchange for non-Healthcare.gov states.  The API supports both on-market and off-market Plans.

For details on Major Medical Quoting API calls see [below](#medicalplans-medicalplans-post)

### Specifying the Location
In order to determine which plans are [available](#header-service-areas) and the [rate](#header-rating-areas) for each Plan, you must specify a location.  When creating a [Quote](#header-quoting) for the Individual Market, that information is contained in the `POST` body of the request:
```
POST /plans/medical/search
{
  ...
  "zip_code": "11201",
  "fips_code": "36047"
  ...
}

```

### Specifying Applicants
Applicants are the members of the family being quoted and are specified in the `POST` body of the request.
```
POST /plans/medical/search
{
  ...
  "applicants": [
    {
      "age": 34,
      "smoker": true,
      "child": false
    },
    {
      "age": 32,
      "smoker": false,
      "child": false
    },
    {
      "age": 4,
      "smoker": false,
      "child": true
    }
  ]
  ...
}
```

### Specifying Enrollment Date
The `enrollment_date` determines which [Plans](#header-plans) and [Rates](#header-rates) are returned.  Specifying an `enrollment_date` in the past allows you to calculate historical data as far back as 2014.

### Plan Benefits
Plan Benefits are returned in the response for [Individual Quotes](#individualquotes)
```
POST /plans/medical/search
{
  ...
}

Response:
{
  "plans": [
    {
      ...
      "individual_medical_deductible": "$5,000",
      "family_medical_deductible": "$10,000"
      ...
    }

  ]
}

```

### Premiums
The value for the family being quoted is returned in the `premium` field.  If no [Applicants](#specifyingapplicants) are provided, the `premium` field will be `0`

### Major Medical Quotes
In order to [Quote](#header-quoting) [Major Medical](#header-major-medical) Plans, send a `POST` to `/plans/medical/search`.  In addition, the `age`, `smoker` and `child` attributes of each Applicant must be present.

#### Subsidies
On-market ([Healthcare.gov](https://www.healthcare.gov) and State-Based Exchange) [Major Medical](#header-major-medical) Plans are eligible for government subsidies.  The subsidy calculation is based on the percentage of the family's income that the IRS has designated as "affordable" for that family and the Second Lowest-Cost Silver Plan available to that family.

In order to calculate subsidies for a family the following parameters must be supplied:
```
POST /plans/medical/search
{
  ...
  "household_size": 4,
  "household_income": 40000
  ...
}
```

The amount that the family will pay after subsidy is returned in the `premium_subsidized` field for each plan.

##### Subsidy Calculation
Here is how subsidies are calculated.  This is fully handled by the Vericred API, but the steps are enumerated below for clarity.

1. Determine the percentage of the [Federal Poverty Level](https://aspe.hhs.gov/poverty-guidelines) for the family based on the household size and income.
1. Reference the [CMS table](https://www.irs.gov/pub/irs-drop/rp-17-36.pdf) to determine the appropriate percentage of income for the family to spend on healthcare.
1. Multiply that value by the family's income.  This is the total amount that the family can spend on healthcare for the year, after the subsidy.
1. Find the cost of the Second Least-Expensive Silver Plan available to the family, accounting for the percentage of premium that goes to [Essential Health Benefits](https://www.healthcare.gov/glossary/essential-health-benefits/)
1. Calculate the difference in price between the amount the family should spend on healthcare and the Second Least-Expensive Silver Plan's premium.  This is the subsidy.
1. Apply the subsidy to all on-market Plans available to the family.  The subsidized premium can never be below $0 (for example, a low-cost Bronze Plan may be less expensive than the subsidy)

#### Cost Sharing Reduction Plans
[Cost Sharing Reduction (CSR)](https://www.healthcare.gov/glossary/cost-sharing-reduction/) Plans are available to lower income families and offer enhanced benefits for certain Silver Plans at the same cost as the non-CSR Plans available to higher-income families.

If a family is eligible for CSR Plans, the Vericred API will return the relevant Plan in place of the non-CSR version.

In order to include CSR Plans where applicable, the following parameters must be supplied:
```
POST /plans/medical/search
{
  ...
  "household_size": 4,
  "household_income": 40000
  ...
}
```

### Dental Quotes
Quoting [Dental](#header-dental) Plans for a family requires slightly different parameters for [Applicants](#specifyingapplicants), due to the method with which Plans are [rated](#header-rate-factors).  The folloiwng example contains the require parameters:
```
POST /plans/dental/search
{
  ...
  "applicants": [
    {
      "age": 34,
      "gender": "M",
      "child": false
    },
    {
      "age": 32,
      "gender": "F",
      "child": false
    },
    {
      "age": 4,
      "gender": "M",
      "child": true
    }
  ]
  ...
}
```

Note that in contrast to [Major Medical Quotes](#majormedicalquotes), [Dental Quotes](#dentalquotes) require `gender`, but *do not* require `smoker`.

Also note that [Subsidies](#subsidies) and [Cost Sharing Reduction](#costsharingreductionplans) are *not* relevant for [Dental Quotes](#dentalquotes).

### Vision Quotes

Quoting [Vision](#header-vision) Plans for a family requires slightly different parameters for [Applicants](#specifyingapplicants), due to the method with which Plans are [rated](#header-rate-factors).  The folloiwng example contains the require parameters:
```
POST /plans/vision/search
{
  ...
  "applicants": [
    {
      "age": 34,
      "gender": "M",
      "child": false
    },
    {
      "age": 32,
      "gender": "F",
      "child": false
    },
    {
      "age": 4,
      "gender": "M",
      "child": true
    }
  ]
  ...
}
```

Note that in contrast to [Major Medical Quotes](#majormedicalquotes), [Vision Quotes](#visionquotes) require `gender`, but *do not* require `smoker`.

Also note that [Subsidies](#subsidies) and [Cost Sharing Reduction](#costsharingreductionplans) are *not* relevant for [Vision Quotes](#visionquotes).

## Quotes for Groups
A Group Quote finds [Plans](#header-plans) and [Rates](#header-rates) for a group of employees for a small business.  Different [Plans](#header-plans) are available to small groups than are available in [Individual Quoting](#individualquotes).  In addition, [Business Rules](#header-business-rules) that apply across multiple families or based upon employer attributes such as [SIC](https://en.wikipedia.org/wiki/Standard_Industrial_Classification) code factor into rates and availability.

In addition, due to performance requirements and for enhanced auditing, [Group Quotes](#groupquotes) are persisted across requests.  This means that a given [Quote](#groupquotes) can be retrieved after it has been created.

### Identifiers
In order to make it easier to cross-reference local copies of data with [Quotes](#header-creating-a-quote) and other data in the Vericred API, most entities allow for the specification of an `external_id` field.  You can use this to store a primary or natural key from your system in order to easily match records returned from the API with records in your system.

### Specifying the Group
Creating a group is the first step in [Group Quoting](#groupquoting).  The API requires that certain information such as `sic_code`, and `chamber_association` be provided and returns a the attributes and `id` for the newly created `Group`

Full documentation is available [below](#groupscreate)

### Specifying the Locations
When creating a `Group`, you must also specify one or more `Location`s. Of those `Location`s specified, one must be `primary`.  That `Location` is used to calculate Plan eligibility using the relevant [Service Areas](#header-service-areas).  Some Carriers use secondary `Location`s to determine eligibility as well, which is why those must be specified as well.

```
POST /groups
{
  "group": {
    ...
  },
  "locations": [
    {
      ...
      "zip_code": "11201",
      "fips_code": "36047",
      "primary": true
      ...
    }
  ]
}
```

### Specifying the Census
A Census is the collection of `Member`s contained in the `Group`.  The attributes of each `Member` and his or her `Dependent`s determine the [Rate](#header-rates) for the `Group` as a whole.  Certain attributes of the `Member` are important for calculating [Rates](#header-rates) and applying [Business Rules](#header-business-rules).  For example, the `Member`'s home address and in which office he or she works are relevant for certain [Business Rules](#header-business-rules).

#### Dependent Relationships
The `Dependent`s for a given `Member` also factor into the [Rates](#header-rates) and application of [Business Rules](#header-business-rules).  For example, certain [Plans](#header-plans) cover only `Dependent`s of particular types and/or only `Dependent`s of a particular type who live in the same household as the primary `Member`

Valid Dependent Relationships:
- `adopted_child`
- `child`
- `court_appointed_guardian`
- `dependent_of_dependent`
- `ex_spouse`
- `foster_child`
- `grand_child`
- `guardian`
- `life_partner`
- `other`
- `sibling`
- `sponsored_dependent`
- `spouse`
- `step_child`
- `ward`

```
POST

/groups/{id}/members
{
  "members": [
    ...
    {
      "cobra": false,
      "date_of_birth": "1980-01-01",
      "fips_code": "36047"
      "gender": "M",
      "last_used_tobacco": "2017-01-01",
      "location_id": :location_id
      "retiree": false,
      "zip_code": "11201",
      "dependents": [
        ...
        {
          "relationship": "child",
          "same_household": true
        }
        ...
      ]
    }
    ...
  ]
}

```

### Creating a Quote
Once the [Census](#header-specifying-the-census) has been created, we can generate a `Quote` for the `Group`.

#### Major Medical Quotes
To generate a [Major Medical](#header-major-medical) Quote, specify the `product_line` of `Quote` as `medical`

```
POST /groups/{id}/quotes
{
  ...
  "product_line": "medical"
  ...
}
```

#### Dental Quotes
To generate a [Dental](#header-dental) Quote, specify the `product_line` of `Quote` as `dental`

```
POST /groups/{id}/quotes
{
  ...
  "product_line": "dental"
  ...
}
```

#### Vision Quotes
To generate a [Vision](#header-vision) Quote, specify the `product_line` of `Quote` as `vision`

```
POST /groups/{id}/quotes
{
  ...
  "product_line": "vision"
  ...
}
```

### Retrieving Aggregate Rates
Once you have created a [Quote](#header-creating-a-quote), you can retrieve its aggregate [Rates](#header-rates).  [Rates](#header-rates) are broken down by `Member` and `Dependent`, so that you can show the final cost in different scenarios where an employer might cover a different percentage of `Member` and `Dependent` costs.

```
GET /quotes/{id}/rates

Response
{
  "rates": [
    ...
    {
      "plan_id": "12345NY6789012",
      "total_premium": 2800.0,
      "member_premium": 1000.0,
      "dependent_premium": 1800.0,
      "id": "123abc"
    }
    ...
  ]
}
```


#### Loading Plan Data
Aggregate [Rates](#header-rates) responses *do not* include [Plan](#header-plans) details in order to keep the payload small.  [Plan](#header-plans) data can be retrieved in one of two ways:

Loading the [Plan](#header-plans) from the API:
```
GET /plans/{id}

Response:
{
  "plans": [
    ...
    {
      ...
      "individual_medical_deductible": "$5,000",
      "family_medical_deductible": "$10,000",
      ...
    }
    ...

  ]
}
```
Pulling in [Bulk Plan Data](#bulkplans) and matching up [Plans](#header-plans) by their `id`.

### Retrieving Member-Level Rates
In order to retrieve the exact [Rate](#header-rates) for each `Member` and their `Dependents` for given [Plan](#header-plans), you can load Member-Level `Rates`.

```
GET /rates/{id}/member_rates

Response
{
  "member_rates": [
  ...
  {
    "id": "123abc",
    "member_id": "234def",
    "member_external_id": "externally-supplied-id",
    "member_premium": 500.0,
    "dependent_premium": 600.0,
    "total_premium": 1100.0,
  }
  ...
  ]
}

```

Note that *all* `MemberRate`s are for one particular [Plan](#header-plans) - the one referenced by the parent [Rate](#header-rates).

### Business Rules
Vericred works with our Carrier partners to acquire and apply Business Rules that can affect either [Plan](#header-plans) availability or the way in which `Member`s and `Dependent`s are rated.  For example, one Carrier's Business Rules might specify that `Member`s and `Dependent`s who have used tobacco in the past 4 months are considered "tobacco-users", while another's may specify that period to be 1 year.

These rules are applied transparently during the [Quoting](#header-quoting) process and *do not* require any additional action or input on your part.

For a full accounting of Business Rules and a list of Carriers whose Business Rules are applied, please contact support@vericred.com

### Composite Rates
Composite Rates are commonly used in [Major Medical](#header-major-medical), [Dental](#header-dental), and [Vision](#header-vision) [Plans](#header-plans) to simplify operations by charging each family the weighted average of the `Group`'s total premium.  The most common methodology is as follows:

1. Calculate the [Rates](#header-rates) for the entire `Group` using [Sheet Rates](#header-sheet-rates) or [Rate Factors](#header-rate-factors) as appropriate
1. Categorize each Family within the Group.  The categorization differs depending on whether the Composite Rate is 2, 3, or 4-tier
1. Multiply the number of Families in each category by the constant for that category.  These constants are provided to Vericred by the Carrier.  This determines the total number of "Rating Units"
1. Divide the total premium calculated in Step 1 by the total number of Rating Units to get the price per Rating Unit
1. The [Rate](#header-rates) each Family pays is the constant for that Family's category multiplied by the price per Rating Unit.

You can request that a [Quote](#header-quoting) be calculated using Composite Rates when creating it:
```
POST /quotes
{
  ...
  "rating_method": "4_tier_composite"
  ...
}
```
If no Composite Rates methodology is available, the Vericred API will return standard age-banded Rates.

# Network and Provider Data

A `Provider` is an individual or organization in the medical profession.  For example, an individual doctor is a `Provider` as are certain clinics and hospitals.

`Provider`s are related to `Network`s.  A `Network` is a collection of `Provider`s that are under a particular contract with a given `Carrier`.  A given `Carrier` will often have multiple `Network`s.  For example, there may be a large national `Network` as well as several smaller regional `Network`s.

Each `Plan` has a `Network`.  A consumer who visits a `Provider` typically incurs fewer costs when visiting a `Provider` in the `Network` covered by his or her `Plan`.  The `premium` for a `Plan` is often proportional to the size of its `Network`

## Finding Providers
In order to determine if a particular `Plan` covers a given `Provider`, you must first identify the `Provider`.  To do so, use the [Provider Search API endpoint](#providers-providers-post) and specify some search criteria:

```
POST /providers/search
{
  "search_term": "foo",
  "zip_code": "11201"
}
```

The API will return an ordered list of `Provider`s who match the query along with their names, addresses, and other demographic data.  The `id` field returned refers to the `Provider`'s [NPI number](https://www.cms.gov/Regulations-and-Guidance/Administrative-Simplification/NationalProvIdentStand/).  This is the key that is used to identify the `Provider` across different API endpoints.

## Finding Networks

A `Network` is a collection of `Provider`s that are under a particular contract with a given `Carrier`.  A given `Carrier` will often have multiple `Network`s.  For example, there may be a large national `Network` as well as several smaller regional `Network`s.

The API supports searching for `Networks` by Carrier, market and state.  For more details view the [endpoint documentation](#networks-networks-get)

## Matching Providers to Networks
In order to determine if a `Provider` is covered by a user's `Plan`, you will need to map the `Provider` to a `Network`.  There are several methods to do this using the API

### Using Plan Search
You can specify one or more `npi` values in the [`plan` search](#majormedicalplans-majormedicalplans-post).  To do so, include a list of `providers` in the request
```
POST /plans/medical/search
{
  ...
  "providers": [
    { "npi": 1234567890 },
    { "npi": 2345678901 }
  ]
  ...
}

The response will then return a list of `in_network_ids` and `out_of_network_ids` for each `Plan`

```
{
  "plans": [
    ...
    {
      ...
      "id": "12345NY1234567",
      "in_network_ids": [1234567890],
      "out_of_network_ids": [1234567890]
      ...
    },
    {
      ...
      "id": "12345NY2345678",
      "in_network_ids": [1234567890, 1234567890],
      "out_of_network_ids": []
      ...
    }
    ...
  ]
}

Simply reference the `Provider` in question by its `id` for each `Plan` to see if that `Provider` is in-network for the `Plan`.

### Matching by Plan ID
Given a `Provider`'s `id`, you can retrieve all of his or her `hios_ids`

For more details see the [endpoint documentation](#providers-providers-get)

```
GET /providers/1234567890
{
  "provider": {
    ...
    "hios_ids": [
      ...
      "12345NY1234567"
      ...
    ]
    ...
  }
}
```

The returned `hios_ids` can be used to cross-reference a `Plan`

### Matching by Network
Once you have an ID returned from the [`Network` search endpoint](#networks-networks-get), you can cross-reference it with the `network_ids` returned from both the [`Provider` search](#providers-providers-post) and [`Provider` details](#providers-providers-get) endpoints.

This is useful for large group data or when you are not dealing with `Plan`s directly, but rather at the `Network` level.


OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for VericredClient::MemberRatesShowResponse
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'MemberRatesShowResponse' do
  before do
    # run before each test
    @instance = VericredClient::MemberRatesShowResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MemberRatesShowResponse' do
    it 'should create an instact of MemberRatesShowResponse' do
      expect(@instance).to be_instance_of(VericredClient::MemberRatesShowResponse)
    end
  end
  describe 'test attribute "member_rates"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "meta"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

