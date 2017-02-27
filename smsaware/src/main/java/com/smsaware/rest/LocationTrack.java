package com.smsaware.rest;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
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
import com.smsaware.model.LocationTrackVO;
import com.smsaware.model.User;
import com.smsaware.utils.Database;
import com.smsaware.utils.HibernateUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

@WebServlet("/LocationTrack.do")
public class LocationTrack extends HttpServlet {

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
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phoneValue");
		String half1;
        String half2;
        Connection conn = null;
		Database database = new Database();
		ResultSet rs = null;
		List<LocationTrackVO> locList =new ArrayList<LocationTrackVO>();
		
		try {
			if(phone!=null && !phone.isEmpty()){
			int count=0;
			conn=database.getConnection();
			half1 = phone.substring(0, 5);
            half2 = phone.substring(0, 4);
            String sql = "select * from numberlocator where preNumber='" + half2 + "' or preNumber='" + half1 + "'";
            PreparedStatement statement = conn.prepareStatement(sql);
            rs= statement.executeQuery();
            while(rs.next()){
            	count=count+1;
            	LocationTrackVO loc =new LocationTrackVO();
            	loc.setId(rs.getLong(1));
            	loc.setPreNumber(rs.getString(2));
            	loc.setProvider(rs.getString(3));
            	loc.setState(rs.getString(4));
            	locList.add(loc);
            }
			System.out.println("List of location record : "+count+"for given number:"+phone);
			}else{
				request.setAttribute("errorMessage", "System is not able to find location");	
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
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
		if (locList.size() > 0) {
			request.setAttribute("mobileLocator", locList.get(0));

		} else {
			request.setAttribute("errorMessage", "System is not able to find location");
		}

		request.getSession().setAttribute("user", userObject);
		// request.getSession().setAttribute("contactList", contacts);
		request.getRequestDispatcher("profile.jsp").include(request, response);
	}

}
