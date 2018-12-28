# VericredClient::QuotingApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_group**](QuotingApi.md#create_group) | **POST** /groups | Create a Group
[**create_group_quote**](QuotingApi.md#create_group_quote) | **POST** /groups/{id}/quotes | Create a Quote
[**show_group**](QuotingApi.md#show_group) | **GET** /groups/{id} | Display a Group
[**show_group_rates**](QuotingApi.md#show_group_rates) | **GET** /quotes/{id}/rates | Display Rates
[**show_rate_member_rates**](QuotingApi.md#show_rate_member_rates) | **GET** /rates/{id}/member_rates | Display Member Rates
[**update_group_members**](QuotingApi.md#update_group_members) | **PUT** /groups/{id}/members | Create or Update Members


# **create_group**
> GroupCreateResponse create_group(body)

Create a Group

Create a new [`Group`](#header-specifying-the-group) with which you can create [`Member`s](#quoting-quoting-put) and [`Quote`s](#quoting-quoting-post-1)

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

api_instance = VericredClient::QuotingApi.new

body = VericredClient::GroupCreateRequest.new # GroupCreateRequest | 


begin
  #Create a Group
  result = api_instance.create_group(body)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->create_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GroupCreateRequest**](GroupCreateRequest.md)|  | 

### Return type

[**GroupCreateResponse**](GroupCreateResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_group_quote**
> QuoteCreateResponse create_group_quote(id, opts)

Create a Quote

Generate a `Quote` for a `Group`

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

api_instance = VericredClient::QuotingApi.new

id = "b215b6bcdb" # String | ID of the Group

opts = { 
  body: VericredClient::QuoteCreateRequest.new # QuoteCreateRequest | 
}

begin
  #Create a Quote
  result = api_instance.create_group_quote(id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->create_group_quote: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Group | 
 **body** | [**QuoteCreateRequest**](QuoteCreateRequest.md)|  | [optional] 

### Return type

[**QuoteCreateResponse**](QuoteCreateResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **show_group**
> GroupShowResponse show_group(id)

Display a Group

Retrieve the details for a `Group`

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

api_instance = VericredClient::QuotingApi.new

id = "b215b6bcdb" # String | ID of the Group


begin
  #Display a Group
  result = api_instance.show_group(id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->show_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Group | 

### Return type

[**GroupShowResponse**](GroupShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **show_group_rates**
> RatesShowResponse show_group_rates(id)

Display Rates

null

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

api_instance = VericredClient::QuotingApi.new

id = "5db8ce543d" # String | ID of the quote


begin
  #Display Rates
  result = api_instance.show_group_rates(id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->show_group_rates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the quote | 

### Return type

[**RatesShowResponse**](RatesShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **show_rate_member_rates**
> MemberRatesShowResponse show_rate_member_rates(id)

Display Member Rates

null

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

api_instance = VericredClient::QuotingApi.new

id = "bb1f3523f0" # String | ID of the Rate


begin
  #Display Member Rates
  result = api_instance.show_rate_member_rates(id)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->show_rate_member_rates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Rate | 

### Return type

[**MemberRatesShowResponse**](MemberRatesShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_group_members**
> update_group_members(id, body)

Create or Update Members

Specify the `Member`s and `Dependent`s for the `Group`

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

api_instance = VericredClient::QuotingApi.new

id = "b215b6bcdb" # String | ID of the Group

body = VericredClient::MembersCreateRequest.new # MembersCreateRequest | 


begin
  #Create or Update Members
  api_instance.update_group_members(id, body)
rescue VericredClient::ApiError => e
  puts "Exception when calling QuotingApi->update_group_members: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Group | 
 **body** | [**MembersCreateRequest**](MembersCreateRequest.md)|  | 

### Return type

nil (empty response body)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



