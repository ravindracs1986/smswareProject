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
import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Address;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
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

		Registration registration=setRegistrationRequest(request);
		
		
		try {
			RegistrationDao dao=new RegistrationDao();
			int dbResponse=dao.saveUser(registration);
			
			System.out.println("dbResponse===>>" + dbResponse);
			if (dbResponse == 1) {

				HttpSession session = request.getSession();
				session.setAttribute("email", registration.getEmail());
				session.setAttribute("name", registration.getName());
				session.setAttribute("phone", registration.getPhone());
				request.getRequestDispatcher("profile.jsp").include(request, response);
			} else {

				request.getRequestDispatcher("smsawarelogin.html").include(request, response);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sql exception"+e.getMessage());
		}

	}

	private Registration setRegistrationRequest(HttpServletRequest request) {
		Registration registration =new Registration();
		Address address=new Address();
		String mobileNumber = request.getParameter("phone");
		long  mobile = Long.parseLong(mobileNumber);
		
		registration.setPhone(mobile);
		registration.setEmail(request.getParameter("email"));
		
		address.setUserAddress(request.getParameter("userAddress"));
		address.setStreet(request.getParameter("street"));
		address.setCity(request.getParameter("city"));
		address.setState(request.getParameter("state"));
		address.setZipCode(request.getParameter("zipCode"));
		
		registration.setAddress(address);
		
		String date = request.getParameter("date");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String dateOfBirth=date+"/"+month+"/"+year;
		
		
		registration.setBirthdate(dateOfBirth);
		registration.setGender(request.getParameter("gender"));
		registration.setName(request.getParameter("name"));
		registration.setNationality(request.getParameter("nationality"));
		registration.setPassword(request.getParameter("password"));
		registration.setWebsite(request.getParameter("website"));
		
		return registration;
	}

}
