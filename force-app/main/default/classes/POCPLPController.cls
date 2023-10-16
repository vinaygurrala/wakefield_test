public class POCPLPController {
 
  
    public static List<Product2> combineProducts() {
        Map<String, Product2> productMap = new Map<String, Product2>();
		List<Product2> products = [SELECT  ID ,Name,SubBrand__c,Grade__c
                                        FROM Product2
                                     where name <> null and SubBrand__c <> null and Grade__c <> null ];
        for (Product2 product : products) {
            String key = product.Name + product.SubBrand__c + product.Grade__c;

            if (productMap.containsKey(key)) {
                Product2 existingProduct = productMap.get(key);
                existingProduct.Name += product.Name;
                existingProduct.SubBrand__c += product.SubBrand__c;
                existingProduct.Grade__c += product.Grade__c;
            } else {
                productMap.put(key, product.clone());
            }
        }
		system.debug('line 67 >>>'+productMap);
        system.debug('line 68 >>>'+productMap.size());
        return productMap.values();
    }
//

}