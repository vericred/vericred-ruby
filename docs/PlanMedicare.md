# VericredClient::PlanMedicare

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**carrier_name** | **String** | Name of the insurance carrier | [optional] 
**display_name** | **String** | Alternate name for the Plan | [optional] 
**effective_date** | **String** | Effective date of coverage. | [optional] 
**expiration_date** | **String** | Expiration date of coverage. | [optional] 
**identifiers** | [**Array&lt;PlanIdentifier&gt;**](PlanIdentifier.md) | List of identifiers of this Plan | [optional] 
**name** | **String** | Marketing name of the plan | [optional] 
**network_ids** | **Array&lt;Integer&gt;** | List of Vericred-generated network_ids | [optional] 
**network_size** | **Integer** | Total number of Providers in network | [optional] 
**plan_type** | **String** | Category of the plan (e.g. EPO, HMO, PPO, POS, Indemnity, PACE, Medicare-Medicaid, HMO w/POS, Cost, FFS, MSA) | [optional] 
**service_area_id** | **String** | Foreign key for service area | [optional] 
**source** | **String** | Source of the plan benefit data | [optional] 
**id** | **String** | Government-issued MedicareAdvantage plan ID | [optional] 


