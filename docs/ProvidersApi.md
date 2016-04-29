# VericredClient::ProvidersApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**providers_get**](ProvidersApi.md#providers_get) | **GET** /providers | Find providers by term and zip code
[**providers_npi_get**](ProvidersApi.md#providers_npi_get) | **GET** /providers/{npi} | Find a specific Provider


# **providers_get**
> InlineResponse200 providers_get(search_term, zip_code, opts)

Find providers by term and zip code

All `Provider` searches require a `zip_code`, which we use for weighting
the search results to favor `Provider`s that are near the user.  For example,
we would want "Dr. John Smith" who is 5 miles away to appear before
"Dr. John Smith" who is 100 miles away.

The weighting also allows for non-exact matches.  In our prior example, we
would want "Dr. Jon Smith" who is 2 miles away to appear before the exact
match "Dr. John Smith" who is 100 miles away because it is more likely that
the user just entered an incorrect name.

The free text search also supports Specialty name search and "body part"
Specialty name search.  So, searching "John Smith nose" would return
"Dr. John Smith", the ENT Specialist before "Dr. John Smith" the Internist.



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

search_term = "search_term_example" # String | String to search by

zip_code = "zip_code_example" # String | Zip Code to search near

opts = { 
  accepts_insurance: "accepts_insurance_example", # String | Limit results to Providers who accept at least one insurance plan.  Note that the inverse of this filter is not supported and any value will evaluate to true
  hios_ids: ["hios_ids_example"], # Array<String> | HIOS id of one or more plans
  page: "page_example", # String | Page number
  per_page: "per_page_example", # String | Number of records to return per page
  radius: "radius_example" # String | Radius (in miles) to use to limit results
}

begin
  #Find providers by term and zip code
  result = api_instance.providers_get(search_term, zip_code, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->providers_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| String to search by | 
 **zip_code** | **String**| Zip Code to search near | 
 **accepts_insurance** | **String**| Limit results to Providers who accept at least one insurance plan.  Note that the inverse of this filter is not supported and any value will evaluate to true | [optional] 
 **hios_ids** | [**Array&lt;String&gt;**](String.md)| HIOS id of one or more plans | [optional] 
 **page** | **String**| Page number | [optional] 
 **per_page** | **String**| Number of records to return per page | [optional] 
 **radius** | **String**| Radius (in miles) to use to limit results | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **providers_npi_get**
> InlineResponse2001 providers_npi_get(npi)

Find a specific Provider

To retrieve a specific provider, just perform a GET using his NPI number



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

npi = "npi_example" # String | NPI number


begin
  #Find a specific Provider
  result = api_instance.providers_npi_get(npi)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->providers_npi_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **npi** | **String**| NPI number | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



