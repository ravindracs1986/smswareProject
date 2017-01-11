package com.smsaware.service;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import com.smsaware.utils.Database;

public class RegistrationOTP {

	public static void sendOTP(Long userId,String email, Long phone) {
		
	    String otp;
	    StringBuilder generatedToken = new StringBuilder();
	    try {
            SecureRandom number = SecureRandom.getInstance("SHA1PRNG");
            // Generate 20 integers 0..20
            for (int i = 0; i < 6; i++) {
                generatedToken.append(number.nextInt(9));
            }
           
            otp=generatedToken.toString();
            System.out.println("Generated OTP"+otp);
            Calendar cale=Calendar.getInstance();
            java.util.Date utilDate = cale.getTime();
    		java.sql.Date otpTime = new java.sql.Date(utilDate.getTime());
    		Database dataBase = new Database();
    		Connection conn=null;
    		PreparedStatement statement = null;
    		conn =dataBase.getConnection();
    		try {
				statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.otpQuery);
				statement.setLong(1, userId);
				statement.setString(2, otp);
				statement.setDate(3, otpTime);
				statement.setInt(4,0);
				int resultValue=statement.executeUpdate();
				 if (resultValue == 0) {
			            throw new SQLException("Inserting user OTP failed, no rows affected.");
			        }else{
			        	sendOTPonMail(otp,email);
			        	sendOTPonPhone(otp,phone);
			        }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
	    
		
		
	}

	private static void sendOTPonMail(String otp,String email) {
		// TODO Auto-generated method stub
		
	}
	
	private static void sendOTPonPhone(String otp,Long phone) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	

}
