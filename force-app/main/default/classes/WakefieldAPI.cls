@RestResource(urlMapping='/authenticate')
global with sharing class WakefieldAPI {
    
    global class AuthRequest{
        public String username { get; set;}
        public String password { get; set;}
    }
    
    global class AuthResponse{
        public String message { get; set;}
        public String personaDetail { get; set;}
    }
    
    global class UserRecord{
        public String Id {get; set;}
    //  public String Password__c {get; set;}
    //  public String PersonaDetail__c {get; set;}
    }
    
    @HttpGet
    global static AuthResponse getwakefieldPass(){
        
     AuthRequest request = (AuthRequest)JSON.deserialize(RestContext.request.requestBody.toString(), AuthRequest.class);
     System.debug('The testing Data = '+request);
     String username = request.username;
     String password = request.password;
        
      //  AuthResponse response = new AuthResponse();
        
     Map<String, String> userRecordMap = getUserRecord(username); 
        
     AuthResponse response = new AuthResponse();
        
        response.personaDetail = 'Direct User';
        
        if (userRecordMap != null && userRecordMap.get('Id') == password){
            response.message = 'Authenticated';
         // response.personaDetail = userRecordMap.get('Persona__c');
            
        }else{
            RestResponse res = RestContext.response;
            res.statusCode = 401;
            response.message = 'Invalid username or password.';
        }
  //     if (!records.isEmpty()){
  //         return JSON.serialize(records);
  //         return 'Authenticated';
  //     }else{
  //         return 'No records found for the given username.';
  //     }
  //     }else{
  //     RestResponse res = RestContext.response;
  //     res.statusCode = 401;
  //     return 'Unauthorized';
  //     }
       return response;      
}
    
     global static Map<String, String> getUserRecord(String username){
      
        List<User> records = [Select Id FROM User Where Username = :username LIMIT 1];
        
        Map<String, String> userRecordMap = new Map<String, String>();
        
        if (!records.isEmpty()){
            userRecordMap.put(
            'Id',records[0].Id);
      //      userRecordMap.put('Persona__c',records[0].Persona__c);
       }
        return userRecordMap.isEmpty() ? null : userRecordMap; 
       }

}