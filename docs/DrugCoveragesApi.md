# VericredClient::DrugCoveragesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drug_coverages**](DrugCoveragesApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages


# **get_drug_coverages**
> DrugCoverageResponse get_drug_coverages(ndc_package_code, audience, state_code)

Search for DrugCoverages

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug.  #### Tiers   Possible values for tier:    | Tier                     | Description                                                                                                                                                                     |   | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |   | __generic__              | Unbranded drugs, with the same active ingredients as their brand-name equivalents, and generally available at a lower cost.                                                     |   | __preferred_brand__      | Brand-name drugs included on the health plan's formulary. Generally more expensive than generics, and less expensive than non-preferred drugs.                                  |   | __non_preferred_brand__  | Brand-name drugs not included on the health plan's formulary. These generally have a higher coinsurance.                                                                        |   | __specialty__            | Used to treat complex conditions like cancer. May require special handling or monitoring. May be generic or brand-name. Generally the most expensive drugs covered by a plan.   |   | __not_covered__          | Specifically excluded from the health plan.                                                                                                                                     |   | __not_listed__           | Neither included nor excluded from the health plan. Most plans provide some default level of coverage for unlisted drugs.                                                       |

### Example
```ruby
# load the gem
require 'vericred_client'
# setup authorization
VericredClient.configure do |config|
  # Configure API key authorization: Vericred-Api-Key
  config.api_key['Vericred-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Vericred-Api-Key'] = 'Bearer'
end

api_instance = VericredClient::DrugCoveragesApi.new

ndc_package_code = "07777-3105-01" # String | NDC package code

audience = "individual" # String | Plan Audience (individual or small_group)

state_code = "CA" # String | Two-character state code


begin
  #Search for DrugCoverages
  result = api_instance.get_drug_coverages(ndc_package_code, audience, state_code)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugCoveragesApi->get_drug_coverages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **String**| NDC package code | 
 **audience** | **String**| Plan Audience (individual or small_group) | 
 **state_code** | **String**| Two-character state code | 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



