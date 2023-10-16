public class TitanCallout {
    
    public static void callout(){
        HttpRequest req = new HttpRequest();
        String username = 'andy.holmes+api@oracle.com';
		String password = 'ckz2YRM*pjg2vfe!urk';

		//Blob headerValue = Blob.valueOf(username + ':' + password);
        //String authorizationHeader = 'BASIC ' +  EncodingUtil.base64Encode(headerValue);
        //req.setHeader('Authorization', authorizationHeader);
		req.setMethod('POST');
		req.setHeader('Content-Type','application/x-www-form-urlencoded');
		req.setEndpoint('https://idcs-9c8b7b7119ef40d781e98781895af205.identity.oraclecloud.com/oauth2/v1/token');
        //String CLIENT_ID = '3MVG9p1Q1BCe9GmBFBQCarlVubMXSgtvu_T9DiOTsXnUe4xtxuEhidfJPnJxeA4WSDNIkrCvJAOTtF77jNt1A';
		//String CLIENT_SECRET = '00BE3A2B1836913FDBD3C9215A9AF228AE992D8C4B8014BD7EBC2FB50430A43D';
        req.setBody('grant_type=password' + '&username='+ username + '&password='+ password + '&scope=offline_access');
        Http http = new Http();
        HTTPResponse response = http.send(req);
        System.debug('Body ' + response.getBody());
        System.debug('Status ' + response.getStatus());
        System.debug('Status code ' + response.getStatusCode());
    }
    

}