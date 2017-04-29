package com.smsaware.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.smsaware.dao.CommentsDao;
import com.smsaware.dao.RegistrationDao;
import com.smsaware.model.Address;
import com.smsaware.model.Comments;
import com.smsaware.model.CommentsVO;
import com.smsaware.model.Contacts;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.model.ReplyComments;
import com.smsaware.model.User;
import com.smsaware.pservice.MessageHistory;
import com.smsaware.utils.HibernateUtil;

@WebServlet("/PopUpLogin.do")
public class PopUpLogin extends HttpServlet {

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
		CommentsDao dao=new CommentsDao();
    	int page = 1;
    	int recordsPerPage = 3;
    	if(request.getParameter("page") != null)
    	page = Integer.parseInt(request.getParameter("page"));
    	int noOfRecords =0;
    	List<Comments> commentsList=null;
    	List<CommentsVO> resultObject=new ArrayList<CommentsVO>();
    	String regex = "\\d+";
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

		if (!username.contains("@") && username.matches(regex) && username.length()==10) {
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
	    	Map<Integer,List<Comments>> result =dao.getComments((page-1)*recordsPerPage,recordsPerPage);
	    	for ( Map.Entry<Integer,List<Comments>> entry : result.entrySet()) {
	    		noOfRecords = entry.getKey();
				if(noOfRecords!=0){
					commentsList=entry.getValue();
				}
				
			}
	    	
	    	if(commentsList!=null && commentsList.size()!=0){
	    		for (Comments commnt : commentsList) {
	    			CommentsVO commntVO = new CommentsVO();
					long comntId=commnt.getCommentsId();
					List<ReplyComments> replyObj=dao.getReply(comntId);
					commntVO.setComments(commnt);
					commntVO.setReply(replyObj);
					resultObject.add(commntVO);
				}
	    	}
			
			
	    	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    	request.setAttribute("comments", resultObject);
	    	request.setAttribute("noOfPages", noOfPages);
	    	request.setAttribute("currentPage", page);
	    	request.setAttribute("totalComments", noOfRecords);
			HttpSession session = request.getSession();
			session.setAttribute("user", userObject);
			RequestDispatcher dispatcher = request.getRequestDispatcher("learn-more.jsp");
			dispatcher.forward(request, response);

		} else {
			
			Map<Integer,List<Comments>> result =dao.getComments((page-1)*recordsPerPage,recordsPerPage);
	    	for ( Map.Entry<Integer,List<Comments>> entry : result.entrySet()) {
	    		noOfRecords = entry.getKey();
				if(noOfRecords!=0){
					commentsList=entry.getValue();
				}
				
			}
	    	
	    	if(commentsList!=null && commentsList.size()!=0){
	    		for (Comments commnt : commentsList) {
	    			CommentsVO commntVO = new CommentsVO();
					long comntId=commnt.getCommentsId();
					List<ReplyComments> replyObj=dao.getReply(comntId);
					commntVO.setComments(commnt);
					commntVO.setReply(replyObj);
					resultObject.add(commntVO);
				}
	    	}
			
			
	    	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    	request.setAttribute("comments", resultObject);
	    	request.setAttribute("noOfPages", noOfPages);
	    	request.setAttribute("currentPage", page);
	    	request.setAttribute("totalComments", noOfRecords);
			request.setAttribute("popUpError", "UserName and password not found");
			request.getRequestDispatcher("learn-more.jsp").include(request, response);
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