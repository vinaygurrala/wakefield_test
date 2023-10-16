/***********************************************************************************************************
    Apex Class Name     : C_LoginController
    Version             : 1.0
    Date Created        : 25-July-2022
    Function            :
    Modification Log    :
-----------------------------------------------------------------------------------------------------------
* Developer                 Date                  Description
* ---------------         -----------             -------------------------------------------------------
* Pooja Rathi             27-July-2022             Version 1.0
* Pooja Rathi			  28-July-2022			   Version 1.2 Modify SetFirstTimeLoginTrue()
***********************************************************************************************************/

public without sharing class C_LoginController
{
    @AuraEnabled
    public static String UserLogin(String phone, String password){
        String startUrl = '';
        // try{
            system.debug(phone);
            system.debug(password);
            //User loginUser = [SELECT Id, Username//UserType_em__c, IsFirstTimeLogin_em__c
            //                  FROM User
            //                  WHERE Username =: phone
            //                 LIMIT 1];*/
            //system.debug('##loginUser ' + loginUser);
            //system.debug('##IsFirstTimeLogin_em__c ' + loginUser.IsFirstTimeLogin_em__c);
            /*if(loginUser.UserType_em__c == 'Trade Owner' && loginUser.IsFirstTimeLogin_em__c == true){
                startUrl = System.Label.EM_TOStart_URL;
            }else if(loginUser.UserType_em__c == 'DSR' && loginUser.IsFirstTimeLogin_em__c == true){
                startUrl = System.Label.EM_DSRStart_URL;
            }else if(loginUser.UserType_em__c == 'Mechanic' && loginUser.IsFirstTimeLogin_em__c == true){
                startUrl = System.Label.EM_MechStart_URL;
            }else if((loginUser.UserType_em__c != 'None' || loginUser.UserType_em__c != ''
                        || loginUser.UserType_em__c != null ) && loginUser.IsFirstTimeLogin_em__c == false){
                startUrl = System.Label.EM_Homepage_URL;
            }else{*/
                startUrl = 'https://exxonmobildemosite.force.com';
            //}
            system.debug(phone);
            system.debug(password);
            system.debug('###startUrl: ' + startUrl);
            system.debug(startUrl);
            System.debug('login enabled : ' + Site.isLoginEnabled());
            // ApexPages.Pagereference pageRef = ApexPages.currentPage();
            

            PageReference pageRef = new PageReference(startUrl);
            System.debug('pageRef ::== ' + pageRef);
            ApexPages.PageReference lgn = Site.login(phone, password, EncodingUtil.urlEncode(pageRef.getUrl(), 'UTF-8'));


            // String pageURL = ApexPages.currentPage().getParameters().get(startUrl);
            // String encodedPageURL = EncodingUtil.urlEncode(pageURL, 'UTF-8');
            System.debug('lgn ::== ' + lgn);
            // ApexPages.PageReference lgn = Site.login(loginUser.Username, password, encodedPageURL);

            // ApexPages.PageReference lgn = Site.login(loginUser.Username, password, startUrl);
            //ApexPages.PageReference lgn = Site.login(loginUser.Username, password, null);
            System.debug('lgn data : ' + lgn);
            system.debug(lgn.getUrl());
            System.Debug('logincontroller');
            if(lgn != null){
                system.debug('getting url'+lgn.getUrl());
                return lgn.getUrl();
            }
            // }else{
            //     throw new CalloutException();
            // }
            return null;

        // }
        // catch (Exception ex){
        //     system.debug('e.getMessagelogin+   '+ex.getMessage());
        //     throw new AuraHandledException(ex.getMessage());
        //  }
         /*finally{
            system.debug('enetering finally '+startUrl);
            return startUrl;
         }*/
    }


 	/*when the user is created set the field 'IsFirstTimeLogin_em__c' as true
    @AuraEnabled
    public static User SetFirsTimeLoginTrue(string phone){
        try{
            List<User> UpdatedUserList = new List<User>();
            List<User> UserList = [SELECT Id, Phone, IsFirstTimeLogin_em__c, Password__c
                                   FROM User
                                   WHERE Phone =: phone
                                   Limit 1];

            if(UserList!= null && UserList.size() > 0){
                for(User U : UserList){
                    U.IsFirstTimeLogin_em__c = true;
                    UpdatedUserList.add(U);
                }
            }
        update UpdatedUserList;
        System.debug('user before password update ' + UserList[0]);
        C_selfRegistrationController.userPasswordUpdate(UserList[0].id,UserList[0].Password__c);
        System.debug('user after password update ' + UserList[0]);
        return UserList[0];
        }
        catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    //Once the user registration is complete set the field 'IsFirstTimeLogin_em__c' as false
    @AuraEnabled
    public static User SetFirsTimeLoginFalse(string phone){
        try{
            List<User> UpdatedUserList = new List<User>();
            List<User> UserList = [SELECT Id, Phone, IsFirstTimeLogin_em__c, Password__c
                                   FROM User
                                   WHERE Phone =: phone
                                   Limit 1];

            if(UserList!= null && UserList.size() > 0){
                for(User U : UserList){
                    U.IsFirstTimeLogin_em__c = false;
                    UpdatedUserList.add(U);
                }
            }
        update UpdatedUserList;
        return UserList[0];
        }
        catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }*/
}