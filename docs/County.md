# VericredClient::County

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**fips_code** | **String** | State FIPS code | [optional] 
**id** | **Integer** | Primary key | [optional] 
**name** | **String** | Human-readable name | [optional] 
**state_code** | **String** | Two-character state code | [optional] 
**state_id** | **Integer** | state relationship | [optional] 
**state_live** | **BOOLEAN** | Is the state containing this county active for consumers?(deprecated in favor of last_date_for_individual) | [optional] [default to false]
**state_live_for_business** | **BOOLEAN** | Is the state containing this county active for business?(deprecated in favor of last_date_for_shop) | [optional] [default to false]


