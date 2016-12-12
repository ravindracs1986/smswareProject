package com.smsaware.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.smsaware.model.Login;
import com.smsaware.utils.Database;

public class RegistrationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// request.getRequestDispatcher("link.html").include(request, response);
		System.out.println("inside servelet##############################");
		/*
		 * String name=request.getParameter("name"); String
		 * password=request.getParameter("password");
		 * 
		 * if(password.equals("admin123")){ out.print("Welcome, "+name);
		 * HttpSession session=request.getSession();
		 * session.setAttribute("name",name); } else{ out.print(
		 * "Sorry, username or password error!");
		 * request.getRequestDispatcher("login.html").include(request,
		 * response); } out.close();
		 */

		String mobileNumber = request.getParameter("mobileNumber");
		Integer mobile = Integer.parseInt(mobileNumber);
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String username = request.getParameter("email");
		String gender = request.getParameter("gender");

		String password = request.getParameter("password");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String state = request.getParameter("state");

		System.out.println("mobileNumber==>" + mobileNumber + "fname==>" + fname + "lname==>" + lname);
		System.out.println(
				"username==>" + username + "gender==>" + gender + "password==>" + password + "email==>" + email);

		try {
			int dbResponse = saveUser(mobile, fname, lname, email, username, gender, password, address1, address2, city,
					zipCode, state);
			System.out.println("return3333333===>>" + dbResponse);
			if (dbResponse == 1) {

				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("fname", fname);
				session.setAttribute("lname", lname);
				session.setAttribute("mobile", mobile);
				request.getRequestDispatcher("profile.jsp").include(request, response);
			} else {

				request.getRequestDispatcher("smsawarelogin.html").include(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// System.out.println("sql exception",e.getMessage());
		}

	}

	private int saveUser(Integer mobile, String fname, String lname, String email, String username, String gender,
			String password, String address1, String address2, String city, String zipCode, String state)
			throws SQLException {

		PreparedStatement statement = null;
		ResultSet resultado = null;
		Connection conn = null;
		int res = 0;
		System.out.println(" @@@@@@@@@@@@  $$$$$$$$$$$$");
		try {
			conn = Database.getInstance().getConnection();
			System.out.println("after con$$$$$$$$$$$$" + conn);
			String insertUser = "insert into registration(mobile_Number,f_name,l_name,address1,email,gender,password,address2,city,zipCode,state) values(?,?,?,?,?,?,?,?,?,?,?)";
			statement = conn.prepareStatement(insertUser);
			statement.setInt(1, mobile);
			statement.setString(2, fname);
			statement.setString(3, lname);
			statement.setString(4, address1);
			statement.setString(5, email);
			statement.setString(6, gender);
			statement.setString(7, password);
			statement.setString(8, address2);
			statement.setString(9, city);
			statement.setString(10, zipCode);
			statement.setString(11, state);

			res = statement.executeUpdate();

			System.out.println("insert return value-->" + res);

		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("El porque del cascar: " + e.getMessage());
		} finally {
			conn.close();

		}

		return res;

	}

}
