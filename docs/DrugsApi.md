# VericredClient::DrugsApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drug_coverages**](DrugsApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages
[**list_drugs**](DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search


# **get_drug_coverages**
> DrugCoverageResponse get_drug_coverages(ndc_package_code, audience, state_code)

Search for DrugCoverages

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug

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

api_instance = VericredClient::DrugsApi.new

ndc_package_code = "07777-3105-01" # String | NDC package code

audience = "individual" # String | Plan Audience (individual or small_group)

state_code = "CA" # String | Two-character state code


begin
  #Search for DrugCoverages
  result = api_instance.get_drug_coverages(ndc_package_code, audience, state_code)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->get_drug_coverages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **String**| NDC package code | 
 **audience** | **String**| Plan Audience (individual or small_group) | 
 **state_code** | **String**| Two-character state code | 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **list_drugs**
> DrugSearchResponse list_drugs(search_term)

Drug Search

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

api_instance = VericredClient::DrugsApi.new

search_term = "Zyrtec" # String | Full or partial proprietary name of drug


begin
  #Drug Search
  result = api_instance.list_drugs(search_term)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->list_drugs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **String**| Full or partial proprietary name of drug | 

### Return type

[**DrugSearchResponse**](DrugSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



