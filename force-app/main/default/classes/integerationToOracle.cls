public without sharing class integerationToOracle {
     @AuraEnabled
      public static RecommendationPromotionResponse getResponse(){
  
        String access_token = '';
        String Apassword = 'rdz-ERG8kjb*zew7nqh';
        String AuserName = 'andy.holmes+api@oracle.com';
        String Ascope = 'offline_access https://indiasales.cxunity.ocs.oraclecloud.com/cxunity';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://idcs-9c8b7b7119ef40d781e98781895af205.identity.oraclecloud.com/oauth2/v1/token');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setHeader('Authorization', 'Basic Q1hVTklUWVNJLWluZGlhc2FsZXNfQVBQSUQ6Njg2YWVjZTQtMmM3ZC00ZWY3LThkOGYtNGVjMDAxMzc1OGQy');
        String payload = 'grant_type=password'+'&scope='+EncodingUtil.urlEncode(Ascope,'UTF-8')+'&username='+EncodingUtil.urlEncode(Ausername,'UTF-8')+'&password='+EncodingUtil.urlEncode(apassword,'UTF-8');
        system.debug('payload---->'+payload);
        request.setBody(payload);
        HttpResponse response = http.send(request);
        system.debug('Token StatusCOde--->'+response.getStatusCode());
        system.debug('Token body--->'+response.getBody());
        if (response.getStatusCode() == 200) {      
            Map<String,Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            access_token = (String)responseMap.get('access_token');
            system.debug('Access Token' +access_token);
             return  getRecommendation(access_token );
        }
        else{
            return null;
        }
  
  }
  
  
  public static RecommendationPromotionResponse getRecommendation(String token){
        String payload = '';
        Http newhttp = new Http();
        HttpRequest newrequest = new HttpRequest();
        newrequest.setEndPoint('https://indiasales.cxunity.ocs.oraclecloud.com/api-data/v1/8e78ffcfdda14e89883b7c0c495b09e4/data/query/execute?limit=5');
        newrequest.setMethod('POST');
        newrequest.setHeader('Content-Type','application/json');
        newrequest.setHeader('Accept','application/json');
        newrequest.setHeader('Authorization', 'Bearer' + ' ' +token);
        String userID = UserInfo.getUserId();
        if(userID == '0055f00000A02KIAAZ'){
             payload  = '{\r\n        \"MCPSQuery\": {\r\n            \"tenantId\": 0,\r\n            \"name\": \"DataViewerQuery\",\r\n            \"uniqueId\": \"DataViewerQuery\",\r\n            \"operation\": {\r\n                \"ctype\": \".SetOperation\",\r\n                \"name\": \"DataViewerQuery\",\r\n                \"uniqueId\": \"DataViewerQuery\",\r\n                \"operands\": [{\r\n                    \"ctype\": \".ObjectSet\",\r\n                    \"name\": \"T1\",\r\n                    \"objectName\": \"Recommendations\",\r\n                    \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Name\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Image\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Price\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"SKUID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Code\"\r\n                    }],\r\n                    \"distinct\": false,\r\n                    \"sortBy\": [],\r\n                    \"criteria\": {\r\n                    \"ctype\": \".Criteria\",\r\n                    \"operator\": \"EQUALS\",\r\n                    \"operands\": [{\r\n                        \"ctype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"ctype\": \".StaticAttribute\",\r\n                        \"data\": \"satyam@zoya.titan.dev\"\r\n                    }]\r\n                }\r\n                }],\r\n                \"operator\": \"INTERSECTION\",\r\n                \"distinct\": false,\r\n                \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Name\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Image\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Price\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"SKUID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Code\"\r\n                    }],\r\n                \"joinConditions\": []\r\n            },\r\n            \"type\": \"DW\"\r\n        }\r\n    }';

        }
        else{
             payload  = '{\r\n        \"MCPSQuery\": {\r\n            \"tenantId\": 0,\r\n            \"name\": \"DataViewerQuery\",\r\n            \"uniqueId\": \"DataViewerQuery\",\r\n            \"operation\": {\r\n                \"ctype\": \".SetOperation\",\r\n                \"name\": \"DataViewerQuery\",\r\n                \"uniqueId\": \"DataViewerQuery\",\r\n                \"operands\": [{\r\n                    \"ctype\": \".ObjectSet\",\r\n                    \"name\": \"T1\",\r\n                    \"objectName\": \"Recommendations\",\r\n                    \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Name\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Image\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Price\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"SKUID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Code\"\r\n                    }],\r\n                    \"distinct\": false,\r\n                    \"sortBy\": [],\r\n                    \"criteria\": {\r\n                    \"ctype\": \".Criteria\",\r\n                    \"operator\": \"EQUALS\",\r\n                    \"operands\": [{\r\n                        \"ctype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"ctype\": \".StaticAttribute\",\r\n                        \"data\": \"ssutaram@zoya.titan.dev\"\r\n                    }]\r\n                }\r\n                }],\r\n                \"operator\": \"INTERSECTION\",\r\n                \"distinct\": false,\r\n                \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Email\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Name\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Image\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Price\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"SKUID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Product_Code\"\r\n                    }],\r\n                \"joinConditions\": []\r\n            },\r\n            \"type\": \"DW\"\r\n        }\r\n    }';
        }
        newrequest.setBody(payload);    
        HttpResponse newresponse = newhttp .send(newrequest);
        system.debug('Recommendation StatusCOde--->'+newresponse.getStatusCode());
        system.debug('Recommendation--->'+newresponse.getBody());
        if (newresponse.getStatusCode() == 200) {      
            Map<String,Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(newresponse.getBody());
            List<Object> dataList = (List<Object>)responseMap.get('data');
            System.debug('Data---->'+dataList  );
            return getPromotion(token,dataList);
        }
        else{
            return null;
        }
  
  }
  
  public static RecommendationPromotionResponse getPromotion(String token,List<Object> recommendation){
        String payload = '';
        Http newhttp = new Http();
        HttpRequest newrequest = new HttpRequest();
        newrequest.setEndPoint('https://indiasales.cxunity.ocs.oraclecloud.com/api-data/v1/8e78ffcfdda14e89883b7c0c495b09e4/data/query/execute?limit=5');
        newrequest.setMethod('POST');
        newrequest.setHeader('Content-Type','application/json');
        newrequest.setHeader('Accept','application/json');
        newrequest.setHeader('Authorization', 'Bearer' + ' ' +token);
       // String payload = '{\r\n        \"MCPSQuery\": {\r\n            \"tenantId\": 0,\r\n            \"name\": \"DataViewerQuery\",\r\n            \"uniqueId\": \"DataViewerQuery\",\r\n            \"operation\": {\r\n                \"ctype\": \".SetOperation\",\r\n                \"name\": \"DataViewerQuery\",\r\n                \"uniqueId\": \"DataViewerQuery\",\r\n                \"operands\": [{\r\n                    \"ctype\": \".ObjectSet\",\r\n                    \"name\": \"T1\",\r\n                    \"objectName\": \"MasterCustomerRecommendation\",\r\n                    \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                    \"distinct\": false,\r\n                    \"sortBy\": [],\r\n                    \"criteria\": {\r\n                    \"ctype\": \".Criteria\",\r\n                    \"operator\": \"EQUALS\",\r\n                    \"operands\": [{\r\n                        \"ctype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"ctype\": \".StaticAttribute\",\r\n                        \"data\": \"1_1\"\r\n                    }]\r\n                }\r\n                }],\r\n                \"operator\": \"INTERSECTION\",\r\n                \"distinct\": false,\r\n                \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                \"joinConditions\": []\r\n            },\r\n            \"type\": \"DW\"\r\n        }\r\n    }';
        String userID = UserInfo.getUserId();
        if(userID == '0055f00000A02KIAAZ'){
         payload = '{\r\n        \"MCPSQuery\": {\r\n            \"tenantId\": 0,\r\n            \"name\": \"DataViewerQuery\",\r\n            \"uniqueId\": \"DataViewerQuery\",\r\n            \"operation\": {\r\n                \"ctype\": \".SetOperation\",\r\n                \"name\": \"DataViewerQuery\",\r\n                \"uniqueId\": \"DataViewerQuery\",\r\n                \"operands\": [{\r\n                    \"ctype\": \".ObjectSet\",\r\n                    \"name\": \"T1\",\r\n                    \"objectName\": \"MasterCustomerRecommendation\",\r\n                    \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                    \"distinct\": false,\r\n                    \"sortBy\": [],\r\n                    \"criteria\": {\r\n                    \"ctype\": \".Criteria\",\r\n                    \"operator\": \"EQUALS\",\r\n                    \"operands\": [{\r\n                        \"ctype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"ctype\": \".StaticAttribute\",\r\n                        \"data\": \"1_1\"\r\n                    }]\r\n                }\r\n                }],\r\n                \"operator\": \"INTERSECTION\",\r\n                \"distinct\": false,\r\n                \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                \"joinConditions\": []\r\n            },\r\n            \"type\": \"DW\"\r\n        }\r\n    }';

        }
        else{
         payload = '{\r\n        \"MCPSQuery\": {\r\n            \"tenantId\": 0,\r\n            \"name\": \"DataViewerQuery\",\r\n            \"uniqueId\": \"DataViewerQuery\",\r\n            \"operation\": {\r\n                \"ctype\": \".SetOperation\",\r\n                \"name\": \"DataViewerQuery\",\r\n                \"uniqueId\": \"DataViewerQuery\",\r\n                \"operands\": [{\r\n                    \"ctype\": \".ObjectSet\",\r\n                    \"name\": \"T1\",\r\n                    \"objectName\": \"MasterCustomerRecommendation\",\r\n                    \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                    \"distinct\": false,\r\n                    \"sortBy\": [],\r\n                    \"criteria\": {\r\n                    \"ctype\": \".Criteria\",\r\n                    \"operator\": \"EQUALS\",\r\n                    \"operands\": [{\r\n                        \"ctype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"ctype\": \".StaticAttribute\",\r\n                        \"data\": \"1_2\"\r\n                    }]\r\n                }\r\n                }],\r\n                \"operator\": \"INTERSECTION\",\r\n                \"distinct\": false,\r\n                \"outputAttributes\": [{\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"ID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"PromotionID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"MasterCustomerID\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Rank\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Promo_Description\"\r\n                    }, {\r\n                        \"atype\": \".ReferenceAttribute\",\r\n                        \"tableName\": \"T1\",\r\n                        \"attributeName\": \"Score\"\r\n                    }],\r\n                \"joinConditions\": []\r\n            },\r\n            \"type\": \"DW\"\r\n        }\r\n    }';
        }
        newrequest.setBody(payload);    
        HttpResponse newresponse = newhttp.send(newrequest);
        system.debug('Promotion StatusCOde--->'+newresponse.getStatusCode());
        system.debug('Promotion Recommendation--->'+newresponse.getBody());
        if (newresponse.getStatusCode() == 200) {      
            Map<String,Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(newresponse.getBody());
            List<Object> promotion= (List<Object>)responseMap.get('data');
            System.debug('Data---->'+promotion);
            return dataformationforRecommendationAndPromotion(recommendation,promotion);
        }
        else{
            return null;
        }
  
  }
  
 public static RecommendationPromotionResponse  dataformationforRecommendationAndPromotion(List<Object> recommendation,List<Object> promotion){
  List<RecommendationClass> recommendclass = new List<RecommendationClass>();
  List<PromotionClass> promotionclass = new List<PromotionClass>();
  RecommendationPromotionResponse sendresponse = new RecommendationPromotionResponse ();
  if(recommendation != null){
       for(Object recomm:recommendation){
            List<Object> objMap = (List<Object>) recomm;
            RecommendationClass recommend = new RecommendationClass();            
            recommend.productName = (String)objMap.get(2);
            recommend.price= Integer.valueof(objMap.get(5));
            recommend.productURL= (String)objMap.get(3);
            recommendclass.add(recommend);           
       }
   
   }
   
   if(promotion!= null){
       for(Object promo:promotion){
            List<Object> objMap = (List<Object>) promo;
            PromotionClass promotions = new PromotionClass();
            promotions.promotiontName = (String)objMap.get(4);
            promotionclass.add(promotions);
       }
   
   }
      sendresponse.recommendation = recommendclass;
      sendresponse.promotion = promotionclass;
      
      System.debug(sendresponse);
      return sendresponse;

  }
  
  public class RecommendationPromotionResponse {
  @AuraEnabled public RecommendationClass[] recommendation;
  @AuraEnabled public PromotionClass[] promotion;
  
    }

    public class RecommendationClass{
      @AuraEnabled public String productName;
      @AuraEnabled public Integer price;
      @AuraEnabled public String productURL;

    }

    public class PromotionClass{
      @AuraEnabled public String promotiontName;
      @AuraEnabled public String description;

    }

}