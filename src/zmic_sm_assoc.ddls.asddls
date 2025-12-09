@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMIC_SM_ASSOC as select from ZMIC_SM_BPA_ENTITY as bpa 

association of one to many zmic_sm_so_hdr as _SalesOrders 

on $projection.BpId = _SalesOrders.buyer 

{ 

key bpa.BpId, 

bpa.BpRole, 

bpa.CompanyName, 

bpa.Street, 

bpa.Country, 

bpa.Region, 

bpa.City, 

--exposed association 

_SalesOrders 

} 
