global with sharing class SalesOrderAPI {

 @AuraEnabled    
 global static void sendSalesOrder(){
     try{  
     String payload = '';
     Http http = new Http();
     HttpRequest request = new HttpRequest();
     String endPoint= 'https://api.wakefieldcanada.net/dev/sales-order-poc/api/salesOrder';
     request.setendpoint(endPoint);
     request.setMethod('POST');
     request.setHeader('Content-Type','application/json');
     
         payload = '{\"SalesOrder\": {\r\n        \"CustAccount\": \"151006\",\r\n        \"SalesOriginId\": \"ESHOP\",\r\n        \"eShopOrderID\": \"12345\",\r\n        \"ShipToAX_ID\": \"null\",\r\n        \"BillToAX_ID\": \"null\",\r\n        \"Currency\": \"null\",\r\n        \"PurchOrderFormNum\": \"9000542233\",\r\n        \"PromotionCode\": \"123456789\",\r\n        \"OrderTotal\": \"1100\",\r\n        \"Payment\": {\r\n            \"Credit_OnAccount\": \"1045\",\r\n            \"Credit_Card\": \"1234\",\r\n            \"PayViaCreditCard\": \"Pay via Credit card\",\r\n            \"ReferenceNo\": \"123456789\"\r\n        },\r\n        \"SalesLine\": [{                \"CustomerLineNum\": \"001\",\r\n          \"ItemId\": \"020143A\",\r\n                \"SalesPrice\": \"13146\",\r\n                \"SalesQty\": \"1\",\r\n                \"SalesUnit\": \"CA\",\r\n                \"tax\": {\r\n                    \"EHTC\": \"14\",\r\n                    \"EHTP\": \"null\",\r\n                    \"provincialTax\": \"12\",\r\n                    \"GST\": \"11\"\r\n                }\r\n            },\r\n            {  \"CustomerLineNum\": \"002\",\r\n                \"ItemId\": \"020143A\",\r\n                \"SalesPrice\": \"131\",\r\n                \"SalesQty\": \"1\",\r\n                \"SalesUnit\": \"CA\",\r\n                \"tax\": {\r\n                    \"EHTC\": \"14\",\r\n                    \"EHTP\": \"null\",\r\n                    \"provincialTax\": \"150\",\r\n                    \"GST\": \"14\"\r\n                }\r\n            },\r\n            {\r\n                \"CustomerLineNum\": \"003\",\r\n                \"ItemId\": \"020143A\",\r\n                \"SalesPrice\": \"131\",\r\n                \"SalesQty\": \"1\",\r\n                \"SalesUnit\": \"CA\",\r\n                \"tax\": {\r\n                    \"EHTC\": \"18\",\r\n                    \"EHTP\": \"null\",\r\n                    \"provincialTax\": \"12\",\r\n                    \"GST\": \"11\"\r\n                }\r\n            }\r\n        ]\r\n    }\r\n}';
     
         system.debug('payload---->'+payload);
    // SalesOrderWrap sales = (SalesOrderWrap)JSON.deserialize(payload, SalesOrderWrap.class);
    // system.debug('sales---->'+sales);
     // JSON.serialize(sales)
    // request.setBody(JSON.serialize(sales));
    request.setBody(payload);
     
     HttpResponse response = http.send(request);
     
     system.debug('Response StatusCOde--->'+response.getStatusCode());
     system.debug('Response body--->'+response.getBody());   
     }catch (Exception e){
         System.debug('Error: '+ e.getMessage());
     }
 }
   global class SalesOrderWrap {
	@AuraEnabled	public String CustAccount {get;set;} 
	@AuraEnabled	public String SalesOriginId {get;set;} 
	@AuraEnabled	public String eShopOrderID {get;set;} 
	@AuraEnabled	public String ShipToAX_ID {get;set;} 
	@AuraEnabled	public String BillToAX_ID {get;set;} 
	@AuraEnabled	public String Currency_Z {get;set;} // in json: Currency
	@AuraEnabled	public String PurchOrderFormNum {get;set;} 
	@AuraEnabled	public String PromotionCode {get;set;} 
	@AuraEnabled	public String OrderTotal {get;set;} 
	@AuraEnabled	public PaymentWrap Payment {get;set;} 
	@AuraEnabled	public List<SalesLineWrap> SalesLine {get;set;} 
   }
    global class PaymentWrap {
	@AuraEnabled	public String Credit_OnAccount {get;set;} 
	@AuraEnabled	public String Credit_Card {get;set;} 
	@AuraEnabled	public String PayViaCreditCard {get;set;} 
	@AuraEnabled	public String ReferenceNo {get;set;}      
    }
    
    global class SalesLineWrap {
	@AuraEnabled	public String CustomerLineNum {get;set;} 
	@AuraEnabled	public String ItemId {get;set;} 
	@AuraEnabled	public String SalesPrice {get;set;} 
	@AuraEnabled	public String SalesQty {get;set;} 
	@AuraEnabled	public String SalesUnit {get;set;} 
	@AuraEnabled	public TaxWrap tax {get;set;} 
    }
    
    global class TaxWrap {
	@AuraEnabled	public String EHTC {get;set;} 
	@AuraEnabled	public String EHTP {get;set;} 
	@AuraEnabled	public String provincialTax {get;set;} 
	@AuraEnabled	public String GST {get;set;}     
    }

    
}