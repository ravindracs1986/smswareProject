package com.smsaware.utils;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class AESCryptUtil {

	 private static final String ALGORITHM = "AES";
	    private static final String KEY = "1Hbfh667adfDEJ78";
	    
	    @SuppressWarnings("restriction")
		public static String encrypt(String value) throws Exception
	    {
	        Key key = generateKey();
	        Cipher cipher = Cipher.getInstance(AESCryptUtil.ALGORITHM);
	        cipher.init(Cipher.ENCRYPT_MODE, key);
	        byte [] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));
	        String encryptedValue64 = new BASE64Encoder().encode(encryptedByteValue);
	        return encryptedValue64;
	               
	    }
	    
	    @SuppressWarnings("restriction")
		public static String decrypt(String value) throws Exception
	    {
	    	Key key = generateKey();
	        Cipher c = Cipher.getInstance(AESCryptUtil.ALGORITHM);
	        c.init(Cipher.DECRYPT_MODE, key);
	        String decordedValue = new BASE64Decoder().decodeBuffer(value).toString().trim();
	        System.out.println("This is Data to be Decrepted"+decordedValue);
	        return decordedValue;
	                
	    }
	    
	    private static Key generateKey() throws Exception 
	    {
	        Key key = new SecretKeySpec(AESCryptUtil.KEY.getBytes(),AESCryptUtil.ALGORITHM);
	        return key;
	    }
	
	
}
