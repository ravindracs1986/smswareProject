package com.smsaware.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.smsaware.model.Comments;
import com.smsaware.model.ReplyComments;
import com.smsaware.utils.HibernateUtil;

@WebServlet("/views/AdminLoginServlet.do")
public class AdminLoginServlet extends HttpServlet {

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
		System.out.println("Admin login servlet initialised");
		String username = request.getParameter("adminUser");
		String password = request.getParameter("adminPass");
		String encryPassword = null;
        String adminPassword="DCxOPzMep/hg+A4/yOgfSw==";
        String adminUser="DCxOPzMep/hg+A4/yOgfSw==";
        String encryptedUser=null;
        List<Comments> commentsList=null;
        List<ReplyComments> replyList=null;
		try {
			if(password!=null && username!=null){
				encryPassword = com.smsaware.utils.AESCryptUtil.encrypt(password);
				encryptedUser=com.smsaware.utils.AESCryptUtil.encrypt(username);
			}
			if(encryptedUser.equalsIgnoreCase(adminUser) && encryPassword.equalsIgnoreCase(adminPassword)){
				
				commentsList=getAllunApprovedComments();
				replyList=getAllunApprovedReply();
				request.setAttribute("commentsList", commentsList);
				request.setAttribute("replyList", replyList);
				request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
				
			}else{
				request.setAttribute("wrong", "user or password wrong");
				request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
				
			}
			
		} catch (Exception e) {
			System.out.println("Encryption exception " + e.getMessage());
			e.printStackTrace();
		}

		
	}

	private List<ReplyComments> getAllunApprovedReply() {
		List<ReplyComments> reply = new ArrayList<ReplyComments>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			String q="N";
			tx = session.beginTransaction();
			reply= (List<ReplyComments>) session.createQuery("from ReplyComments R WHERE R.approved = '" + q + "'").list();

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

		return reply;
	}
	private List<Comments> getAllunApprovedComments() {
		List<Comments> comments = new ArrayList<Comments>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			String q="N";
			tx = session.beginTransaction();
			comments = (List<Comments>) session.createQuery("from Comments R WHERE R.approved = '" + q + "'").list();

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

		return comments;

	}

}