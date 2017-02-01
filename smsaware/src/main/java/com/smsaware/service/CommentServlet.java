package com.smsaware.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smsaware.dao.CommentsDao;
import com.smsaware.model.Comments;

@WebServlet("/CommentServlet.do")
public class CommentServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    public void init() throws ServletException {

	    }

	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public CommentServlet() {
	        super();
	    }

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request, response);
	    }

	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	        String name = request.getParameter("Name");
	        String email = request.getParameter("Email");
	        String website = request.getParameter("Website");
	        String subject = request.getParameter("Subject");
	        String comment = request.getParameter("Comment");
	        String parentId = request.getParameter("parentsId");
	        Long parentIdLong=null;
	        CommentsDao dao=new CommentsDao();
	        try{
	        	Calendar cale = Calendar.getInstance();
	        	java.util.Date utilDate = cale.getTime();
	    		java.sql.Date commentDate = new java.sql.Date(utilDate.getTime());
	    		if(parentId!=null && !parentId.isEmpty()){
	    			parentIdLong=Long.valueOf(parentId);
	    		}
	    		
	    		Comments commentObject = new Comments(name,email,website,subject,comment,commentDate,parentIdLong);
	    		List<Comments> result =dao.submitComments(commentObject);
	    		
	    			HttpSession session = request.getSession();
	    			session.setAttribute("result", result);
	    			//RequestDispatcher dispatcher = request.getRequestDispatcher("learn-more.jsp");
	    			//dispatcher.forward(request, response);
	    			response.sendRedirect("CommentRetrieveServlet.do?page=1"); 

	        } catch (Exception e){
	            e.printStackTrace();
	        }
	    }

}
