@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Supplement processor'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZMIC_SM_BOOKSUPPL_PROCESSOR
  as projection on ZMIC_SM_BOOKSUPPL

{

  key TravelId,

  key BookingId,

  key BookingSupplementId,

      SupplementId,

      Price,

      CurrencyCode,

      LastChangedAt,

      /* Associations */

      _Booking : redirected to parent ZMIC_SM_BOOKING_PROCESSOR,

      _Supplement,

      _SupplementText,

      _Travel  : redirected to ZMIC_SM_TRAVEL_PROCESSOR

}
