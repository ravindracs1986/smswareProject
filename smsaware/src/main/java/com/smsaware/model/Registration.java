package com.smsaware.model;

import java.io.Serializable;

//@Entity
//@Table(name="USER_REGISTRATION")
public class Registration extends Login implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4393320270992003990L;
	//@Id
	//@GeneratedValue
	private Long id;
	//@Column(name="NAME")
	private String name;
	
	//@ManyToOne
	//@JoinColumn(name="address_id")
	private Address address;
	
	//@Column(name="BIRTH_DATE")
	private String birthdate ;
	//@Column(name="GENDER")
	private String gender;
	//@Column(name="NATIONALITY")
	private String nationality;
	//@Column(name="WEBSITE")
	private String website;
	//@Column(name="NO_OF_SMS")
	private Integer noOfSms;
	//@Column(name="AUTHENTICATED")
	//private Boolean authenticated;
	
	//private String email;
	//private String password;
	//private Long phone;
	
	/*public String getEmail() {
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
	}*/
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public Integer getNoOfSms() {
		return noOfSms;
	}
	public void setNoOfSms(Integer noOfSms) {
		this.noOfSms = noOfSms;
	}
	/*public Boolean getAuthenticated() {
		return authenticated;
	}
	public void setAuthenticated(Boolean authenticated) {
		this.authenticated = authenticated;
	}*/
	
	
	
	
	
}
