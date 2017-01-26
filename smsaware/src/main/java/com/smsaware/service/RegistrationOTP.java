package com.smsaware.service;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Calendar;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;
import com.smsaware.model.UserOTP;
import com.smsaware.utils.HibernateUtil;
import com.smsaware.utils.SendMail;
import com.smsaware.utils.SendSMS;

public class RegistrationOTP {

	public static void sendOTP(Long userId,String email, Long phone,String name) {
		
	    String otp;
	    Long response;
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
    		Session session = HibernateUtil.getSessionFactory().openSession();
    		Transaction tx = null;
    		UserOTP createdOTP= new UserOTP(userId,otp,otpTime,0);
    		try {
    			
    			tx = session.beginTransaction();
				response = (Long) session.save(createdOTP);
				 if (response == 0) {
			            throw new SQLException("Inserting user OTP failed, no rows affected.");
			        }else{
			        	//sendOTPonMail(otp,email,name);
			        	//sendOTPonPhone(otp,phone);
			        }
				 tx.commit();
			} catch (SQLException e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			}finally {
				session.close();
			}
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
	    
		
		
	}

	private static void sendOTPonMail(String otp,String email,String name) {
		SendMail mail=new SendMail(email,otp,name);
		
	}
	
	private static void sendOTPonPhone(String otp,Long phone) {
		SendSMS sms = new SendSMS();
		String smsResponse=sms.sendSms(otp,phone);
		System.out.println("smsResponse==>>"+smsResponse+"JSON Response==>>"+new Gson().toJson(smsResponse));
		
	}

	
	
	
	

}
