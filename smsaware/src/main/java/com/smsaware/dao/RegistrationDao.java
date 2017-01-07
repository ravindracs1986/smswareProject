package com.smsaware.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.smsaware.model.Address;
import com.smsaware.model.Login;
import com.smsaware.model.Registration;
import com.smsaware.utils.Database;



public class RegistrationDao implements IRegistrationDao{
	
	
	
	@Override
	public int saveUser(Registration registration) {
		Database dataBase = new Database();
		Connection conn=null;
		ResultSet result = null;
		PreparedStatement statement = null;
		Boolean isInserted=false;
		Long idForAddress;
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
		
		return 1;
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
	public boolean checkUser(String email, Long phone) {
		boolean isUser=false;
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
				if(userId!=null && userId!=0)
					isUser=true;
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

	

}
