package com.smsaware.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Query;
import com.smsaware.model.Address;
import com.smsaware.model.Contacts;
import com.smsaware.model.Registration;
import com.smsaware.model.User;
import com.smsaware.utils.Database;
import com.smsaware.utils.HibernateUtil;
import com.smsaware.utils.SendMail;
import com.smsaware.utils.SendSMS;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
public class RegistrationDao implements IRegistrationDao {

	@Override
	public User saveUser(Registration registration, Address address) {
		Long response = 0l;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		User user = new User();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			response = (Long) session.save(registration);
			List<Registration> Registrations = (List<Registration>) session
					.createQuery("from Registration R WHERE R.id = '" + response + "'").list();
			for (Registration s : Registrations) {
				user.setRegistration(s);

			}
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

		if (response != 0l) {
			if (saveAddrees(address, response, user) != null) {

			}
		}
		return user;
	}

	private User saveAddrees(Address address, Long id, User user) {
		Long addressId = 0l;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			address = new Address(null, null, null, null, null, id);
			addressId = (Long) session.save(address);
			List<Address> userAddress = (List<Address>) session
					.createQuery("from Address A WHERE A.addressId = '" + addressId + "'").list();
			for (Address add : userAddress) {
				user.setAddress(add);

			}

			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
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
			String sql = "SELECT * FROM user_registration where EMAIL='" + email + "' or PHONE='" + phone + "'";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Registration.class);
			List employees = query.list();
			if (employees != null) {
				for (Iterator iterator = employees.iterator(); iterator.hasNext();) {
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
		} finally {
			session.close();
		}

		return isUser;
	}

	@Override
	public Map<Boolean, User> checkOTP(Long userId, String email, Long phone, String userOTP) {
		Map<Boolean, User> userOTPObject = new HashMap<Boolean, User>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		User userObject = new User();
		try {
			String sql = "SELECT * FROM user_registration WHERE user_registration.id = (SELECT userId FROM user_otp WHERE user_otp.currentOtp ="
					+ userOTP + " AND isAuthenticated=0)";

			// String sql1="from Registration R WHERE R.id =(select
			// userOTP.userId from UserOTP userOTP where UserOTP.currentOtp='"+
			// userOTP +"')";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Registration.class);
			List regList = query.list();
			if (regList != null && regList.size() != 0) {
				Object obj = regList.get(0);

				if (obj instanceof Registration) {
					System.out.println("object get");
				}

				for (Iterator iterator = regList.iterator(); iterator.hasNext();) {
					Registration registration = (Registration) iterator.next();
					if (registration.getId() != null && registration.getId() != 0) {
						userObject.setRegistration(registration);
						userObject.setAddress(getAddress(registration.getId()));
						userOTPObject.put(true, userObject);
						updateOtp(registration.getId());
					} else {
						userOTPObject.put(false, null);
					}
				}

			}

		} catch (Exception e) {
		} finally {
			session.close();
		}

		return userOTPObject;
	}

	private void updateOtp(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			String Y = "Y";
			Query query = session
					.createQuery("update Registration set authenticated= '" + Y + "' where id='" + id + "'");
			int result = query.executeUpdate();
			if(result!=0){
				updateOtpTable(id);
			}

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

	private void updateOtpTable(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			int Y = 1;
			Query query = session
					.createQuery("update UserOTP set isAuthenticated= '" + Y + "' where userId='" + id + "'");
			query.executeUpdate();
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
	public Address getAddress(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		Address add = new Address();
		try {
			tx = session.beginTransaction();
			List<Address> userAddress = (List<Address>) session
					.createQuery("from Address A WHERE A.userId = '" + id + "'").list();

			add = userAddress.get(0);
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();

		}
		return add;
	}

	@Override
	public Map<Boolean, User> getUserData(Long userId) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		User user = new User();
		Transaction tx = null;
		Map<Boolean, User> result =new HashMap<Boolean, User>();
		
		try {
			tx = session.beginTransaction();
			
			List<Registration> Registrations = (List<Registration>) session
					.createQuery("from Registration R WHERE R.id = '" + userId + "'").list();
			for (Registration regiObject : Registrations) {
			/*if(regiObject.getImageInByte()!=null){
				regiObject=	getImageFromDb(regiObject.getImageInByte());
			}*/
				user.setRegistration(regiObject);

			}
			List<Address> userAddress = (List<Address>) session
					.createQuery("from Address A WHERE A.userId = '" + userId + "'").list();
			for (Address add : userAddress) {
				user.setAddress(add);

			}
			List<Contacts> contacts = (List<Contacts>) session.createQuery("from Contacts C WHERE C.userId = '" + userId + "'").list();
			user.setContacts(contacts);
			result.put(true, user);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public int updateProfile(String userId, String name, String lastName, String email, String aboutMe, String userAddress, String city, String state, String zip) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		int result=0;
		StringBuilder str= new StringBuilder();
		String sql="update Registration set ";
		try {
			tx = session.beginTransaction();
			
			if(name!=null){
				str=str.append("name = '"+name+"'"+",");
			}if(lastName!=null){
				str=str.append("lastName = '"+lastName+"'"+",");
			}if(email!=null){
				str=str.append("email = '"+email+"'"+",");
			}if(aboutMe!=null){
				str=str.append("aboutMe = '"+aboutMe+"'");
			}
			sql=sql+str.toString();
			System.out.println("sql==>>"+sql);
			Long id=Long.valueOf(userId);
			String Y = "Y";
			Query query = session.createQuery(""+sql+" where id='" + id + "'");
			result = query.executeUpdate();
			if(result!=0){
				updateAddress(id,userAddress,city,state,zip);
			}

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();

		}
		return result;
	}

	private void updateAddress(Long id, String userAddress, String city, String state, String zip) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		StringBuilder str= new StringBuilder();
		String sql="update Address set ";
		try {
			tx = session.beginTransaction();
			
			if(userAddress!=null){
				str=str.append("user_address = '"+userAddress+"'"+",");
			}if(city!=null){
				str=str.append("city = '"+city+"'"+",");
			}if(state!=null){
				str=str.append("state = '"+state+"'"+",");
			}if(zip!=null){
				str=str.append("zip = '"+zip+"'");
			}
			sql=sql+str.toString();
			System.out.println("sql for address==>>"+sql);
			
			Query query = session.createQuery(""+sql+" where userId='" + id + "'");
			 query.executeUpdate();
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
	public int uploadProfileImage(InputStream inputStream,Long userId) {
		int result=0;
		Connection conn = null;
		 Database database = new Database();
		 ResultSet rs = null;
		try {
			if(inputStream!=null && inputStream.toString()!=null){
			conn=database.getConnection();
			String sql = "select * from profileImage where userId = '"+userId+"'";
            PreparedStatement statement = conn.prepareStatement(sql);
            rs= statement.executeQuery();
            if(rs.next()){
            	result=1;
            	String sqlDelete ="DELETE FROM profileImage WHERE userId='"+userId+"'";
            	result=statement.executeUpdate(sqlDelete);
            }
			
				String sqlInsert = "INSERT INTO profileImage (userId, photo) values (?, ?)";
		        PreparedStatement statementInsert = conn.prepareStatement(sqlInsert);
		        statementInsert.setLong(1, userId);
		        statementInsert.setBlob(2, inputStream);
		        result= statementInsert.executeUpdate();
		
            
            conn.close();
			} 
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}

	public List<Contacts>  getContacts(Long id) {
		List<Contacts> contacts=null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			contacts = (List<Contacts>) session.createQuery("from Contacts C WHERE C.userId = '" + id + "'").list();

			
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();

		}
		return contacts;
	}

	@Override
	public String forgotPassword(Long phone, String email) {
		String result="failure";
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			String sql = "SELECT * FROM user_registration where EMAIL='" + email + "' or PHONE='" + phone + "'";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Registration.class);
			List employees = query.list();
			if (employees != null) {
				for (Iterator iterator = employees.iterator(); iterator.hasNext();) {
					Registration employee = (Registration) iterator.next();
					if(employee.getPhone().equals(phone) && employee.getEmail().equalsIgnoreCase(email)){
						String otp=null;
							try {
									otp = com.smsaware.utils.AESCryptUtil.decrypt(employee.getPassword());
								} catch (Exception e) {
									// TODO Auto-generated catch block
									System.out.println("Encryption exception " + e.getMessage());
									e.printStackTrace();
								}
								
						//SendMail mail=new SendMail(email,otp,employee.getName());
						//SendSMS sms = new SendSMS();
						//String smsResponse=sms.sendSms(otp,phone);
						result="success";
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
		} finally {
			session.close();

		}
		
		
		return result;
	}

}
