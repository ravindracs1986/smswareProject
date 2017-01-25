package com.smsaware.dao;

import java.util.Map;

import com.smsaware.model.Address;
import com.smsaware.model.Registration;
import com.smsaware.model.User;

public interface IRegistrationDao {

	public User saveUser(Registration registration, Address address);

	public Map<Boolean, Long> checkUser(String email, Long phone);

	public Map<Boolean, User> checkOTP(Long userId, String email, Long phone, String userOTP);

	public Address getAddress(Long id);
}
