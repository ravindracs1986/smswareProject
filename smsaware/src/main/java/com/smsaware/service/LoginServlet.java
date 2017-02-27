package com.smsaware.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Address;
import com.smsaware.model.Contacts;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.model.User;
import com.smsaware.pservice.MessageHistory;
import com.smsaware.utils.HibernateUtil;

public class LoginServlet extends HttpServlet {

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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String encryPassword = null;

		try {
			if(password!=null){
				encryPassword = com.smsaware.utils.AESCryptUtil.encrypt(password);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Encryption exception " + e.getMessage());
			e.printStackTrace();
		}

		Login login = new Login();
		login.setPassword(encryPassword);

		if (!username.contains("@")) {
			login.setPhone(Long.parseLong(username));
		} else {
			login.setEmail(username);
		}
		// String postingString = new Gson().toJson(login);
		Map<Boolean, User> responseStatus = getLoginStatus(login);
		Boolean isUserFound = false;
		User userObject = null;
		for (Map.Entry<Boolean, User> entry : responseStatus.entrySet()) {
			isUserFound = entry.getKey();
			if (isUserFound) {
				userObject = entry.getValue();
			}

		}

		if (isUserFound) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userObject);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
			dispatcher.forward(request, response);

		} else {
			request.getRequestDispatcher("login.jsp").include(request, response);
		}

	}

	private Map<Boolean, User> getLoginStatus(Login login) {
		RegistrationDao dao = new RegistrationDao();
		Map<Boolean, User> userObject = new HashMap<Boolean, User>();
		User user = new User();
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		String sql;
		try {

			tx = session.beginTransaction();
			if (login.getEmail() != null && !(login.getEmail().isEmpty())) {
				sql = "SELECT * FROM user_registration where EMAIL='" + login.getEmail() + "' and PASSWORD='"
						+ login.getPassword() + "'";
			} else {
				sql = "SELECT * FROM user_registration where PHONE='" + login.getPhone() + "' and PASSWORD='"
						+ login.getPassword() + "'";
			}
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Registration.class);
			List employees = query.list();
			if (employees != null) {
				for (Iterator iterator = employees.iterator(); iterator.hasNext();) {
					Registration employee = (Registration) iterator.next();
					if (employee.getId() != null && employee.getId() != 0) {
						user.setRegistration(employee);
						Address addres = dao.getAddress(employee.getId());
						user.setAddress(addres);
						List<Contacts> contacts = dao.getContacts(employee.getId());
						user.setContacts(contacts);
						List<MessageHistory> smsHistory = dao.getMessageHistoryById(employee.getId());
						user.setMessageHistory(smsHistory);
						userObject.put(true, user);
						break;
					}
				}

			}
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
			System.out.println("exception" + e);
		} finally {
			session.close();
		}

		return userObject;

	}

}