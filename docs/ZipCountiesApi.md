# VericredClient::ZipCountiesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_zip_counties**](ZipCountiesApi.md#get_zip_counties) | **GET** /zip_counties | Search for Zip Counties
[**show_zip_county**](ZipCountiesApi.md#show_zip_county) | **GET** /zip_counties/{id} | Show an individual ZipCounty


# **get_zip_counties**
> ZipCountiesResponse get_zip_counties(zip_prefix)

Search for Zip Counties

Our `Plan` endpoints require a zip code and a fips (county) code.  This is because plan pricing requires both of these elements.  Users are unlikely to know their fips code, so we provide this endpoint to look up a `ZipCounty` by zip code and return both the selected zip and fips codes.

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

api_instance = VericredClient::ZipCountiesApi.new

zip_prefix = "1002" # String | Partial five-digit Zip


begin
  #Search for Zip Counties
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

[**ZipCountiesResponse**](ZipCountiesResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **show_zip_county**
> ZipCountyResponse show_zip_county(id)

Show an individual ZipCounty

Our `Plan` endpoints require a zip code and a fips (county) code.  This is because plan pricing requires both of these elements.  Users are unlikely to know their fips code, so we provide this endpoint to returns the details for a `ZipCounty` by zip code and return both the selected zip and fips codes.

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

api_instance = VericredClient::ZipCountiesApi.new

id = 12345 # Integer | Unique ID for ZipCounty


begin
  #Show an individual ZipCounty
  result = api_instance.show_zip_county(id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling ZipCountiesApi->show_zip_county: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Unique ID for ZipCounty | 

### Return type

[**ZipCountyResponse**](ZipCountyResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



