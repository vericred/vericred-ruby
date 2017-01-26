# VericredClient::NetworksApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_networks**](NetworksApi.md#list_networks) | **GET** /networks | Networks
[**show_network**](NetworksApi.md#show_network) | **GET** /networks/{id} | Network Details


# **list_networks**
> NetworkSearchResponse list_networks(carrier_id, opts)

Networks

A network is a list of the doctors, other health care providers, and hospitals that a plan has contracted with to provide medical care to its members. This endpoint is paginated.

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

api_instance = VericredClient::NetworksApi.new

carrier_id = "33333" # String | Carrier HIOS Issuer ID

opts = { 
  page: 1, # Integer | Page of paginated response
  per_page: 1 # Integer | Responses per page
}

begin
  #Networks
  result = api_instance.list_networks(carrier_id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling NetworksApi->list_networks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carrier_id** | **String**| Carrier HIOS Issuer ID | 
 **page** | **Integer**| Page of paginated response | [optional] 
 **per_page** | **Integer**| Responses per page | [optional] 

### Return type

[**NetworkSearchResponse**](NetworkSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **show_network**
> NetworkDetailsResponse show_network(id)

Network Details

A network is a list of the doctors, other health care providers, and hospitals that a plan has contracted with to provide medical care to its members.

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

api_instance = VericredClient::NetworksApi.new

id = 100001 # Integer | Primary key of the network


begin
  #Network Details
  result = api_instance.show_network(id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling NetworksApi->show_network: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Primary key of the network | 

### Return type

[**NetworkDetailsResponse**](NetworkDetailsResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



