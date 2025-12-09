@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel Processor'

@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true 
define root view entity ZMIC_SM_TRAVEL_PROCESSOR
  as projection on ZMIC_SM_TRAVEL

{

  key TravelId,

      AgencyId,

      CustomerId,

      BeginDate,

      EndDate,

      BookingFee,

      TotalPrice,

      CurrencyCode,

      Description,

      OverallStatus,

      CreatedBy,

      CreatedAt,

      LastChangedBy,

      LastChangedAt,

      /* Associations */

      _Agency,

      _Booking : redirected to composition child ZMIC_SM_BOOKING_PROCESSOR,

      _Currency,

      _Customer,

      _Status

}
