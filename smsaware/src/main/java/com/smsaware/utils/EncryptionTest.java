package com.smsaware.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EncryptionTest {

	public static void main(String[] args) throws Exception {
		AESCryptUtil encrytion = new AESCryptUtil();

		//String encryptedString = encrytion.encrypt("smsaware@123");
		//String encryptedString = encrytion.encrypt("ravindracs1986@gmail.com");
		//String dString = encrytion.decrypt("9393BC1IxyW2FKy+hgweY4qSetVFo3/hIh/p3MyXg4U=");
		//System.out.println("encrypted value==>>"+encryptedString);
		//System.out.println("dString value==>>"+dString);
		
		String response="+917299028593";
		String first = response.substring(3);
		System.out.println("first==>>"+first);
		//EncryptionTest tt =new EncryptionTest();
		//System.out.println("Value==>>"+tt.containsDigit(response));
		//String str = "array("9900","AIRTEL","KARNATAKA")";
		/*String s = "ABC( This is to extract )";
        Pattern p = Pattern.compile(".*\\( *(.*) *\\).*");
        Matcher m = p.matcher(s);
        m.find();
        String text = m.group(1);
        System.out.println(text);*/
		
		//String str=""8506"";
		//System.out.println("str==>>"+str);
		
	}

	public final boolean containsDigit(String s) {
	    boolean containsDigit = false;

	    if (s != null && !s.isEmpty()) {
	        for (char c : s.toCharArray()) {
	            if (containsDigit = Character.isDigit(c)) {
	                break;
	            }
	        }
	    }

	    return containsDigit;
	}
	
}
