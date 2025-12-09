@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BPA ENTITY'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMIC_SM_BPA_ENTITY as select from zmic_sm_bpa
{
    

key bp_id as BpId, 

bp_role as BpRole, 

company_name as CompanyName, 

street as Street, 

country as Country, 

region as Region, 

city as City 

} 

 