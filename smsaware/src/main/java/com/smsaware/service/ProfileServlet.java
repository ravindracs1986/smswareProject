package com.smsaware.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Registration;
import com.smsaware.model.User;

public class ProfileServlet extends HttpServlet{

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId=request.getParameter("userId");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String userOTP=request.getParameter("userOTP");
		String firstTime=request.getParameter("firstTime");
		//System.out.println("Profile Id-->"+userId+"email-->"+email+"phone-->>"+phone);
	    boolean	firstLogin = Boolean.parseBoolean(firstTime);
	    boolean userExist=false;
		User userObject=null;
		Map<Boolean, User> otpValidate=null;
		RegistrationDao dao=new RegistrationDao();
	    if(firstLogin){
	    	otpValidate=dao.checkOTP(Long.valueOf(userId),email,Long.valueOf(phone),userOTP);
			}else{
				otpValidate=dao.getUserData(Long.valueOf(userId));
			}
	    for ( Map.Entry<Boolean, User> entry : otpValidate.entrySet()) {
			userExist = entry.getKey();
			if(userExist){
				userObject=entry.getValue();
			}
			
		}
		
		if(userExist){
			HttpSession session = request.getSession();
			session.setAttribute("user", userObject);
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
			request.getRequestDispatcher("popup.jsp").forward(request, response);
			
		}
		
		
	}
	
}
