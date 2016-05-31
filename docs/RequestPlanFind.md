# VericredClient::RequestPlanFind

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**applicants** | [**Array&lt;RequestPlanFindApplicant&gt;**](RequestPlanFindApplicant.md) | Applicants for desired plans. | [optional] 
**enrollment_date** | **String** | Date of enrollment | [optional] 
**drug_packages** | [**Array&lt;DrugPackage&gt;**](DrugPackage.md) | National Drug Code Package Id | [optional] 
**fips_code** | **String** | County code to determine eligibility | [optional] 
**household_income** | **Integer** | Total household income. | [optional] 
**household_size** | **Integer** | Number of people living in household. | [optional] 
**market** | **String** | Type of plan to search for. | [optional] 
**providers** | [**Array&lt;RequestPlanFindProvider&gt;**](RequestPlanFindProvider.md) | List of providers to search for. | [optional] 
**zip_code** | **String** | 5-digit zip code - this helps determine pricing. | [optional] 


