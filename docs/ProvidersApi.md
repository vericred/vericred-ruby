# VericredClient::ProvidersApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**providers_get**](ProvidersApi.md#providers_get) | **GET** /providers | Find providers by term and zip code
[**providers_npi_get**](ProvidersApi.md#providers_npi_get) | **GET** /providers/{npi} | Find a specific Provider


# **providers_get**
> InlineResponse200 providers_get(search_term, zip_code, opts)

Find providers by term and zip code

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

search_term = "search_term_example" # String | String to search by

zip_code = "zip_code_example" # String | Zip Code to search near

opts = { 
  accepts_insurance: "accepts_insurance_example", # String | Limit results to Providers who accept at least one insurance?
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
 **accepts_insurance** | **String**| Limit results to Providers who accept at least one insurance? | [optional] 
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



