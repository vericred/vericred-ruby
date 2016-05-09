# VericredClient::DrugCoverageApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**drugs_ndc_coverages_get**](DrugCoverageApi.md#drugs_ndc_coverages_get) | **GET** /drugs/{ndc}/coverages | Find Drug Coverages for a given NDC


# **drugs_ndc_coverages_get**
> Array&lt;DrugCoverage&gt; drugs_ndc_coverages_get(ndc)

Find Drug Coverages for a given NDC

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::DrugCoverageApi.new

ndc = "ndc_example" # String | NDC for a drug


begin
  #Find Drug Coverages for a given NDC
  result = api_instance.drugs_ndc_coverages_get(ndc)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugCoverageApi->drugs_ndc_coverages_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc** | **String**| NDC for a drug | 

### Return type

[**Array&lt;DrugCoverage&gt;**](DrugCoverage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



