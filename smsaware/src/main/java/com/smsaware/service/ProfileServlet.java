package com.smsaware.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Registration;

public class ProfileServlet extends HttpServlet{

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*HttpSession session = request.getSession();
		session.setAttribute("email", registration.getEmail());
		session.setAttribute("name", registration.getName());
		session.setAttribute("phone", registration.getPhone());
		request.getRequestDispatcher("profile.jsp").include(request, response);*/
		
		String userId=request.getParameter("userId");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String userOTP=request.getParameter("userOTP");
		System.out.println("Profile Id-->"+userId+"email-->"+email+"phone-->>"+phone);
		
		RegistrationDao dao=new RegistrationDao();
		Map<Boolean, Registration> otpValidate=dao.checkOTP(Long.valueOf(userId),email,Long.valueOf(phone),userOTP);
		boolean userExist=false;
		Registration userDetails=new Registration();
		for ( Map.Entry<Boolean, Registration> entry : otpValidate.entrySet()) {
			userExist = entry.getKey();
			if(userExist){
				userDetails=entry.getValue();
			}
			
		}
		if(userExist){
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("phone", phone);
			request.getRequestDispatcher("profile.jsp").include(request, response);
			
		}else{
			request.setAttribute("wrongOTP", "Wrong OTP,Please try again");
			request.setAttribute("userId", userId);
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.getRequestDispatcher("/views/popup.jsp").forward(request, response);
			
		}
		
		
	}
	
}
