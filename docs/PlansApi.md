# VericredClient::PlansApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**plans_find_post**](PlansApi.md#plans_find_post) | **POST** /plans/find | Find a set of plans for a Zip Code and County


# **plans_find_post**
> Array&lt;Plan&gt; plans_find_post(query)

Find a set of plans for a Zip Code and County

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::PlansApi.new

query = VericredClient::Query.new # Query | Plan query


begin
  #Find a set of plans for a Zip Code and County
  result = api_instance.plans_find_post(query)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling PlansApi->plans_find_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | [**Query**](Query.md)| Plan query | 

### Return type

[**Array&lt;Plan&gt;**](Plan.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



