package com.smsaware.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_registration")
public class Registration{
	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -4393320270992003990L;

	private Long id;
	private String name;
	private String birth_date;
	private String gender;
	private String nationality;
	private String website;
	private Integer no_Of_Sms;
	private String email;
	private String password;
	private Long phone;
	private Date creation_Date;
	private String authenticated;
	private String lastName;
	private String aboutMe;
	private String securityQuen;
	private String securityAns;
	//private Blob imageInByte;
	/*@OneToOne
	@JoinColumn(name="ADDRESS_ID")
	private Address address;*/
	
	public Registration(){}
	
	public Registration(String name, String birth_date, String gender, String nationality, String website,
			Integer no_Of_Sms, String email, String password, Long phone, Date creation_Date,
			String authenticated,String lastName,String aboutMe,String securityQuen,String securityAns) {
		this.name = name;
		this.birth_date = birth_date;
		this.gender = gender;
		this.nationality = nationality;
		this.website = website;
		this.no_Of_Sms = no_Of_Sms;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.creation_Date = creation_Date;
		this.authenticated = authenticated;
		this.lastName = lastName;
		this.aboutMe = aboutMe;
		this.securityQuen = securityQuen;
		this.securityAns = securityAns;
	}
	
	@Id
	@GeneratedValue
	@Column(name = "id")
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
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
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
	public Integer getNo_Of_Sms() {
		return no_Of_Sms;
	}
	public void setNo_Of_Sms(Integer no_Of_Sms) {
		this.no_Of_Sms = no_Of_Sms;
	}
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
	public Date getCreation_Date() {
		return creation_Date;
	}
	public void setCreation_Date(Date creation_Date) {
		this.creation_Date = creation_Date;
	}
	public String getAuthenticated() {
		return authenticated;
	}
	public void setAuthenticated(String authenticated) {
		this.authenticated = authenticated;
	}


	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	public String getSecurityQuen() {
		return securityQuen;
	}

	public void setSecurityQuen(String securityQuen) {
		this.securityQuen = securityQuen;
	}

	public String getSecurityAns() {
		return securityAns;
	}

	public void setSecurityAns(String securityAns) {
		this.securityAns = securityAns;
	}
	
	
	/*public Blob getImageInByte() {
		return imageInByte;
	}

	public void setImageInByte(Blob imageInByte) {
		this.imageInByte = imageInByte;
	}*/

	
	
	
	@Override
	public String toString() {
		return "Registration [id=" + id + ", name=" + name + ", birth_date=" + birth_date + ", gender=" + gender
				+ ", nationality=" + nationality + ", website=" + website + ", no_Of_Sms=" + no_Of_Sms + ", email="
				+ email + ", password=" + password + ", phone=" + phone + ", creation_Date=" + creation_Date
				+ ", "
				+ "authenticated=" + authenticated + ",lastName=" + lastName + ",aboutMe=" + aboutMe + ",securityQuen=" + securityQuen + ",securityAns=" + securityAns + "]";
	}

	
	
	
	
	
}
