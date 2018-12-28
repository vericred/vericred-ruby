# VericredClient::RequestProvidersSearch

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accepts_insurance** | **BOOLEAN** | Limit results to Providers who accept at least one insurance         plan.  Note that the inverse of this filter is not supported and         any value will evaluate to true | [optional] 
**ids** | **Array&lt;Integer&gt;** | List of NPIs | [optional] 
**network_ids** | **Array&lt;Integer&gt;** | List of Vericred network ids | [optional] 
**page** | **Integer** | Page number | [optional] 
**per_page** | **Integer** | Number of records to return per page | [optional] 
**plan_ids** | **Array&lt;String&gt;** | List of hios ids and contract codes | [optional] 
**polygon** | **Integer** | Define a custom search polygon, mutually exclusive with zip_code search | [optional] 
**radius** | **Integer** | Radius (in miles) to use to limit results | [optional] 
**search_term** | **String** | String to search by | [optional] 
**sort** | **String** | specify sort mode (distance or random) | [optional] 
**sort_seed** | **Integer** | Seed value for random sort. Randomly-ordered searches with the same seed return results in consistent order. | [optional] 
**type** | **String** | Either organization or individual | [optional] 
**zip_code** | **String** | Zip Code to search near | [optional] 


