# VericredClient::ProviderDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**city** | **String** | City name (e.g. Springfield). | [optional] 
**email** | **String** | Primary email address to contact the provider. | [optional] 
**gender** | **String** | Provider&#39;s gender (M or F) | [optional] 
**first_name** | **String** | Given name for the provider. | [optional] 
**id** | **Integer** | National Provider Index (NPI) number | [optional] 
**last_name** | **String** | Family name for the provider. | [optional] 
**latitude** | **Float** | Latitude of provider | [optional] 
**longitude** | **Float** | Longitude of provider | [optional] 
**middle_name** | **String** | Middle name for the provider. | [optional] 
**network_ids** | **Array&lt;Integer&gt;** | Array of network ids | [optional] 
**organization_name** | **String** | name for the providers of type: organization. | [optional] 
**phone** | **String** | Office phone for the provider | [optional] 
**presentation_name** | **String** | Preferred name for display (e.g. Dr. Francis White may prefer Dr. Frank White) | [optional] 
**specialty** | **String** | Name of the primary Specialty | [optional] 
**state** | **String** | State code for the provider&#39;s address (e.g. NY). | [optional] 
**state_id** | **Integer** | Foreign key to States | [optional] 
**street_line_1** | **String** | First line of the provider&#39;s street address. | [optional] 
**street_line_2** | **String** | Second line of the provider&#39;s street address. | [optional] 
**suffix** | **String** | Suffix for the provider&#39;s name (e.g. Jr) | [optional] 
**title** | **String** | Professional title for the provider (e.g. Dr). | [optional] 
**type** | **String** | Type of NPI number (individual provider vs organization). | [optional] 
**zip_code** | **String** | Postal code for the provider&#39;s address (e.g. 11215) | [optional] 
**npis** | **Array&lt;Integer&gt;** | The National Provider Index (NPI) numbers associated with this provider. | [optional] 
**hios_ids** | **Array&lt;String&gt;** | List of HIOS ids for this provider | [optional] 


