# VericredClient::RequestPlanFindCarrierVerification

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**applicants** | [**Array&lt;RequestPlanFindApplicant&gt;**](RequestPlanFindApplicant.md) | Applicants for desired plans. | [optional] 
**carrier_id** | **Integer** | National-level carrier id | [optional] 
**drug_packages** | [**Array&lt;RequestPlanFindDrugPackage&gt;**](RequestPlanFindDrugPackage.md) | National Drug Code Package Id | [optional] 
**enrollment_date** | **String** | Date of enrollment | [optional] 
**fips_code** | **String** | County code to determine eligibility | [optional] 
**group_name** | **String** | Label for search tracking | [optional] 
**household_income** | **Integer** | Total household income. | [optional] 
**household_size** | **Integer** | Number of people living in household. | [optional] 
**ids** | **Array&lt;Integer&gt;** | List of plan IDs to filter by | [optional] 
**issuer_vericred_ids** | **Array&lt;String&gt;** | Vericred IDs of the issuers to include in search | [optional] 
**market** | **String** | Type of plan to search for. | [optional] 
**page** | **Integer** | Selected page of paginated response. | [optional] 
**per_page** | **Integer** | Results per page of response. | [optional] 
**providers** | [**Array&lt;RequestPlanFindProvider&gt;**](RequestPlanFindProvider.md) | List of providers to search for. | [optional] 
**sort** | **String** | Sort responses by plan field. | [optional] 
**zip_code** | **String** | 5-digit zip code - this helps determine pricing. | [optional] 


