package com.smsaware.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smsaware.dao.CommentsDao;
import com.smsaware.model.Comments;

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
	    	//EmployeeDAO dao = new EmployeeDAO();
	    	Map<Integer,List<Comments>> result =dao.getComments((page-1)*recordsPerPage,recordsPerPage);
	    	//List<Employee> list = dao.viewAllEmployees((page-1)*recordsPerPage,recordsPerPage);
	    	for ( Map.Entry<Integer,List<Comments>> entry : result.entrySet()) {
	    		noOfRecords = entry.getKey();
				if(noOfRecords!=0){
					commentsList=entry.getValue();
				}
				
			}
	    	
	    	
	    	//int noOfRecords = dao.getNoOfRecords();
	    	int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    	request.setAttribute("comments", commentsList);
	    	request.setAttribute("noOfPages", noOfPages);
	    	request.setAttribute("currentPage", page);
	    	RequestDispatcher view = request.getRequestDispatcher("learn-more.jsp");
	    	view.forward(request, response);
	         
	         
	    }


}
