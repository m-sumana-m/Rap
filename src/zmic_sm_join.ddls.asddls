@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'entity joint'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMIC_SM_JOIN as select from ZMIC_SM_BPA_ENTITY as bpa 

inner join zmic_sm_so_hdr as So 

on bpa.BpId = So.buyer 

{ 

key bpa.CompanyName , 

bpa.Country, 

@Semantics.amount.currencyCode: 'CurrencyCode' 

sum(So.gross_amount) as total_amount, 

So.currency_code as CurrencyCode 

} group by bpa.CompanyName , 

bpa.Country, So.currency_code 
