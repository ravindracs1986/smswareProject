package com.smsaware.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Address")
public class Address {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -8411036809386764861L;
	private Long addressId;
	private String user_address;
	private String street;
	private String city;
	private String state;
	private String zip;
	private Long userId;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Address() {
	}
	
	public Address(String user_address, String street, String city, String state, String zip,Long userId) {
		this.user_address = user_address;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.userId = userId;
	}



	@Id
	@GeneratedValue
	@Column(name = "ADDRESS_ID")
	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	

	//@Column(name = "STREET", nullable = true)
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	//@Column(name = "CITY", nullable = true)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	//@Column(name = "STATE", nullable = true)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	

	public String getUser_address() {
		return user_address;
	}



	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}



	public String getZip() {
		return zip;
	}



	public void setZip(String zip) {
		this.zip = zip;
	}



	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", user_address=" + user_address + ", street=" + street + ", city="
				+ city + ", state=" + state + ", zip=" + zip + ", userId=" + userId + "]";
	}

	
	
}
