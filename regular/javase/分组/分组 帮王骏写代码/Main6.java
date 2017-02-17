package com.bestpay.http;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main6 {
	public static void main(String[] args) throws Exception {
		String xx = "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title></title></head><form id = \"form\" action=\"www.bestpay.comc.n\" method=\"post\"><input type=\"hidden\" name=\"Plain\" id=\"Plain\" value=\"TranAbbr=IPSR|AcqSsn=000000013946|MercDtTm=20141205142507|TermSsn=141205631001441430|RespCode=00000000|TermCode=|MercCode=9999998885000009404|TranAmt=0.01|SettDate=20141205\"/><input type=\"hidden\" name=\"Signature\" id=\"Signature\" value=\"551797086EA1265531B2E0805C346CBC644C5F49AD1CFFF97B641BA76A10CF0A70EB0B82D4356938DBFDDC294330BF2A6FD4501D7E3AA365423AB66C0EB3F8D7C8BF1C452D4598640036E3A349F1FEE4BA0652FEFF861CE70907496C810A5246736502E25C577F6D72C85624A9F83B8B6299090B8BAA90199329BF9CC06B2315\"/><input type=\"hidden\" name=\"transName\" id=\"transName\" value=\"IPSR\"/></form></body><script type=\"text/javascript\">setTimeout('document.all.form.submit()',1);</script></html>";
		System.out.println(xx);
		Map<String, String> response = parseHtml(xx);
		System.out.println(response.get("Plain"));
		System.out.println(response.get("Signature"));
		System.out.println(response.get("transName"));
		
	}
	
	public static Map<String, String> parseHtml (String message) {
		Map<String, String> res = new HashMap<String, String>();
		Pattern p = Pattern.compile("(?<=id {0,2}= {0,2}\"Plain\" {0,2}value=\")(.*)(?=\"/>.{10,40}Signature)");
		Matcher m = p.matcher(message);
		String middle = new String();
		while (m.find()) {
			middle = m.group(1);
			System.out.println(middle);
			res.put("Plain", middle);
		}
		
		Pattern p2 = Pattern.compile("(?<=id {0,2}= {0,2}\"Signature\" {0,2}value=\")(.*)(?=\"/>.{10,40}transName)");
		Matcher m2 = p2.matcher(message);
		String middle2 = new String();
		while (m2.find()) {
			middle2 = m2.group(1);
			System.out.println(middle2);
			res.put("Signature", middle2);
		}
		
		Pattern p3 = Pattern.compile("(?<=id {0,2}= {0,2}\"transName\" {0,2}value=\")(.*)(?=\"/></form)");
		Matcher m3 = p3.matcher(message);
		String middle3 = new String();
		while (m3.find()) {
			middle3 = m3.group(1);
			System.out.println(middle3);
			res.put("transName", middle3);
		}
		return res;
	}
}
