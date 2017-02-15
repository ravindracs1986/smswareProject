package com.smsaware.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.RegistrationDao;

@WebServlet("/ForgotPasswordServlet.do")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public void init() throws ServletException {

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordServlet() {
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

		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		RegistrationDao dao = new RegistrationDao();

		String result = dao.forgotPassword(Long.valueOf(phone), email);
		request.setAttribute("result", result);
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}
