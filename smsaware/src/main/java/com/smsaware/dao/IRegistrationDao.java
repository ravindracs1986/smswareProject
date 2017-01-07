package com.smsaware.dao;


import com.smsaware.model.Registration;

public interface IRegistrationDao {

public int saveUser(Registration registration);
	
public boolean checkUser(String email,Long phone);

}
