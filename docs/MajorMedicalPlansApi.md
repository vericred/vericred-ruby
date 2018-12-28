# VericredClient::MajorMedicalPlansApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**find_major_medical_plans**](MajorMedicalPlansApi.md#find_major_medical_plans) | **POST** /plans/medical/search | Search Plans
[**show_major_medical_plan**](MajorMedicalPlansApi.md#show_major_medical_plan) | **GET** /plans/medical/{id} | Show Plan


# **find_major_medical_plans**
> PlanSearchResponse find_major_medical_plans(body)

Search Plans

### Searching for Medical Plans  Determine the available Plans and their Premiums for a particular Family in a given Location.  For details on searching for Plans and their related data, see the [Quoting Medical Plans](#header-major-medical-quotes) section.  ### Additional Sorting Plans can be sorted by the `premium`, `carrier_name`, `level`, and `plan_type` fields, by either ascending (as `asc`) or descending (as `dsc`) sort under the `sort` field.  ### Provider Data The Major Medical Plans are paired with [Network Provider Data](#header-network-and-provider-data)  ### Drug coverages Are included along with the rest of the plan data. See [the description below](#drugcoverages) for more details. 

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

api_instance = VericredClient::MajorMedicalPlansApi.new

body = VericredClient::RequestPlanFind.new # RequestPlanFind | 


begin
  #Search Plans
  result = api_instance.find_major_medical_plans(body)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling MajorMedicalPlansApi->find_major_medical_plans: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RequestPlanFind**](RequestPlanFind.md)|  | 

### Return type

[**PlanSearchResponse**](PlanSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **show_major_medical_plan**
> PlanShowResponse show_major_medical_plan(id, opts)

Show Plan

### Retrieving Benefits for a Medical Plan Show the details of an individual Plan.  This includes all [benefits](#header-major-medical) for the Plan.  For more details on displaying Plans and their related data, see the [Quoting](#header-individual-quotes) section.

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

api_instance = VericredClient::MajorMedicalPlansApi.new

id = "88582NY0230001" # String | ID of the Plan

opts = { 
  year: 2018 # Integer | Plan year (defaults to current year)
}

begin
  #Show Plan
  result = api_instance.show_major_medical_plan(id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling MajorMedicalPlansApi->show_major_medical_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Plan | 
 **year** | **Integer**| Plan year (defaults to current year) | [optional] 

### Return type

[**PlanShowResponse**](PlanShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



