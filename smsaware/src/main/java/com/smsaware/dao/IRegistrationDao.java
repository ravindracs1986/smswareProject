package com.smsaware.dao;

import com.smsaware.model.Login;
import com.smsaware.model.Registration;

public interface IRegistrationDao {

public int saveUser(Registration registration);
	
public Registration getUser(Login login);

}
