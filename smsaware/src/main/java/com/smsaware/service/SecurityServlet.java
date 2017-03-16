package com.smsaware.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.CommentsDao;
import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.User;

@WebServlet("/SecurityServlet.do")
public class SecurityServlet extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	// private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommentsDao daoComments = new CommentsDao();
		RegistrationDao dao = new RegistrationDao();
		int row = 0;
		String userId = request.getParameter("userId");
		String quasions = request.getParameter("quasions");
		String answer = request.getParameter("answer");
		if (quasions != null && !quasions.isEmpty() && answer != null && !answer.isEmpty()) {

			row = daoComments.updateSecurityQAns(quasions, answer, Long.valueOf(userId));

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
			request.setAttribute("SecurityMessage", "Security setting change successfully");
		} else {
			request.setAttribute("SecurityMessage", "Something Wrong,Please try again");

		}

		request.getSession().setAttribute("user", userObject);
		request.getRequestDispatcher("profile.jsp").include(request, response);

	}

}
