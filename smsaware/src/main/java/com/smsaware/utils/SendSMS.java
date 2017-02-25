package com.smsaware.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import com.google.gson.Gson;

public class SendSMS {

	private static final String SM_SSENDER_COMMUNICATION_ID = "SMSsenderCommunicationId";
	private static final String SM_SMAIN_URL = "SMSmainUrl";
	private static final String SM_SROUTE = "SMSroute";
	private static final String SM_SSENDER_ID = "SMSsenderId";
	private static final String SM_SAUTHKEY = "SMSauthkey";

	public String sendSms(String otp, Long phone,boolean isotp) {
		 String apiResponse="Exception";
		 String senderId=null;
		try {
			 String authkey = PropertiesManager.getInstance().getValue(SM_SAUTHKEY);
			 String mobiles = "91"+Long.toString(phone);
			 if(isotp){
				 senderId = PropertiesManager.getInstance().getValue(SM_SSENDER_ID);
			 }else{
				 senderId = PropertiesManager.getInstance().getValue(SM_SSENDER_COMMUNICATION_ID);
			 }
			
			 String message = otp;
			 String route=PropertiesManager.getInstance().getValue(SM_SROUTE);
			
			 //Prepare Url
	         URLConnection myURLConnection=null;
	         URL myURL=null;
	         BufferedReader reader=null;

	         //encoding message
	         @SuppressWarnings("deprecation")
			 String encoded_message=URLEncoder.encode(message);
	         //Send SMS API
	         String mainUrl=PropertiesManager.getInstance().getValue(SM_SMAIN_URL);
	         //Prepare parameter string
	         StringBuilder sbPostData= new StringBuilder(mainUrl);
	         sbPostData.append("authkey="+authkey);
	         sbPostData.append("&mobiles="+mobiles);
	         sbPostData.append("&message="+encoded_message);
	         sbPostData.append("&route="+route);
	         sbPostData.append("&sender="+senderId);

	         //final string
	         mainUrl = sbPostData.toString();
			 
	         //prepare connection
        	 System.out.println("mainUrl==>>"+mainUrl);
             myURL = new URL(mainUrl);
             myURLConnection = myURL.openConnection();
             myURLConnection.connect();
             reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
             //reading response
             String response;
             final StringBuffer stringBuffer = new StringBuffer();
             while ((response = reader.readLine()) != null){
             //print response
            	 stringBuffer.append(response);
             //System.out.println(response);
             }
             //finally close connection
             reader.close();
             apiResponse = new Gson().toJson(stringBuffer.toString());
	           //System.out.println("response==>"+response);
	           System.out.println("response==>"+apiResponse);
			
			return apiResponse;
		} catch (Exception e) {
			System.out.println("Error SMS " + e);
			return apiResponse + e;
		}
	}

	
	
}
