# VericredClient::DrugsApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drugs_coverages_ndc**](DrugsApi.md#get_drugs_coverages_ndc) | **GET** /drugs/coverages | Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan


# **get_drugs_coverages_ndc**
> DrugCoverageResponse get_drugs_coverages_ndc(ndc_package_code, state_code)

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::DrugsApi.new

ndc_package_code = "ndc_package_code_example" # String | NDC package code

state_code = "state_code_example" # String | Two-character state code


begin
  #Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan
  result = api_instance.get_drugs_coverages_ndc(ndc_package_code, state_code)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->get_drugs_coverages_ndc: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **String**| NDC package code | 
 **state_code** | **String**| Two-character state code | 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



