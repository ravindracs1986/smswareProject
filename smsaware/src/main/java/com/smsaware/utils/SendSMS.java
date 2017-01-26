package com.smsaware.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;

public class SendSMS {

	public String sendSms(String otp, Long phone) {
		try {

			Gson gson = new Gson();
			// Construct data
			String user = "username=" + "ravindracs1986@gmail.com";
			String hash = "&hash=" + "981ef0ef704c2030758745488393419284f72a04";
			String message = "&message=" + "Your OTP for smsaware account is:" + otp;
			String sender = "&sender=" + "SMSAWARE";
			// String numbers = "&numbers=" + "918660574960";
			String numbers = "&numbers=" + "91" + phone;
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("http://api.textlocal.in/send/?").openConnection();
			String data = user + hash + numbers + message + sender + "test=1";
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();

			String response = stringBuffer.toString();
			response = gson.toJson(response);
			return response;
		} catch (Exception e) {
			System.out.println("Error SMS " + e);
			return "Error " + e;
		}
	}

}
