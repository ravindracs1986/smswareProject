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
import com.smsaware.model.User;

public class UpdateProfileSevlet extends HttpServlet{

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			  throws ServletException, IOException {
			    doPost(request, response);
			  }
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RegistrationDao dao=new RegistrationDao();
		String userId=request.getParameter("userId");
		String name=request.getParameter("name");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String aboutMe=request.getParameter("aboutMe");
		String phone=request.getParameter("pPhone");
		
		String userAddress=request.getParameter("userAddress");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String zip=request.getParameter("zip");
		System.out.println("Profile Id-->"+userId+"email-->"+email+"phone-->>"+userAddress);
		
		int result=dao.updateProfile(userId,name,lastName,email,aboutMe,userAddress,city,state,zip);
		
		User userObject=null;
		boolean userExist=false;
		Map<Boolean, User> otpValidate=null;
		
		otpValidate=dao.getUserData(Long.valueOf(userId));
		for ( Map.Entry<Boolean, User> entry : otpValidate.entrySet()) {
			userExist = entry.getKey();
			if(userExist){
				userObject=entry.getValue();
			}
			
		}
		
		if(userExist){
			HttpSession session = request.getSession();
			session.setAttribute("user", userObject);
			//session.setAttribute("email", email);
			//session.setAttribute("name", name);
			//session.setAttribute("phone", phone);
			request.getRequestDispatcher("profile.jsp").include(request, response);
			
		}
		
		//request.getContextPath().
		//System.out.println("path==>>"+request.getContextPath());
		//response.sendRedirect(request.getContextPath()+"/ProfileServlet.do");
		 //request.getRequestDispatcher("profile.jsp").forward(request, response);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("ProfileServlet.do");
		//dispatcher.forward(request, response);
		
		/*RegistrationDao dao=new RegistrationDao();
		Map<Boolean, User> otpValidate=dao.checkOTP(Long.valueOf(userId),email,Long.valueOf(phone),userOTP);
		boolean userExist=false;
		Registration userDetails=new Registration();
		User userObject=null;*/
		
		/*if(userExist){
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
			
		}*/
		
		
	}
	
}
