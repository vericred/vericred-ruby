# VericredClient::NetworkSizesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_state_network_sizes**](NetworkSizesApi.md#list_state_network_sizes) | **GET** /states/{state_id}/network_sizes | State Network Sizes


# **list_state_network_sizes**
> StateNetworkSizeResponse list_state_network_sizes(state_id, opts)

State Network Sizes

The number of in-network Providers for each network in a given state. This data is recalculated nightly.  The endpoint is paginated.

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

api_instance = VericredClient::NetworkSizesApi.new

state_id = "CA" # String | State code

opts = { 
  page: 1, # Integer | Page of paginated response
  per_page: 1 # Integer | Responses per page
}

begin
  #State Network Sizes
  result = api_instance.list_state_network_sizes(state_id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling NetworkSizesApi->list_state_network_sizes: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **state_id** | **String**| State code | 
 **page** | **Integer**| Page of paginated response | [optional] 
 **per_page** | **Integer**| Responses per page | [optional] 

### Return type

[**StateNetworkSizeResponse**](StateNetworkSizeResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



