# VericredClient::FormulariesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_formularies**](FormulariesApi.md#list_formularies) | **GET** /formularies | Formulary Search


# **list_formularies**
> FormularyResponse list_formularies(opts)

Formulary Search

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

api_instance = VericredClient::FormulariesApi.new

opts = { 
  search_term: "HIX PPO", # String | Full or partial name of the formulary
  rx_bin: "123456", # String | RX BIN Number (found on an insurance card)
  rx_group: "HEALTH", # String | RX Group String (found on an insurance card)
  rx_pcn: "9999" # String | RX PCN Number (found on an insurance card)
}

begin
  #Formulary Search
  result = api_instance.list_formularies(opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling FormulariesApi->list_formularies: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| Full or partial name of the formulary | [optional] 
 **rx_bin** | **String**| RX BIN Number (found on an insurance card) | [optional] 
 **rx_group** | **String**| RX Group String (found on an insurance card) | [optional] 
 **rx_pcn** | **String**| RX PCN Number (found on an insurance card) | [optional] 

### Return type

[**FormularyResponse**](FormularyResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



