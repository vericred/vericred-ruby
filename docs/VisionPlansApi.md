# VericredClient::VisionPlansApi

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**find_vision_plans**](VisionPlansApi.md#find_vision_plans) | **POST** /plans/vision/search | Search Plans
[**show_medical_plan**](VisionPlansApi.md#show_medical_plan) | **GET** /plans/vision/{id} | Show Plan


# **find_vision_plans**
> VisionPlanSearchResponse find_vision_plans(body)

Search Plans

### Searching for Vision Plans  Determine the available Plans and their Premiums for a particular Family in a given Location. The overview on vision plans and plan benefits can be accessed [here](#header-vision).  For details on searching for Plans and their related data, see the [Quoting Vision Plans](#header-major-medical-quotes) section. 

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

api_instance = VericredClient::VisionPlansApi.new

body = VericredClient::VisionPlanSearchRequest.new # VisionPlanSearchRequest | 


begin
  #Search Plans
  result = api_instance.find_vision_plans(body)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling VisionPlansApi->find_vision_plans: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**VisionPlanSearchRequest**](VisionPlanSearchRequest.md)|  | 

### Return type

[**VisionPlanSearchResponse**](VisionPlanSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **show_medical_plan**
> VisionPlanShowResponse show_medical_plan(id, opts)

Show Plan

### Retrieving Benefits for a Vision Plan Show the details of an individual Plan.  This includes all [benefits](#header-vision) for the Plan.  For more details on displaying Plans and their related data, see the [Quoting](#header-individual-quotes) section.

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

api_instance = VericredClient::VisionPlansApi.new

id = "88eG5hhn" # String | ID of the Plan

opts = { 
  year: 2018 # Integer | Plan year (defaults to current year)
}

begin
  #Show Plan
  result = api_instance.show_medical_plan(id, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling VisionPlansApi->show_medical_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the Plan | 
 **year** | **Integer**| Plan year (defaults to current year) | [optional] 

### Return type

[**VisionPlanShowResponse**](VisionPlanShowResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



