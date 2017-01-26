package com.smsaware.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Address;
import com.smsaware.model.Registration;
import com.smsaware.model.User;

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
		Address address = null;

		Registration registration = setRegistrationRequest(request);

		try {
			RegistrationDao dao = new RegistrationDao();
			boolean userExist = false;
			Long userId = null;
			Map<Boolean, Long> userExists = dao.checkUser(registration.getEmail(), registration.getPhone());
			for (Map.Entry<Boolean, Long> entry : userExists.entrySet()) {
				userExist = entry.getKey();
				userId = entry.getValue();
			}

			if (!userExist) {
				address = new Address();
				User dbResponse = dao.saveUser(registration, address);
				System.out.println("dbResponse===>>" + dbResponse);
				if (dbResponse != null && dbResponse.getRegistration() != null && dbResponse.getRegistration().getId()!=null) {
					RegistrationOTP.sendOTP(dbResponse.getRegistration().getId(),registration.getEmail(),registration.getPhone(),dbResponse.getRegistration().getName());

					System.out.println("*********Object save successfully*****");
					/*
					 * HttpSession session = request.getSession();
					 * session.setAttribute("email", registration.getEmail());
					 * session.setAttribute("name", registration.getName());
					 * session.setAttribute("phone", registration.getPhone());
					 * request.getRequestDispatcher("profile.jsp").include(
					 * request, response);
					 */
					request.setAttribute("userId", dbResponse.getRegistration().getId());
					request.setAttribute("name", dbResponse.getRegistration().getName());
					request.setAttribute("email", dbResponse.getRegistration().getEmail());
					request.setAttribute("phone", dbResponse.getRegistration().getPhone());
					RequestDispatcher dispatcher = request.getRequestDispatcher("popup.jsp");
					dispatcher.forward(request, response);

					// request.getRequestDispatcher("/views/registration.jsp").forward(request,
					// response);
				} else {
					request.getRequestDispatcher("index.jsp").include(request, response);
				}
			} else {
				request.setAttribute("userExist", "User already Registered");
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("sign-up.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sql exception" + e.getMessage());
		}

	}

	private Registration setRegistrationRequest(HttpServletRequest request) {
		Registration registration = null;
		String encryPassword = null;

		String name = request.getParameter("name");
		String mobileNumber = request.getParameter("phone");
		long mobile = Long.parseLong(mobileNumber);
		String email = request.getParameter("email");
		try {
			encryPassword = com.smsaware.utils.AESCryptUtil.encrypt(request.getParameter("password"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Encryption exception " + e.getMessage());
			e.printStackTrace();
		}

		Calendar cale = Calendar.getInstance();

		// Date todayDate=(Date) cale.getTime();

		java.util.Date utilDate = cale.getTime();
		java.sql.Date profileCreationDate = new java.sql.Date(utilDate.getTime());
		registration = new Registration(name, null, null, "Indian", "www.smsaware.in", 5, email, encryPassword, mobile,
				profileCreationDate, "N",null,null,null);

		return registration;
	}

}
