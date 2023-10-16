public with sharing class AvailableOffersController {
    
    @AuraEnabled
    public static List<Offer> getAvailableOffers() {
        List<Offer> offers = new List<Offer>();

        offers.add(new Offer('Offer 1', '10% discount on all products' , 10, Date.today(), Date.today().addDays(7)));
        offers.add(new Offer('Offer 2', '20% discount on all products' , 20, Date.today().addDays(1), Date.today().addDays(14)));
        return offers;
    }
    public class Offer{

        @AuraEnabled public String Name {get; set;}
        @AuraEnabled public String Description {get; set;}
        @AuraEnabled public Decimal Discount {get; set;}
        @AuraEnabled public Date StartDate {get; set;}
        @AuraEnabled public Date EndDate {get; set;}

        public Offer(String name , String description , Decimal discount, Date startDate, Date endDate){

            this.Name = name;
            this.Description = description;
            this.Discount = discount;
            this.StartDate = startDate;
            this.EndDate = endDate;
        }

        
    }
}