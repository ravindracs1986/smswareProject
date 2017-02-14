package com.smsaware.rest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Contacts;
import com.smsaware.model.User;
import com.smsaware.utils.HibernateUtil;

@WebServlet("/UserContacts.do")
public class UserContacts extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RegistrationDao dao = new RegistrationDao();
		List<Contacts> contacts = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session hbmSession = factory.openSession();
		Transaction tx = null;
		Long result = 0l;
		Contacts contactObject = null;
		String userId = request.getParameter("userId");
		String name = request.getParameter("nameValue");
		String city = request.getParameter("cityValue");
		String state = request.getParameter("stateValue");
		String phone = request.getParameter("phoneValue");
		contactObject = new Contacts(name, phone, city, state, Long.valueOf(userId));
		try {

			tx = hbmSession.beginTransaction();
			result = (Long) hbmSession.save(contactObject);
			contacts = (List<Contacts>) hbmSession.createQuery("from Contacts C WHERE C.userId = '" + userId + "'")
					.list();
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			hbmSession.close();
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
		if (result > 0) {
			request.getSession().setAttribute("message", "Contact Added successufully");

		} else {
			request.getSession().setAttribute("message", "Something Wrong,Please try again");
		}

		request.getSession().setAttribute("user", userObject);
		// request.getSession().setAttribute("contactList", contacts);
		request.getRequestDispatcher("profile.jsp").include(request, response);
	}

}
