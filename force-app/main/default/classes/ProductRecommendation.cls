public with sharing class ProductRecommendation {
   
    public static List<recommendwrapperclass> recommendprod(){
     
     List<recommendwrapperclass> li = new List<recommendwrapperclass>();
     
     recommendwrapperclass re = new recommendwrapperclass();
     re.ProductName='Ring';
     re.Price=1345670;
     li.add(re);
     return li;
    } 



    public class recommendwrapperclass{
       @AuraEnabled
       public String ProductName{get ; set ;}
       @AuraEnabled
       public Integer Price{get ; set ;}
    }



    
}