public without sharing class ContactController {
    @AuraEnabled
    public static Contact createContact(String firstName, String lastName, String email){
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Email = email;
        con.AccountId = [Select id from Account where name = 'Demo Account'][0].Id;
        con.Enable_as_Buyer__c = true;

        insert con;

        return con;
    }

}