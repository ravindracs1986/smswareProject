package com.smsaware.utils;

import java.security.Key;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class AESCryptUtil {

	private static final String ALGO = "AES";
	private static final byte[] keyValue = new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't', 'S', 'e', 'c', 'r', 'e', 't',
			'K', 'e', 'y' };

	public static String encrypt(String Data) throws Exception {
		/*Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.ENCRYPT_MODE, key);
		byte[] encVal = c.doFinal(Data.getBytes());
		String encryptedValue = new BASE64Encoder().encode(encVal);*/
		
		String base64encodedString = Base64.getEncoder().encodeToString(Data.getBytes("utf-8"));
		return base64encodedString;
	}

	public static String decrypt(String encryptedData) throws Exception {
		/*Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.DECRYPT_MODE, key);
		byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
		byte[] decValue = c.doFinal(decordedValue);
		String decryptedValue = new String(decValue);*/
		byte[] base64decodedBytes = Base64.getDecoder().decode(encryptedData);
		String decryptedValue = new String(base64decodedBytes, "utf-8");
		return decryptedValue;
	}

	private static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, ALGO);
		return key;
	}

	/*public static void main(String[] args) 
    {
		try {
			String encryptedString = AESCryptUtil.encrypt("admin@smsaware.in");
			System.out.println("encrypted value==>>"+encryptedString);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }*/
}
