# VericredClient::ProvidersApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_providers**](ProvidersApi.md#get_providers) | **GET** /providers | 
[**get_providers_npi**](ProvidersApi.md#get_providers_npi) | **GET** /providers/{npi} | 


# **get_providers**
> ProviderResponse get_providers(search_term, zip_code, opts)



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

search_term = "search_term_example" # String | String to search by

zip_code = "zip_code_example" # String | Zip Code to search near

opts = { 
  accepts_insurance: "accepts_insurance_example", # String | Limit results to Providers who accept at least one insurance plan.  Note that the inverse of this filter is not supported and any value will evaluate to true
  page: "page_example", # String | Page number
  per_page: "per_page_example", # String | Number of records to return per page
  radius: "radius_example", # String | Radius (in miles) to use to limit results
  type: "type_example" # String | Either organization or individual
}

begin
  result = api_instance.get_providers(search_term, zip_code, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->get_providers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| String to search by | 
 **zip_code** | **String**| Zip Code to search near | 
 **accepts_insurance** | **String**| Limit results to Providers who accept at least one insurance plan.  Note that the inverse of this filter is not supported and any value will evaluate to true | [optional] 
 **page** | **String**| Page number | [optional] 
 **per_page** | **String**| Number of records to return per page | [optional] 
 **radius** | **String**| Radius (in miles) to use to limit results | [optional] 
 **type** | **String**| Either organization or individual | [optional] 

### Return type

[**ProviderResponse**](ProviderResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_providers_npi**
> ProviderResponse get_providers_npi(npi)



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

npi = "npi_example" # String | NPI number


begin
  result = api_instance.get_providers_npi(npi)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->get_providers_npi: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **npi** | **String**| NPI number | 

### Return type

[**ProviderResponse**](ProviderResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



