package com.smsaware.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.utils.DataBaseQuerys;
import com.smsaware.utils.Database;
import com.smsaware.utils.HibernateUtil;

public class LoginServlet extends HttpServlet {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("inside login servlt#######::");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String encryPassword = null;
		try {
			encryPassword = com.smsaware.utils.AESCryptUtil.encrypt(password);
			//System.out.println("database smsaware_root "+com.smsaware.utils.AESCryptUtil.encrypt("smsaware_root"));
			//System.out.println("database root "+com.smsaware.utils.AESCryptUtil.encrypt("root"));
			//System.out.println("database password "+com.smsaware.utils.AESCryptUtil.encrypt("smsaware@1986"));
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
		Map<Boolean, Registration> responseStatus = getLoginStatus(login);
		Boolean isUserFound = false;
		Registration registration = null;
		for (Map.Entry<Boolean, Registration> entry : responseStatus.entrySet()) {
			isUserFound = entry.getKey();
			if (isUserFound) {
				registration = entry.getValue();
			}

		}

		if (isUserFound) {
			System.out.println("response::" + responseStatus);
			HttpSession session = request.getSession();
			session.setAttribute("user", registration);
			/*session.setAttribute("name", registration.getName());
			session.setAttribute("phone", registration.getPhone());
			session.setAttribute("gender", registration.getGender());*/
			// session.setAttribute("address", registration.getAddress());
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
			dispatcher.forward(request, response);

		} else {
			request.getRequestDispatcher("login.jsp").include(request, response);
		}

	}

	private Map<Boolean, Registration> getLoginStatus(Login login) {
		System.out.println("inside method");
		Map<Boolean, Registration> userObject = new HashMap<Boolean, Registration>();
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		String sql;
		try {
			
			tx = session.beginTransaction();
			if (login.getEmail() != null && !(login.getEmail().isEmpty())) {
				sql="SELECT * FROM user_registration where EMAIL='" + login.getEmail() + "' and PASSWORD='"+login.getPassword()+"'";
			} else {
				sql="SELECT * FROM user_registration where PHONE='" + login.getPhone() + "' and PASSWORD='"+login.getPassword()+"'";
			}
			SQLQuery query = session.createSQLQuery(sql);
	         query.addEntity(Registration.class);
	         List employees = query.list();
	         if(employees!=null){
		         for (Iterator iterator = employees.iterator(); iterator.hasNext();){
		        	 Registration employee = (Registration) iterator.next(); 
		            System.out.print("First Name: " + employee.getName()); 
		            System.out.print("  Email: " + employee.getEmail()); 
		            System.out.println("  Phone: " + employee.getPhone()); 
		            if (employee.getId() != null && employee.getId() != 0) {
		            	userObject.put(true, employee);
						break;
					}
		         }
			
	         }
			tx.commit();
			

		} catch (Exception e) {
			System.out.println("exception" + e);
		}

		return userObject;

	}

	/*private Registration setDBResponse(ResultSet result) throws SQLException {
		Registration regi = new Registration();
		// regi.setId(result.getLong("id"));
		regi.setName(result.getString("NAME"));
		regi.setBirth_date(result.getString("BIRTH_DATE"));
		regi.setGender(result.getString("GENDER"));
		regi.setNationality(result.getString("NATIONALITY"));
		regi.setWebsite(result.getString("WEBSITE"));
		regi.setNo_Of_Sms(result.getInt("NO_OF_SMS"));
		regi.setEmail(result.getString("EMAIL"));
		regi.setPhone(result.getLong("PHONE"));
		return regi;
	}*/

}