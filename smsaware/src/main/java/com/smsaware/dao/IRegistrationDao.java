package com.smsaware.dao;


import java.util.Map;

import com.smsaware.model.Address;
import com.smsaware.model.Registration;

public interface IRegistrationDao {

public Long saveUser(Registration registration,Address address);
	
public Map<Boolean,Long> checkUser(String email,Long phone);
public Map<Boolean,Registration> checkOTP(Long userId,String email,Long phone,String userOTP);
}
