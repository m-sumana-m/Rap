@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST] 
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BPA ENTITY US'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility: { 

extensible: true 

} 
define view entity ZMIC_SM_BPA_ENTITY_US 

with parameters 

p_ctry: land1 

as select from ZMIC_SM_BPA_ENTITY 

{ 

key BpId, 

BpRole, 

CompanyName, 

Country, 

City 

} where Country = $parameters.p_ctry 
