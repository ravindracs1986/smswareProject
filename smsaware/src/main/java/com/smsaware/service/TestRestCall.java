/*package com.smsaware.service;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Permission;
import java.util.List;
import java.util.Map;
import java.util.Set;


import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.util.Map.Entry;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.smsaware.model.Login;

import com.kinvey.java.User;
import com.kinvey.java.model.UserLookup;
import com.kinvey.nativejava.Client;
import com.kinvey.nativejava.UserDiscovery;

public class TestRestCall {

	public static void main(String[] args) throws IOException {
		
		ObjectMapper mapper= new ObjectMapper();
		String username = "photontest1@gmail.com";
		String password = "password1";
		Login login = new Login();
		login.setPassword(password);
		login.setUserName(username);
		//String postingString = new Gson().toJson(login);
		
		String jsonValue = mapper.writeValueAsString(login);
		System.out.println("jsonValue===>>"+jsonValue);
		
		System.out.println("password:: "+password+"username:::"+username);
		String authValue="Basic"+"a2lkX1N5UHh3Z2JJOjAyMDNhMGY0ZGQzMzQ1OThhOGY2MWIyNzQ2NjZhNDIw";
		//String serviceUrl = "http://baas.kinvey.com/user/kid_SyPxwgbI/login";
		String serviceUrl = "http://baas.kinvey.com/user/kid_SyPxwgbI/5774c6b6692119c51fdeeda4";
		
		
		
		
		//Client client = ClientBuilder.newClient();
		//WebTarget webTarget = client.target(serviceUrl);
		//Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON).header("Authorization", authValue);
		//Response serviceResponse = invocationBuilder.post(Entity.entity(login, MediaType.APPLICATION_JSON));
		//Response serviceResponse = webTarget.request().header("Authorization", authValue).header("X-Kinvey-API-Version", 3).buildPost(Entity.entity(login, MediaType.APPLICATION_JSON)).invoke();
		//Response response = webTarget.request().header("Authorization", authValue).accept(MediaType.APPLICATION_JSON).get();
		//int codeResponse=response.getStatus();
		//System.out.println("codeResponse-->"+codeResponse);
		System.out.println("Response befor :--->>"+new Gson().toJson(serviceResponse));
		if(serviceResponse.getStatus()==200){
			System.out.println("Response:--->>"+new Gson().toJson(serviceResponse));
			System.out.println("Login Success");
			
		}
		
		
		
		
		final Client mKinveyClient = new Client.Builder("kid_SyPxwgbI", "67004df7c4d2486eb318a835f5c76ba5").build();
		System.out.println("mKinveyClient==>>"+mKinveyClient);
		User result = null;
		try {
			result = (User) mKinveyClient.user().loginBlocking(username, password).execute();
			System.out.println("Response  :--->>"+new Gson().toJson(result));
			
		} catch (Exception e) {
			System.out.println("exception"+e);
		}
		
	
		URL urls = new URL(serviceUrl);
		HttpURLConnection conn = (HttpURLConnection) urls.openConnection();
		conn.setRequestMethod("POST");
	     conn.setDoOutput(true);
	     conn.setUseCaches(false);
	     conn.setRequestProperty("Content-Type", "application/json");
	     conn.setRequestProperty("Accept", "application/json");
	     conn.setRequestProperty("Authorization", authValue);
	     conn.setRequestProperty("X-Kinvey-API-Version", Integer.toString(3));
	     conn.setRequestProperty("Content-Length", Integer.toString(jsonValue.length()));
	     conn.getOutputStream().write(jsonValue.getBytes());
	     conn.getOutputStream().flush();
	     conn.connect();
		
	     try {
			testHttpURLConnection(conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     int code=conn.getResponseCode();
	     System.out.println("code-->>"+code);
	     if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
	         System.out.println("POST method failed: " + conn.getResponseCode() + "\t" + conn.getResponseMessage());
	     } else {
	         InputStream responseContent = (InputStream) conn.getContent();
	         
	         
	     }
		
		
		
	}
	
	private  static void testHttpURLConnection(HttpURLConnection connection) throws Exception {
	     boolean connAllowUserInteraction = connection.getAllowUserInteraction();
	     String connContentType = connection.getContentType();
	     String connContentEncoding = connection.getContentEncoding();
	     String connRequestMethod = connection.getRequestMethod();
	     boolean connDoInput = connection.getDoInput();
	     boolean connDoOutput = connection.getDoOutput();
	     Permission connPermission = connection.getPermission();
	     URL connURL = connection.getURL();
	     Map<String, List<String>> connHeaderFields = connection.getHeaderFields();
	 
	     System.out.println("connAllowUserInteraction: " + connAllowUserInteraction);
	     System.out.println("connContentType: " + connContentType);
	     System.out.println("connContentEncoding: " + connContentEncoding);
	     System.out.println("connRequestMethod: " + connRequestMethod);
	     System.out.println("connDoInput: " + connDoInput);
	     System.out.println("connDoOutput: " + connDoOutput);
	     System.out.println("connPermission: " + connPermission);
	     System.out.println("connURL: " + connURL);
	 
	     if (connHeaderFields != null) {
	         Set<Entry<String, List<String>>> connHeaderFieldsEntries = connHeaderFields.entrySet();
	         for (Entry<String, List<String>> entry : connHeaderFieldsEntries) {
	             System.out.println("connHeaderField: " + entry);
	         }
	     }
	 }

}
*/