package com.smsaware.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;*/

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class DbTest {

    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID = "AC323c36bcbe1c2244c06d949ea17024d3";
    public static final String AUTH_TOKEN = "e125b83dedb14761562bf91351b96b07";
	
    static String SMSApi = "https://site2sms.p.mashape.com/index.php?uid=7200369565&phone=7299028593&msg=hai";
    //static String SMSApi = "https://webaroo-send-message-v1.p.mashape.com/sendMessage?message=hii&phone=7200369565";
    static String head = "i6ulDC3YBxmshNmVMOWeLVxPWrjrp1lkc8KjsnWFbkD114ZPC3";
    
    
	public static void main(String[] args) throws SQLException {
		
		
		
		String resp=sendSms();
		System.out.println("resp==>>"+resp);

		/*PreparedStatement statement = null;
		ResultSet resultado = null;
		String query = "SELECT * FROM user";
		Connection conn = null;// Database.getInstance().getConnection();

		try {
			conn = Database.getInstance().getConnection();
			statement = conn.prepareStatement(query);
			resultado = statement.executeQuery();

			while (resultado.next()) {
				System.out.println(resultado.getString(1) + "\t" + resultado.getString(2) + "\t");
			}
		} catch (Exception e) {
			System.err.println("El porque del cascar: " + e.getMessage());
		} finally {
			conn.close();

		}*/

	/*	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message.creator(new PhoneNumber("+917200369565"),  // to
                         new PhoneNumber("+917299028593"),  // from
                         "Where's Wallace?")
                .create();*/
    //}
		
		
		
		 /*TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

		    // Build a filter for the MessageList
		    List<NameValuePair> params = new ArrayList<NameValuePair>();
		    params.add(new BasicNameValuePair("Body", "Test Twilio message"));
		    params.add(new BasicNameValuePair("To", "+917299028593"));
		    params.add(new BasicNameValuePair("From", "+14158141829"));

		    MessageFactory messageFactory = client.getAccount().getMessageFactory();
		    Message message;
			try {
				message = messageFactory.create(params);
				System.out.println(message.getSid());
			} catch (TwilioRestException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		    
		/* try
		    {
		        String url = SMSApi;
		        String smsApiResponse = sendMySMS(url);
		        System.out.println(smsApiResponse);
		    }
		    catch (Exception e)
		    {
		        e.printStackTrace();
		    }*/
		
		
	}
	
	
	public static String sendSms() {
		try {
			// Construct data
			String user = "username=" + "ravindracs1986@gmail.com";
			String hash = "&hash=" + "981ef0ef704c2030758745488393419284f72a04";
			String message = "&message=" + "This is your message";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "919472784936";
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("http://api.textlocal.in/send/?").openConnection();
			String data = user + hash + numbers + message + sender;
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
			
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
	}
	
	
	
	
	
		/*private static String sendMySMS(String url)
		{
		    StringBuilder output = new StringBuilder();
		    try
		    {
		        URL hp = new URL(url);
		        System.out.println(url);
		        URLConnection hpCon = hp.openConnection();
		        hpCon.setRequestProperty("X-Mashape-Authorization", head);
		        BufferedReader in = new BufferedReader(new InputStreamReader(hpCon.getInputStream()));
		        String inputLine;
		        while ((inputLine = in.readLine()) != null)
		            output.append(inputLine);
		        in.close();
		    }
		    catch (Exception e)
		    {
		        e.printStackTrace();
		    }
		    return output.toString();
		}
		*/
		
		
		
	

}
