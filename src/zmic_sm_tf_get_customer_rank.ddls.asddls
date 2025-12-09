@EndUserText.label: 'Get Customer rank'
@ClientHandling :{ 

type :#CLIENT_DEPENDENT, 

algorithm: #SESSION_VARIABLE, 

clientSafe: true 

}
define table function ZMIC_SM_TF_GET_CUSTOMER_RANK
returns {
  client : abap.clnt; 

company_name: abap.char(256); 

total_sales: abap.curr(15,2); 

currency_code: abap.cuky(5); 

customer_rank: abap.int4;  
  
}
 

implemented by method zcl_mic_sm_amdp=>get_customer_rank; 