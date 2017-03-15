package com.smsaware.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.CommentsDao;
import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Registration;
import com.smsaware.model.User;

@WebServlet("/ChangePassword.do")
@MultipartConfig(maxFileSize = 16177215)
public class ChangePasswordServlet extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	//private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommentsDao daoComments = new CommentsDao();
		RegistrationDao dao = new RegistrationDao();
		int row = 0;
		String userId = request.getParameter("userId");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		String changeErrorMessage="";
		boolean isoldpasswordCorrect=false;
		if (oldPassword != null && !oldPassword.isEmpty() && newPassword != null && !newPassword.isEmpty()) {
			
			Registration reg=dao.getUserForSMSCheck(Long.valueOf(userId));
			String dbOldPassword=reg.getPassword();
			try {
				String encryPassword = com.smsaware.utils.AESCryptUtil.encrypt(oldPassword);
				if(dbOldPassword.equalsIgnoreCase(encryPassword)){
					String newEncryPassword = com.smsaware.utils.AESCryptUtil.encrypt(newPassword);
					row = daoComments.changePassword(oldPassword, newEncryPassword,Long.valueOf(userId));
					
				}else{
					request.setAttribute("changeErrorMessage", "Old Password is not correct");
					isoldpasswordCorrect=true;
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Encryption exception " + e.getMessage());
				e.printStackTrace();
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
		if (row > 0) {

			request.setAttribute("changeErrorMessage", "Password change successfully");
		} else if(isoldpasswordCorrect){
			request.setAttribute("changeErrorMessage", "Something Wrong,Please try again");

		}
		
		request.getSession().setAttribute("user", userObject);
		request.getRequestDispatcher("profile.jsp").include(request, response);
		
	}

}
