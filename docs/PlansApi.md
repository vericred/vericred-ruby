# VericredClient::PlansApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_plans_find**](PlansApi.md#post_plans_find) | **POST** /plans/find | 


# **post_plans_find**
> PlanFindResponse post_plans_find(opts)



### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::PlansApi.new

opts = { 
  body: VericredClient::RequestPlanFind.new # RequestPlanFind | 
}

begin
  result = api_instance.post_plans_find(opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling PlansApi->post_plans_find: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RequestPlanFind**](RequestPlanFind.md)|  | [optional] 

### Return type

[**PlanFindResponse**](PlanFindResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



