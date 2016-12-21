package com.smsaware.model;

import java.io.Serializable;

import javax.persistence.Column;

public class Login implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8330557027642483424L;
	//@Column(name="EMAIL")
	private String email;
	//@Column(name="PASSWORD")
	private String password;
	//@Column(name="PHONE")
	private Long phone;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	
	

}
