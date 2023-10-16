public class JSON2Apex {
	/*public static void parseProductJSON() {
        string productJSON=' [{"Name" : "Colosseum Blue Topaz Ring","ImageURL" : "http://static.cdn.responsys.net/i5/responsysimages/content/apacpoc013z0/Colosseum%2520Blue%2520Topaz%2520Ring_1.jpg","Price" : "270162"},{"Name" : "An Infinite Arc Ring","ImageURL" : "http://static.cdn.responsys.net/i5/responsysimages/content/apacpoc013z0/An%2520Infinite%2520Arc%2520Ring_1.jpg","Price" : "104701"}]';
        List<Product2> prod =(List<Product2>) System.JSON.deserialize(productJSON,List<Product2>.class);
		insert prod;
	}*/
	@AuraEnabled
	public static List<B2B_ProductDetails> parseProductJSON() 
    {
    	string productJSON=' [{"Name" : "Colosseum Blue Topaz Ring","ImageURL" : "http://static.cdn.responsys.net/i5/responsysimages/content/apacpoc013z0/Colosseum%2520Blue%2520Topaz%2520Ring_1.jpg","Price" : "270162"},{"Name" : "An Infinite Arc Ring","ImageURL" : "http://static.cdn.responsys.net/i5/responsysimages/content/apacpoc013z0/An%2520Infinite%2520Arc%2520Ring_1.jpg","Price" : "104701"}]';
        List<B2B_ProductDetails> prodDetails =(List<B2B_ProductDetails>) System.JSON.deserialize(productJSON,List<B2B_ProductDetails>.class);
		system.debug('productJSON-->'+prodDetails);
		return prodDetails;
	}	

   

	/*@AuraEnabled
    public static List<recommendwrapperclass> recommendprod(){
     System.debug('TesingNow');
        List<recommendwrapperclass> li = new List<recommendwrapperclass>();
        
        recommendwrapperclass re = new recommendwrapperclass();
        re.ProductName='TestRing';
        re.Price=1345670;
        re.ProductName='TestBangles';
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
       }*/
}