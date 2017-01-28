package com.smsaware.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.User;

@WebServlet("/UpdateProfileImageServlet.do")
@MultipartConfig(maxFileSize = 16177215)
public class UpdateProfileImageServlet extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	//private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RegistrationDao dao = new RegistrationDao();
		int row = 0;
		InputStream inputStream = null;
		String userId = request.getParameter("userId");
		Part filePart = request.getPart("photo");
		if (filePart != null && filePart.getSize()!=0) {
			System.out.println("Profile image size==>"+filePart.getSize());
			System.out.println("Profile image ContentType==>"+filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			if (inputStream != null) {
				row = dao.uploadProfileImage(inputStream, Long.valueOf(userId));
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

			request.getSession().setAttribute("message", "File uploaded and saved into database");
		} else {
			request.getSession().setAttribute("message", "Something Wrong,Please try again");

		}
		
		request.getSession().setAttribute("user", userObject);
		request.getRequestDispatcher("profile.jsp").include(request, response);
		//getServletContext().getRequestDispatcher("profile.jsp").forward(request, response);
	}

}
