public with sharing class SearchController {

    @AuraEnabled(Cacheable = true)
    public static List<Product2> retriveProducts(String strProdName) {
        strProdName = '%' + strProdName + '%';
        List<Product2> lstProd = [SELECT Name, StockKeepingUnit, ProductCode FROM Product2 WHERE StockKeepingUnit LIKE :strProdName];
        return lstProd; 
    }
    @AuraEnabled
    public static List<recommendwrapperclass> recommendprod(){
     System.debug('satyam11');
        List<recommendwrapperclass> li = new List<recommendwrapperclass>();
        
        recommendwrapperclass re = new recommendwrapperclass();
        re.ProductName='Ring';
        re.Price=1345670;
        re.ProductName='Bangles';
        re.Price=487650;
        li.add(re);
        System.debug('satyam18'+li);
        return li;
       } 
   
   
       public class recommendwrapperclass{
          @AuraEnabled
          public String ProductName{get ; set ;}
          @AuraEnabled
          public Integer Price{get ; set ;}
       }

}