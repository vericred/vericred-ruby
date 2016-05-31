# VericredClient::DrugsApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drug_coverages**](DrugsApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages
[**list_drugs**](DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search


# **get_drug_coverages**
> DrugCoverageResponse get_drug_coverages(ndc_package_code, audience, state_code, opts)

Search for DrugCoverages

Drug Coverages are the specific tier level, quantity limit, prior
authorization and step therapy for a given Drug/Plan combination. This endpoint
returns all DrugCoverages for a given Drug

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::DrugsApi.new

ndc_package_code = "12345-4321-11" # String | NDC package code

audience = "individual" # String | Two-character state code

state_code = "NY" # String | Two-character state code

opts = { 
  vericred_api_key: "api-doc-key" # String | API Key
}

begin
  #Search for DrugCoverages
  result = api_instance.get_drug_coverages(ndc_package_code, audience, state_code, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->get_drug_coverages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **String**| NDC package code | 
 **audience** | **String**| Two-character state code | 
 **state_code** | **String**| Two-character state code | 
 **vericred_api_key** | **String**| API Key | [optional] 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **list_drugs**
> DrugSearchResponse list_drugs(search_term, opts)

Drug Search

Search for drugs by proprietary name

### Example
```ruby
# load the gem
require 'vericred_client'

api_instance = VericredClient::DrugsApi.new

search_term = "Zyrtec" # String | Full or partial proprietary name of drug

opts = { 
  vericred_api_key: "api-doc-key" # String | API Key
}

begin
  #Drug Search
  result = api_instance.list_drugs(search_term, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->list_drugs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| Full or partial proprietary name of drug | 
 **vericred_api_key** | **String**| API Key | [optional] 

### Return type

[**DrugSearchResponse**](DrugSearchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



