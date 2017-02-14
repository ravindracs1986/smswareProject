package com.smsaware.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_contacts")
public class Contacts {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -8411036809386764861L;
	private Long CONTACT_ID;
	private String CONTACT_NAME;
	private String PHONE_NUMBER;
	private String CITY;
	private String STATE;
	private Long userId;

	public Contacts() {
	}

	public Contacts(String cONTACT_NAME, String pHONE_NUMBER, String cITY, String sTATE, Long userId) {
		CONTACT_NAME = cONTACT_NAME;
		PHONE_NUMBER = pHONE_NUMBER;
		CITY = cITY;
		STATE = sTATE;
		this.userId = userId;
	}

	@Id
	@GeneratedValue
	@Column(name = "CONTACT_ID")
	public Long getCONTACT_ID() {
		return CONTACT_ID;
	}

	public void setCONTACT_ID(Long cONTACT_ID) {
		CONTACT_ID = cONTACT_ID;
	}

	public String getCONTACT_NAME() {
		return CONTACT_NAME;
	}

	public void setCONTACT_NAME(String cONTACT_NAME) {
		CONTACT_NAME = cONTACT_NAME;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getCITY() {
		return CITY;
	}

	public void setCITY(String cITY) {
		CITY = cITY;
	}

	public String getSTATE() {
		return STATE;
	}

	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Contacts [CONTACT_ID=" + CONTACT_ID + ", CONTACT_NAME=" + CONTACT_NAME + ", PHONE_NUMBER="
				+ PHONE_NUMBER + ", CITY=" + CITY + ", STATE=" + STATE + ", userId=" + userId + "]";
	}

}
