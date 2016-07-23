package com.smsaware.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.security.Permission;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileReader;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.client.ClientProperties;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import com.kinvey.java.User;
import com.kinvey.java.model.UserLookup;
import com.kinvey.nativejava.Client;
import com.kinvey.nativejava.UserDiscovery;
import com.smsaware.model.Login;




public class LoginServlet extends HttpServlet {
	
	 public UserLookup userLookup() {
			return new UserLookup();
		}
	 
	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// reading the user input
		BufferedReader in = null;
		//StringBuffer responseBuffer = null;
		String inputLine;
		ObjectMapper mapper= new ObjectMapper();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Login login = new Login();
		login.setPassword(password);
		login.setUserName(username);
		String postingString = new Gson().toJson(login);
		
		String responseKinvey=getLoginStatus(login);
		if(responseKinvey!=null){
			System.out.println("response::"+responseKinvey);
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/success.html");
	         dispatcher.forward(request, response);
			
		}
		
		
		
		
		
	}
	
	
	private String getLoginStatus(Login login) {
		System.out.println("inside method");
		String returnObject=null;
		
		final Client mKinveyClient = new Client.Builder("kid_ryCIwkku", "b44d69d74707466e973d7a5f7c9aca7f").build();
		System.out.println("mKinveyClient==>>"+mKinveyClient);
		User result = null;
		try {
			result = (User) mKinveyClient.user().loginBlocking(login.getUserName(), login.getPassword()).execute();
			returnObject=new Gson().toJson(result);
			System.out.println("Response  :--->>"+new Gson().toJson(result));
			
		} catch (Exception e) {
			System.out.println("exception"+e);
		}
		
		return returnObject;
		
	}


	
}