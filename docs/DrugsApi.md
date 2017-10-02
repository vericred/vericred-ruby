# VericredClient::DrugsApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_drugs**](DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search


# **list_drugs**
> DrugSearchResponse list_drugs(search_term)

Drug Search

Search for drugs by proprietary name

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

api_instance = VericredClient::DrugsApi.new

search_term = "Zyrtec" # String | Full or partial proprietary name of drug


begin
  #Drug Search
  result = api_instance.list_drugs(search_term)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->list_drugs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| Full or partial proprietary name of drug | 

### Return type

[**DrugSearchResponse**](DrugSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



