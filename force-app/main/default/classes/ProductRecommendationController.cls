public with sharing class ProductRecommendationController{
@AuraEnabled(cacheable=true)
public static List<Product2> getRecommendedProducts(Id productId) {

Product2 product =[SELECT Id, Recommended_Products__c from Product2 where Id = :productId];

List<String> recommendedProductIds = product.Recommended_Products__c != null ? new List<String>(product.Recommended_Products__c.split(';')) : new List<String>();

List<Id> recommendedIds = new List<Id>();
for (String recommendedId : recommendedProductIds){
  recommendedIds.add(Id.valueOf(recommendedId));
}

List<Product2> recommendedProducts = [SELECT Id, Name from Product2 where Id IN :recommendedIds];

return recommendedProducts;
}
}