public class B2B_ProductDetails {
    @AuraEnabled public string Name{get; set;}
     @AuraEnabled public string ImageUrl{get; set;}
     @AuraEnabled public string Price{get; set;}
     

     public B2B_ProductDetails(String name , String ImageURL , String Price)
     {
         this.Name=name;
         this.ImageUrl=ImageURL;
         this.Price=Price;
     }
    }