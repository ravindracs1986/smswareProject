package com.smsaware.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smsaware.model.Address;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
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
		Login login = new Login();
		login.setPassword(password);
		login.setUserName(username);
		String postingString = new Gson().toJson(login);

		boolean responseStatus = getLoginStatus(login);
		if (responseStatus) {
			System.out.println("response::" + responseStatus);
			
			Registration registrationObject=getUserDetails(login.getUserName());
			
			HttpSession session = request.getSession();
			session.setAttribute("email", login.getUserName());
			session.setAttribute("name", registrationObject.getFname()+registrationObject.getLname());
			session.setAttribute("mobile", registrationObject.getMobileNumber());
			session.setAttribute("gender", registrationObject.getGender());
			session.setAttribute("address", registrationObject.getAddress());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/profile.jsp");
			dispatcher.forward(request, response);

		} else {
			request.getRequestDispatcher("smsawarelogin.html").include(request, response);
		}

	}

	private Registration getUserDetails(String userName) {
		Registration regi=null;
		PreparedStatement statement = null;
		ResultSet result = null;
		Connection conn = null;
		
		try {
			conn = Database.getInstance().getConnection();
			String user = "select * from registration where email =?";
			statement = conn.prepareStatement(user);
			statement.setString(1, userName);
			result = statement.executeQuery();

			while (result.next()) {
				System.out.print(result.getString(5));
				System.out.print("\t" + result.getString(7));
				if (result.getString(5).equalsIgnoreCase(userName)) {
					regi=new Registration();
					Address address= new Address();
					address.setAddress1(result.getString(4));
					address.setAddress2(result.getString(8));
					address.setCity(result.getString(9));
					address.setState(result.getString(11));
					address.setZipCode(result.getString(10));
					regi.setAddress(address);
					regi.setGender(result.getString(6));
					regi.setEmail(result.getString(5));
					regi.setFname(result.getString(2));
					regi.setLname(result.getString(3));
					
					regi.setMobileNumber(Integer.parseInt(result.getString(1)));
					break;
				}

			}

		} catch (Exception e) {
			System.out.println("exception" + e);
		}

		return regi;
	}

	private boolean getLoginStatus(Login login) {
		System.out.println("inside method");
		boolean returnObject = false;
		PreparedStatement statement = null;
		ResultSet result = null;
		Connection conn = null;

		try {
			conn = Database.getInstance().getConnection();
			String user = "select * from registration where email =? and password=?";
			statement = conn.prepareStatement(user);
			statement.setString(1, login.getUserName());
			statement.setString(2, login.getPassword());
			result = statement.executeQuery();

			while (result.next()) {
				System.out.print(result.getString(5));
				System.out.print("\t" + result.getString(7));
				// System.out.print("\t"+rs.getInt(3));
				// System.out.print("\t"+rs.getFloat(4));
				if (result.getString(5).equalsIgnoreCase(login.getUserName())
						&& result.getString(7).equalsIgnoreCase(login.getPassword())) {
					returnObject = true;
					break;
				}

			}

		} catch (Exception e) {
			System.out.println("exception" + e);
		}

		return returnObject;

	}

	// Connection con = Database.getInstance().getConnection();

}