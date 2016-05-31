# VericredClient::NetworksApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_networks**](NetworksApi.md#list_networks) | **GET** /networks | Networks


# **list_networks**
> NetworkSearchResponse list_networks(carrier_id)

Networks

A network is a list of the doctors, other health care providers,
and hospitals that a plan has contracted with to provide medical care to
its members.

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::NetworksApi.new

carrier_id = "33333" # String | Carrier HIOS Issuer ID


begin
  #Networks
  result = api_instance.list_networks(carrier_id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling NetworksApi->list_networks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carrier_id** | **String**| Carrier HIOS Issuer ID | 

### Return type

[**NetworkSearchResponse**](NetworkSearchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



