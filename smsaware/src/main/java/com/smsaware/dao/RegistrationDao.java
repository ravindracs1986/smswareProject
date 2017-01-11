package com.smsaware.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import com.smsaware.model.Address;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.utils.Database;



public class RegistrationDao implements IRegistrationDao{
	
	
	
	@Override
	public Long saveUser(Registration registration) {
		Database dataBase = new Database();
		Connection conn=null;
		ResultSet result = null;
		PreparedStatement statement = null;
		Boolean isInserted=false;
		Long idForAddress =null;
		System.out.println(" @@@@@@@@@@@@  $$$$$$$$$$$$");
		conn =dataBase.getConnection();
		//SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		 try{
			//String insertUser = "insert into USER_REGISTRATION(NAME,BIRTH_DATE,GENDER,NATIONALITY,WEBSITE,NO_OF_SMS,EMAIL,PASSWORD,PHONE) values(?,?,?,?,?,?,?,?,?)";
				statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.registerUser,Statement.RETURN_GENERATED_KEYS);
				statement.setString(1, registration.getName());
				statement.setString(2, registration.getBirthdate());
				statement.setString(3, registration.getGender());
				statement.setString(4, registration.getNationality());
				statement.setString(5, "wwww");
				statement.setString(6, "5");
				statement.setString(7, registration.getEmail());
				statement.setString(8, registration.getPassword());
				statement.setLong(9, registration.getPhone());
				
				int resultValue=statement.executeUpdate();
				 if (resultValue == 0) {
			            throw new SQLException("Creating user failed, no rows affected.");
			        }
				System.out.println("resultValue==>>"+resultValue);
				
				 try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
			            if (generatedKeys.next()) {
			            	idForAddress=generatedKeys.getLong(1);
			            	registration.setId(idForAddress);
			            	isInserted=true;
			            }
			            else {
			                throw new SQLException("Creating user failed, no ID obtained.");
			            }
			        }
				
		 if(isInserted){
			 saveAddrees(registration.getAddress(),idForAddress);
		 }
				
		 }catch(Exception e){
			 e.printStackTrace();
			 System.out.println("exception while saving");
		 }finally{
			 
			 try {
				 conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		 }
		
		
		//sessionFactory.getCurrentSession().save(registration);
		
		return idForAddress;
	}

	private void saveAddrees(Address address,Long ids) {
		System.out.println("secendary key==>"+ids);
		ResultSet result = null;
		PreparedStatement statement = null;
		Database dataBase = new Database();
		Connection conn=null;
		conn = dataBase.getConnection();
		try{
			//String insertA = "insert into USER_REGISTRATION(NAME,BIRTH_DATE,GENDER,NATIONALITY,WEBSITE,NO_OF_SMS,EMAIL,PASSWORD,PHONE) values(?,?,?,?,?,?,?,?,?)";
			statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.registerAddress,Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, address.getUserAddress());
			statement.setString(2, address.getStreet());
			statement.setString(3, address.getCity());
			statement.setString(4, address.getState());
			statement.setString(5, address.getZipCode());
			statement.setLong(6, ids);
			
			statement.executeUpdate();
			result=statement.getGeneratedKeys();
			int id=-1;
			if(result.next()){
				id = result.getInt(1);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			 System.out.println("exception while saving");
		}finally{
			 
			 try {
				 conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		 }
		
		
	}

	@Override
	public Map<Boolean,Long> checkUser(String email, Long phone) {
		Map<Boolean,Long> isUser = new HashMap<Boolean,Long>();
		//boolean isUser=false;
		ResultSet result = null;
		PreparedStatement statement = null;
		Database dataBase = new Database();
		Connection conn=null;
		conn = dataBase.getConnection();
		try{
			statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.checkUser);
			statement.setString(1, email);
			statement.setLong(2, phone);
			result = statement.executeQuery();
			while (result.next()) {
				System.out.print("Old UserId Found while registation"+result.getString(1));
				Long userId=result.getLong(1);
				if(userId!=null && userId!=0){
					isUser.put(true, userId);
				}else{
					isUser.put(false, 0l);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			 System.out.println("exception while checking user");
		}finally{
			 
			 try {
				 conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		 }
		
		
		return isUser;
	}



	@Override
	public Map<Boolean, Registration> checkOTP(Long userId, String email,Long phone,String userOTP) {
		Map<Boolean, Registration> userOTPObject= new HashMap<Boolean, Registration>();
		ResultSet result = null;
		PreparedStatement statement = null;
		Database dataBase = new Database();
		Connection conn=null;
		conn = dataBase.getConnection();
		
		try{
			//SELECT table1.field1,table1.field2, table2.field3,table2.field8 from table1,table2 where table1.field2 = something and table2.field3 = somethingelse
			String query="SELECT user_registration.NAME,user_registration.EMAIL,user_registration.PHONE,user_registration.BIRTH_DATE,user_registration.GENDER,user_registration.NATIONALITY,"
					+ "user_registration.WEBSITE,user_registration.NO_OF_SMS,"
					+ " user_otp.userId,user_otp.OTP from user_registration,user_otp where user_registration.id = user_otp.userId and user_otp.OTP ="+userOTP+"";
			//statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.userOTPCheck);
			statement = conn.prepareStatement(query);
			//statement.setString(1, userOTP);
			//statement.setLong(2, phone);
			result = statement.executeQuery();
			while (result.next()) {
				System.out.print("Old UserId Found while registation"+result.getString(1));
				Long dbuUserId=result.getLong(9);
				String dbOTP=result.getString(10);
				if(userId!=null && userId!=0 && userId==dbuUserId && dbOTP.equalsIgnoreCase(userOTP)){
					userOTPObject.put(true, setDBResponse(result));
				}else{
					userOTPObject.put(false, null);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			 System.out.println("exception while checking user");
		}finally{
			 
			 try {
				 conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		 }
		
		
		
		return userOTPObject;
	}

	private Registration setDBResponse(ResultSet result) throws SQLException {
		Registration regi= new Registration ();
		if(result!=null){
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
	}

}
