package com.smsaware.utils;

public class DataBaseQuerys {

	public final static String getUserByEmail="select * from user_registration where email =? and password=?";
	public final static String getUserByPhone="select * from user_registration where phone =? and password=?";
	public final static String registerUser="insert into user_registration(NAME,BIRTH_DATE,GENDER,NATIONALITY,WEBSITE,NO_OF_SMS,EMAIL,PASSWORD,PHONE) values(?,?,?,?,?,?,?,?,?)";
	public final static String registerAddress="insert into Address(USER_ADDRESS,STREET,CITY,STATE,ZIPCODE,userId) values(?,?,?,?,?,?)";
	public final static String checkUser="select * from user_registration where email =? or phone=?";
	
}
