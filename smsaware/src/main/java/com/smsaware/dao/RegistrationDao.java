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
	 static Connection conn = Database.getInstance().getConnection();
	
	
	@Override
	public int saveUser(Registration registration) {
		ResultSet result = null;
		PreparedStatement statement = null;
		Boolean isInserted=false;
		System.out.println(" @@@@@@@@@@@@  $$$$$$$$$$$$");

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
				
				statement.executeUpdate();
				result=statement.getGeneratedKeys();
				int id=-1;
				if(result.next()){
					id = result.getInt(1);
					isInserted=true;
				}
		 if(isInserted){
			 saveAddrees(registration.getAddress(),id);
		 }
				
		 }catch(Exception e){
			 e.printStackTrace();
			 System.out.println("exception while saving");
		 }finally{
			 
			 try {
				result.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		 }
		
		
		//sessionFactory.getCurrentSession().save(registration);
		
		return 1;
	}

	private void saveAddrees(Address address,int ids) {
		System.out.println("secendary key==>"+ids);
		ResultSet result = null;
		PreparedStatement statement = null;
		try{
			//String insertA = "insert into USER_REGISTRATION(NAME,BIRTH_DATE,GENDER,NATIONALITY,WEBSITE,NO_OF_SMS,EMAIL,PASSWORD,PHONE) values(?,?,?,?,?,?,?,?,?)";
			statement = conn.prepareStatement(com.smsaware.utils.DataBaseQuerys.registerAddress,Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, address.getUserAddress());
			statement.setString(2, address.getStreet());
			statement.setString(3, address.getCity());
			statement.setString(4, address.getState());
			statement.setString(5, address.getZipCode());
			statement.setInt(6, ids);
			
			statement.executeUpdate();
			result=statement.getGeneratedKeys();
			int id=-1;
			if(result.next()){
				id = result.getInt(1);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			 System.out.println("exception while saving");
		}
		
		
	}

	@Override
	public Registration getUser(Login login) {
		// TODO Auto-generated method stub
		return null;
	}

}
