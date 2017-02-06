package com.smsaware.service;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
@WebServlet("/views/AdminLogout.do")
public class AdminLogout extends HttpServlet {  
        /**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = 16778L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            response.sendRedirect("/smsaware/views/admin.jsp");  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
             
    }  
}  
