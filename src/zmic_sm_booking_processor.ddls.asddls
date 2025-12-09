
@AccessControl.authorizationCheck: #NOT_REQUIRED 

@EndUserText.label: 'Booking processor entity' 

@Metadata.ignorePropagatedAnnotations: false 

define view entity ZMIC_SM_BOOKING_PROCESSOR as projection on ZMIC_SM_BOOKING 

{ 

key TravelId, 

key BookingId, 

BookingDate, 

CustomerId, 

CarrierId, 

ConnectionId, 

FlightDate, 

FlightPrice, 

CurrencyCode, 

BookingStatus, 

LastChangedAt, 

/* Associations */ 

_Airline, 

_BookingStatus, 

_BookSuppl : redirected to composition child ZMIC_SM_BOOKSUPPL_PROCESSOR, 

_Connections, 

_Customer, 

_Travel : redirected to parent ZMIC_SM_TRAVEL_PROCESSOR 

} 
