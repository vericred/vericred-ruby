# VericredClient::DentalPlansApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**find_dental_plans**](DentalPlansApi.md#find_dental_plans) | **POST** /plans/dental/search | Search Plans
[**show_dental_plan**](DentalPlansApi.md#show_dental_plan) | **GET** /plans/dental/{id} | Show Plan


# **find_dental_plans**
> DentalPlanSearchResponse find_dental_plans(body)

Search Plans

### Searching for Dental Plans  Determine the available Plans and their Premiums for a particular Family in a given Location. The overview on dental plans and plan benefits can be accessed [here](#header-dental).  For details on searching for Plans and their related data, see the [Quoting Dental Plans](#header-dental-quotes) section. 

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

api_instance = VericredClient::DentalPlansApi.new

body = VericredClient::DentalPlanSearchRequest.new # DentalPlanSearchRequest | 


begin
  #Search Plans
  result = api_instance.find_dental_plans(body)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DentalPlansApi->find_dental_plans: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**DentalPlanSearchRequest**](DentalPlanSearchRequest.md)|  | 

### Return type

[**DentalPlanSearchResponse**](DentalPlanSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **show_dental_plan**
> DentalPlanShowResponse show_dental_plan(id, opts)

Show Plan

### Retrieving Benefits for a Dental Plan Show the details of an individual Plan.  This includes all [benefits](#header-dental) for the Plan.  For more details on displaying Plans and their related data, see the [Quoting](#header-individual-quotes) section.

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

api_instance = VericredClient::DentalPlansApi.new

id = "99eA4hhn" # String | ID of the Plan

opts = { 
  year: 2018 # Integer | Plan year (defaults to current year)
}

begin
  #Show Plan
  result = api_instance.show_dental_plan(id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DentalPlansApi->show_dental_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Plan | 
 **year** | **Integer**| Plan year (defaults to current year) | [optional] 

### Return type

[**DentalPlanShowResponse**](DentalPlanShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



