package com.smsaware.dao;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.smsaware.model.Address;
import com.smsaware.model.Registration;
import com.smsaware.model.User;
import com.smsaware.pservice.MessageHistory;

public interface IRegistrationDao {

	public User saveUser(Registration registration, Address address);

	public Map<Boolean, Long> checkUser(String email, Long phone);

	public Map<Boolean, User> checkOTP(Long userId, String email, Long phone, String userOTP);

	public Address getAddress(Long id);
	
	public Map<Boolean, User> getUserData(Long userId);
	
	public int updateProfile(String userId, String name, String lastName, String email, String aboutMe, String userAddress, String city, String state, String zip);
	
	public int uploadProfileImage(InputStream inputStream,Long userId);
	public String forgotPassword(Long phone,String email);
	
	public Registration getUserForSMSCheck(Long userId);
	public int updateSmsCount(Long userId,int smsBalance);
	public List<MessageHistory> saveMessageHistory(Long mobile,String message,Date smsDate,Long userId);
	public List<MessageHistory> getMessageHistoryById(Long userId);
}
