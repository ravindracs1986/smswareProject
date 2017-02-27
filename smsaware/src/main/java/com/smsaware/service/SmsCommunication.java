package com.smsaware.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Registration;
import com.smsaware.model.User;
import com.smsaware.pservice.MessageHistory;
import com.smsaware.utils.SendSMS;

@WebServlet("/SmsCommunication.do")
public class SmsCommunication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	public void init() throws ServletException {

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SmsCommunication() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String phone = request.getParameter("Send_To");
		phone = phone.substring(3);
		String subject = request.getParameter("Subject");
		String message = request.getParameter("Message");
		String userId = request.getParameter("userId");
		String responseMessage = "";
		String successMessage = "";
		String smsResponse = null;
		RegistrationDao dao = new RegistrationDao();
		List<MessageHistory> msgHistry=null;
		if (phone != null && subject != null && message != null) {

			Registration regi = dao.getUserForSMSCheck(Long.valueOf(userId));
			int balanceSms = regi.getNo_Of_Sms();
			if (balanceSms > 0) {
				SendSMS sms = new SendSMS();
				long mobile = Long.parseLong(phone);
				smsResponse = sms.sendSms(message, mobile,false);
				if (containsDigit(smsResponse) && !smsResponse.contains("Exception")) {
					successMessage = "your message sent to :"+mobile;
					balanceSms = balanceSms - 1;
					int smsCountResult = dao.updateSmsCount(Long.valueOf(userId), balanceSms);
					System.out.println("smsCountResult==>" + smsCountResult);
					Calendar cale = Calendar.getInstance();
		        	java.util.Date utilDate = cale.getTime();
		    		java.sql.Date smsDate = new java.sql.Date(utilDate.getTime());
		    		
		    		msgHistry=dao.saveMessageHistory(mobile,message,smsDate,Long.valueOf(userId));
					
				} else {

					responseMessage = "Please correct input and try again.";
				}

			} else {

				responseMessage = "Your SMS balance is low please buy it.";
			}

		}

		Map<Boolean, User> otpValidate = dao.getUserData(Long.valueOf(userId));
		boolean userExist = false;
		User userObject = null;
		for (Map.Entry<Boolean, User> entry : otpValidate.entrySet()) {
			userExist = entry.getKey();
			if (userExist) {
				userObject = entry.getValue();
			}

		}
		if (!successMessage.isEmpty()) {
			request.setAttribute("successMessage", successMessage);
		} else {
			request.setAttribute("smsmessage", responseMessage);
		}
		request.getSession().setAttribute("user", userObject);
		request.getRequestDispatcher("profile.jsp").include(request, response);

	}

	public final boolean containsDigit(String s) {
		boolean containsDigit = false;

		if (s != null && !s.isEmpty()) {
			for (char c : s.toCharArray()) {
				if (containsDigit = Character.isDigit(c)) {
					break;
				}
			}
		}

		return containsDigit;
	}

}
