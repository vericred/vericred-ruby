# VericredClient::DrugPackagesApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**show_formulary_drug_package_coverage**](DrugPackagesApi.md#show_formulary_drug_package_coverage) | **GET** /formularies/{formulary_id}/drug_packages/{ndc_package_code} | Formulary Drug Package Search


# **show_formulary_drug_package_coverage**
> FormularyDrugPackageResponse show_formulary_drug_package_coverage(formulary_id, ndc_package_code)

Formulary Drug Package Search

Search for coverage by Formulary and DrugPackage ID

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

api_instance = VericredClient::DrugPackagesApi.new

formulary_id = "123" # String | ID of the Formulary in question

ndc_package_code = "07777-3105-01" # String | ID of the DrugPackage in question


begin
  #Formulary Drug Package Search
  result = api_instance.show_formulary_drug_package_coverage(formulary_id, ndc_package_code)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugPackagesApi->show_formulary_drug_package_coverage: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **formulary_id** | **String**| ID of the Formulary in question | 
 **ndc_package_code** | **String**| ID of the DrugPackage in question | 

### Return type

[**FormularyDrugPackageResponse**](FormularyDrugPackageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



