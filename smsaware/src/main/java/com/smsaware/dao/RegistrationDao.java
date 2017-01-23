package com.smsaware.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.smsaware.model.Address;
import com.smsaware.model.Registration;
import com.smsaware.utils.HibernateUtil;

public class RegistrationDao implements IRegistrationDao {

	@Override
	public Long saveUser(Registration registration,Address address) {
		Long response = 0l;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
			try {
				tx = session.beginTransaction();
				response = (Long) session.save(registration);
				/*List<Student> students = (List<Student>)session.createQuery("from Student ").list();
		        for(Student s: students){
		            System.out.println("Details : "+s);
		        }
		         
		        session.getTransaction().commit();
		        session.close();*/  
				
				tx.commit();
				
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}

		if(response!=0l){
			saveAddrees(address,response);
		}
		return response;
	}

	

	private void saveAddrees(Address address, Long id) {
		System.out.println("secendary key==>" + id);
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			address= new Address(address.getUser_address(),address.getStreet(),address.getCity(),address.getState(),address.getZip(),id);
			//address.setUserId(ids);
			session.save(address);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@Override
	public Map<Boolean, Long> checkUser(String email, Long phone) {
		Map<Boolean, Long> isUser = new HashMap<Boolean, Long>();
		// boolean isUser=false;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		Registration user = null;
		try {
			tx = session.beginTransaction();
			String sql = "SELECT * FROM user_registration where EMAIL='" + email + "' or PHONE='"+phone+"'";
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
						isUser.put(true, employee.getId());
					} else {
						isUser.put(false, 0l);
					}
		         }
			
	         }
			tx.commit();

			

		} catch (Exception e) {
			
			
			e.printStackTrace();
			System.out.println("exception while checking user");
		}

		return isUser;
	}

	@Override
	public Map<Boolean, Registration> checkOTP(Long userId, String email, Long phone, String userOTP) {
		Map<Boolean, Registration> userOTPObject = new HashMap<Boolean, Registration>();
		/*ResultSet result = null;
		PreparedStatement statement = null;
		Database dataBase = new Database();
		Connection conn = null;
		conn = dataBase.getConnection();

		try {
			// SELECT table1.field1,table1.field2, table2.field3,table2.field8
			// from table1,table2 where table1.field2 = something and
			// table2.field3 = somethingelse
			String query = "SELECT user_registration.NAME,user_registration.EMAIL,user_registration.PHONE,user_registration.BIRTH_DATE,user_registration.GENDER,user_registration.NATIONALITY,"
					+ "user_registration.WEBSITE,user_registration.NO_OF_SMS,"
					+ " user_otp.userId,user_otp.OTP from user_registration,user_otp where user_registration.id = user_otp.userId and user_otp.OTP ="
					+ userOTP + "";
			// statement =
			// conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.userOTPCheck);
			statement = conn.prepareStatement(query);
			// statement.setString(1, userOTP);
			// statement.setLong(2, phone);
			result = statement.executeQuery();
			while (result.next()) {
				System.out.print("Old UserId Found while registation" + result.getString(1));
				Long dbuUserId = result.getLong(9);
				String dbOTP = result.getString(10);
				if (userId != null && userId != 0 && userId == dbuUserId && dbOTP.equalsIgnoreCase(userOTP)) {
					userOTPObject.put(true, setDBResponse(result));
				} else {
					userOTPObject.put(false, null);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("exception while checking user");
		} finally {

			try {
				conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
*/
		return userOTPObject;
	}

	/*private Registration setDBResponse(ResultSet result) throws SQLException {
		Registration regi = new Registration();
		if (result != null) {
			regi.setId(result.getLong("userId"));
			regi.setName(result.getString("NAME"));
			regi.setBirthdate(result.getString("BIRTH_DATE"));
			regi.setGender(result.getString("GENDER"));
			regi.setNationality(result.getString("NATIONALITY"));
			regi.setWebsite(result.getString("WEBSITE"));
			regi.setNoOfSms(result.getInt("NO_OF_SMS"));
			regi.setEmail(result.getString("EMAIL"));
			regi.setPhone(result.getLong("PHONE"));
		}
		return regi;
	}*/

}
