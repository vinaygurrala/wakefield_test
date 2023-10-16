public class HttpPostCalloutSample {

  // Pass in the endpoint to be used using the string url
  public String getPostCalloutResponseContents(String url) {

    // Instantiate a new Http object
    Http h = new Http();

    // Instantiate a new HTTP request
    // Specify request properties such as the endpoint, the POST method, etc. 
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('POST');
    req.setHeader('Content-Type', 'application/json');
    req.setBody('{Your_JSON_Content}');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    return res.getBody();
  }
}