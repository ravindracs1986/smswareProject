package com.smsaware.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;
import com.smsaware.dao.CommentsDao;
import com.smsaware.model.Comments;
import com.smsaware.model.CommentsVO;
import com.smsaware.model.ReplyComments;
import com.smsaware.utils.HibernateUtil;

@WebServlet("/CommentRetrieveServlet.do")
public class CommentRetrieveServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 	public void init() throws ServletException {

	    }

	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public CommentRetrieveServlet() {
	        super();
	    }

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	CommentsDao dao=new CommentsDao();
	    	int page = 1;
	    	int recordsPerPage = 3;
	    	if(request.getParameter("page") != null)
	    	page = Integer.parseInt(request.getParameter("page"));
	    	int noOfRecords =0;
	    	List<Comments> commentsList=null;
	    	List<CommentsVO> resultObject=new ArrayList<CommentsVO>();
	    	
	    	//EmployeeDAO dao = new EmployeeDAO();
	    	Map<Integer,List<Comments>> result =dao.getComments((page-1)*recordsPerPage,recordsPerPage);
	    	//List<Employee> list = dao.viewAllEmployees((page-1)*recordsPerPage,recordsPerPage);
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
					List<ReplyComments> replyObj=getReply(comntId);
					commntVO.setComments(commnt);
					commntVO.setReply(replyObj);
					resultObject.add(commntVO);
				}
	    		
	    		
	    		
	    		
	    	}
	    	//int noOfRecords = dao.getNoOfRecords();
	    	String jsonobj=new Gson().toJson(resultObject);
	    	System.out.println("jsonobj===>>"+jsonobj);
	    	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    	request.setAttribute("comments", resultObject);
	    	request.setAttribute("noOfPages", noOfPages);
	    	request.setAttribute("currentPage", page);
	    	RequestDispatcher view = request.getRequestDispatcher("learn-more.jsp");
	    	view.forward(request, response);
	         
	         
	    }

		private List<ReplyComments> getReply(long comntId) {
			List<ReplyComments> commentReply=null;
			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.openSession();
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				commentReply = (List<ReplyComments>) session.createQuery("from ReplyComments R WHERE R.commentsId = '" + comntId + "'").list();
				
				tx.commit();

			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return commentReply;
		}


}
