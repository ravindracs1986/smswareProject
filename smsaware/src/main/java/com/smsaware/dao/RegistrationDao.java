package com.smsaware.dao;

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
import com.smsaware.model.Registration;
import com.smsaware.model.User;
import com.smsaware.utils.HibernateUtil;

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

}
