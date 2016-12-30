package com.smsaware.model;

import java.io.Serializable;



/*@Entity
@Table(name="ADDRESS")*/
public class Address implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8411036809386764861L;
	/*@Id
	@GeneratedValue*/
	//@Column(name="ADDRESS_ID")
	private Long id;
	//@Column(name="USER_ADDRESS")
	private String userAddress;
	//@Column(name="STREET")
	private String street;
	//@Column(name="CITY")
	private String city;
	//@Column(name="STATE")
	private String state;
	//@Column(name="ZIP")
	private String zipCode;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	
	
	
	
}
