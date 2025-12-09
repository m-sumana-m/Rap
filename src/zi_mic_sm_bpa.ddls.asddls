
@AbapCatalog.viewEnhancementCategory: [#NONE] 

@AccessControl.authorizationCheck: #NOT_REQUIRED 

@EndUserText.label: 'BPA Entity view'

@Metadata.ignorePropagatedAnnotations: true 

@VDM.viewType: #BASIC 

@Analytics.dataCategory: #DIMENSION 
define view entity ZI_MIC_SM_BPA
  as select from zmic_sm_bpa
{
  key bp_id        as BpId,

      bp_role      as BpRole,

      company_name as CompanyName,

      street       as Street,

      country      as Country,

      region       as Region,

      city         as City
}
