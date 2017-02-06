package com.smsaware.utils;

public class EncryptionTest {

	public static void main(String[] args) throws Exception {
		AESCryptUtil encrytion = new AESCryptUtil();

		String encryptedString = encrytion.encrypt("smsaware@123");
		//String dString = encrytion.decrypt("9393BC1IxyW2FKy+hgweY4qSetVFo3/hIh/p3MyXg4U=");
		System.out.println("encrypted value==>>"+encryptedString);
		//System.out.println("dString value==>>"+dString);
		
	}

}
