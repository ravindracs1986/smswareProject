package com.smsaware.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.utils.DataBaseQuerys;
import com.smsaware.utils.Database;

public class LoginServlet extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("inside login servlt#######::");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String encryPassword=null;
		try {
			encryPassword=com.smsaware.utils.AESCryptUtil.encrypt(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Encryption exception "+e.getMessage());
			e.printStackTrace();
		}
		
		Login login = new Login();
		login.setPassword(encryPassword);
		
		if(!username.contains("@")){
			login.setPhone(Long.parseLong(username));
		}else{
			login.setEmail(username);
		}
		//String postingString = new Gson().toJson(login);
		Map<Boolean,Registration> responseStatus = getLoginStatus(login);
		Boolean isUserFound =false;
		Registration registration=null;
		for ( Map.Entry<Boolean, Registration> entry : responseStatus.entrySet()) {
			isUserFound = entry.getKey();
			if(isUserFound){
				registration= entry.getValue();	
			}
			
		}
		
		
		if (isUserFound) {
			System.out.println("response::" + responseStatus);
			HttpSession session = request.getSession();
			session.setAttribute("email", registration.getEmail());
			session.setAttribute("name", registration.getName());
			session.setAttribute("phone", registration.getPhone());
			session.setAttribute("gender", registration.getGender());
			//session.setAttribute("address", registration.getAddress());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/profile.jsp");
			dispatcher.forward(request, response);

		} else {
			request.getRequestDispatcher("smsawarelogin.html").include(request, response);
		}

	}
	private Map<Boolean,Registration> getLoginStatus(Login login) {
		System.out.println("inside method");
		Map<Boolean,Registration> userObject=new HashMap<Boolean,Registration>();
		PreparedStatement statement = null;
		ResultSet result = null;
		Connection conn = null;
		Database dataBase = new Database();
		try {
			conn = dataBase.getConnection();
			String user = "";
			if(login.getEmail()!=null&& !(login.getEmail().isEmpty())){
				statement = conn.prepareStatement(DataBaseQuerys.getUserByEmail);
				statement.setString(1, login.getEmail());
				statement.setString(2, login.getPassword());
			}else{
				statement = conn.prepareStatement(DataBaseQuerys.getUserByPhone);
				statement.setLong(1, login.getPhone());
				statement.setString(2, login.getPassword());
			}
			
			
			result = statement.executeQuery();

			while (result.next()) {
				System.out.print(result.getString(8));
				System.out.print("\t" + result.getString(9));
				if(login.getEmail()!=null&& !(login.getEmail().isEmpty())){
					if (result.getString(8).equalsIgnoreCase(login.getEmail())
							&& result.getString(9).equalsIgnoreCase(login.getPassword())) {
						Registration regi = setDBResponse(result);
						userObject.put(true, regi);
						break;
					}
					
				}else{
					if (result.getLong(10)==login.getPhone() && result.getString(9).equalsIgnoreCase(login.getPassword())) {
						Registration regi = setDBResponse(result);
						userObject.put(true, regi);
						break;
					}
					
				}
				

			}

		} catch (Exception e) {
			System.out.println("exception" + e);
		}

		return userObject;

	}
	private Registration setDBResponse(ResultSet result) throws SQLException {
		Registration regi= new Registration ();
		//regi.setId(result.getLong("id"));
		regi.setName(result.getString("NAME"));
		regi.setBirthdate(result.getString("BIRTH_DATE"));
		regi.setGender(result.getString("GENDER"));
		regi.setNationality(result.getString("NATIONALITY"));
		regi.setWebsite(result.getString("WEBSITE"));
		regi.setNoOfSms(result.getInt("NO_OF_SMS"));
		regi.setEmail(result.getString("EMAIL"));
		regi.setPhone(result.getLong("PHONE"));
		return regi;
	}

	// Connection con = Database.getInstance().getConnection();

}