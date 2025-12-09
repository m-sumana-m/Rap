
@AbapCatalog.viewEnhancementCategory: [#NONE] 

@AccessControl.authorizationCheck: #NOT_REQUIRED 

@EndUserText.label: 'Product view'

@Metadata.ignorePropagatedAnnotations: true 

@VDM.viewType: #BASIC 

@Analytics.dataCategory: #DIMENSION 
define view entity ZI_MIC_SM_PROD
  as select from zmic_sm_product
{
  key product_id as ProductId,

      name       as Name,

      category   as Category,

      price      as Price,

      currency   as Currency,

      discount   as Discount
}
