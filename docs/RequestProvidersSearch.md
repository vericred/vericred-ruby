# VericredClient::RequestProvidersSearch

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accepts_insurance** | **BOOLEAN** | Limit results to Providers who accept at least one insurance         plan.  Note that the inverse of this filter is not supported and         any value will evaluate to true | [optional] 
**hios_ids** | **Array&lt;String&gt;** | List of HIOS ids | [optional] 
**min_score** | **Float** | Minimum search threshold to be included in the results | [optional] 
**network_ids** | **Array&lt;Integer&gt;** | List of Vericred network ids | [optional] 
**page** | **Integer** | Page number | [optional] 
**per_page** | **Integer** | Number of records to return per page | [optional] 
**radius** | **Integer** | Radius (in miles) to use to limit results | [optional] 
**search_term** | **String** | String to search by | [optional] 
**zip_code** | **String** | Zip Code to search near | [optional] 
**type** | **String** | Either organization or individual | [optional] 


