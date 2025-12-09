CLASS zcl_mic_sm_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS : add_numbers AMDP OPTIONS CLIENT INDEPENDENT IMPORTING VALUE(x)   TYPE i

                                                                          VALUE(y)   TYPE i

                                                                EXPORTING VALUE(res) TYPE i.
    CLASS-METHODS : get_customer_by_id AMDP OPTIONS CDS SESSION CLIENT DEPENDENT

      IMPORTING

                VALUE(cust_id) TYPE zmic_SM_id

      EXPORTING VALUE(e_name)  TYPE string.

      CLASS-METHODS : get_product_mrp AMDP OPTIONS CDS SESSION CLIENT DEPENDENT IMPORTING

                                        VALUE(i_tax) TYPE i

                                      EXPORTING

                                        VALUE(otab)  TYPE zmic_sm_tt_type.

       clASS-meTHODS get_customer_rank for table FUNCTION ZMIC_SM_TF_GET_CUSTOMER_RANK.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_mic_sm_amdp IMPLEMENTATION.
  METHOD add_numbers BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.



    --sql script coding in a normal abap class which is mutated

    res = :x + :y;



  ENDMETHOD.


  METHOD get_customer_by_id BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY

  USING zmic_SM_bpa.



    select company_name into e_name from zmic_SM_bpa where bp_id = :cust_id;



  ENDMETHOD.


    METHOD get_product_mrp BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
    USING zmic_SM_product.
        --declare variables

declare lv_count integer;

declare i integer;

declare lv_mrp bIGINT;

declare lv_price_d integer;



--get all prooducts from db table in a implicit table variable

lt_prod = SELECT * FROM zmic_SM_product;



--get the total records

lv_count := record_count( :lt_prod );



--loop AT each record one by one and calculate price after discount

for i in 1..:lv_count do



        --calculate the dicounted price

        lv_price_d := :lt_prod.price[i] * ( 100 - :lt_prod.discount[i] ) / 100;

        --calculate the mrp

        lv_mrp := :lv_price_d + ( 100 + :i_tax ) / 100;

        --if the mrp is above 5000, ADD extra 10% discount

        IF lv_mrp > 5000 then

        lv_mrp := :lv_mrp * 0.90;

        end if ;



        --Fill the output table to send result

        :otab.insert( (

        :lt_prod.name[i],

        :lt_prod.category[i],

        :lt_prod.price[i],

        :lt_prod.currency[i],

        :lt_prod.discount[i],

        :lv_price_d,

        :lv_mrp

        ), i );



        END FOR ;


            ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
*    zcl_mic_SM_amdp=>add_numbers(
*
*  EXPORTING
*
*  x = 30
*
*  y = 30
*
*  IMPORTING
*
*  res = DATA(result)
*
*  ).

*    out->write(
*
*    EXPORTING
*
*    data = result
*
** name =
*
** RECEIVING
*
** output =
*
*    ).

*       ZCL_MIC_SM_AMDP=>get_customer_by_id(
*         EXPORTING
*           cust_id = '76595924AD0F1FD0B3E8C46413D3BE'
*         IMPORTING
*           e_name  = DATA(RESULT)
*       ).
*
*       OUT->write(
*         EXPORTING
*           data   = RESULT
**           name   =
**         RECEIVING
**           output = DATA(RES)
        zcl_mic_SM_amdp=>get_product_mrp(

EXPORTING

i_tax = 18

IMPORTING

otab = data(result)

).

out->write(

EXPORTING

data = result

* name =

* RECEIVING

* output =

).


  ENDMETHOD.

   METHOD get_customer_rank by dATABASE fuNCTION FOR HDB LANGUAGE SQLSCRIPT

opTIONS rEAD-ONLY using zmic_SM_bpa zmic_SM_so_hdr zmic_SM_so_item.



return select

bpa.client,

bpa.company_name,

sum ( itm.amount ) as total_sales,

itm.currency as currency_code,

rank ( ) OVER ( ordeR BY sum( itm.amount ) desc ) as customer_rank

from zmic_SM_bpa as bpa inner join

zmic_SM_so_hdr as hdr on bpa.bp_id = hdr.buyer

inner join zmic_SM_so_item as itm on

itm.order_id = hdr.order_id

group by bpa.client,

bpa.company_name, itm.currency;



ENDMETHOD.
ENDCLASS.
