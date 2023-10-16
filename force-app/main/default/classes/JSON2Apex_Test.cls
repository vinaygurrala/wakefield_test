@isTest
public with sharing class JSON2Apex_Test {
    static testMethod void testParse() {
		String json = '{\"header\":[{\"name\":\"t1.id\",\"type\":\"string\"},{\"name\":\"t1.email\",\"type\":\"string\"},{\"name\":\"t1.product_name\",\"type\":\"string\"},{\"name\":\"t1.product_image\",\"type\":\"string\"},{\"name\":\"t1.score\",\"type\":\"bigint\"},{\"name\":\"t1.price\",\"type\":\"bigint\"}]}';
		JSON2Apex obj = JSON2Apex.parse(json);
		System.assert(obj != null);
	}
}