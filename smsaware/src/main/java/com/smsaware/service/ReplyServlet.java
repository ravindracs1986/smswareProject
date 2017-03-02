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
import com.smsaware.model.ReplyComments;

@WebServlet("/Reply.do")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("Name");
		String email = request.getParameter("Email");
		String comment = request.getParameter("Comment");
		String parentId = request.getParameter("parentsId");

		Long parentIdLong = null;
		CommentsDao dao = new CommentsDao();
		try {
			Calendar cale = Calendar.getInstance();
			java.util.Date utilDate = cale.getTime();
			java.sql.Date commentDate = new java.sql.Date(utilDate.getTime());
			if (parentId != null && !parentId.isEmpty()) {
				parentIdLong = Long.valueOf(parentId);
			}

			ReplyComments commentObject = new ReplyComments(name, email, comment, parentIdLong, "N", commentDate);

			List<ReplyComments> result = dao.submitReply(commentObject);

			HttpSession session = request.getSession();
			session.setAttribute("result", result);
			response.sendRedirect("CommentRetrieveServlet.do");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
