# VericredClient::ProvidersApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_provider**](ProvidersApi.md#get_provider) | **GET** /providers/{npi} | Find a Provider
[**get_providers**](ProvidersApi.md#get_providers) | **POST** /providers/search | Find Providers


# **get_provider**
> Provider get_provider(npi, opts)

Find a Provider

To retrieve a specific provider, just perform a GET using his NPI number

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ProvidersApi.new

npi = "1234567890" # String | NPI number

opts = { 
  vericred_api_key: "api-doc-key" # String | API Key
}

begin
  #Find a Provider
  result = api_instance.get_provider(npi, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->get_provider: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **npi** | **String**| NPI number | 
 **vericred_api_key** | **String**| API Key | [optional] 

### Return type

[**Provider**](Provider.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_providers**
> ProvidersSearchResponse get_providers(opts)

Find Providers

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

opts = { 
  body: VericredClient::RequestProvidersSearch.new # RequestProvidersSearch | 
}

begin
  #Find Providers
  result = api_instance.get_providers(opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ProvidersApi->get_providers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RequestProvidersSearch**](RequestProvidersSearch.md)|  | [optional] 

### Return type

[**ProvidersSearchResponse**](ProvidersSearchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



