@AbapCatalog.sqlViewName: 'ZMICSMBPAVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds view'
@Metadata.ignorePropagatedAnnotations: true
define view ZMIC_SM_BPA_VIEW as select from zmic_sm_bpa 
{




key bp_id as BpId, 

bp_role as BpRole, 

company_name as CompanyName, 

street as Street, 

country as Country, 

region as Region, 

city as City 

} 

