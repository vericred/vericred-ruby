# VericredClient::ZipCountiesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_zip_counties**](ZipCountiesApi.md#get_zip_counties) | **GET** /zip_counties | 


# **get_zip_counties**
> ZipCountyResponse get_zip_counties(zip_prefix)



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::ZipCountiesApi.new

zip_prefix = "zip_prefix_example" # String | Partial five-digit Zip


begin
  result = api_instance.get_zip_counties(zip_prefix)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ZipCountiesApi->get_zip_counties: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zip_prefix** | **String**| Partial five-digit Zip | 

### Return type

[**ZipCountyResponse**](ZipCountyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



