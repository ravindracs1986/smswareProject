package com.smsaware.model;

import java.util.List;

import com.smsaware.pservice.MessageHistory;

public class User {

	private Registration registration;
	private Address address;
	private List<Contacts> contacts;
	private List<MessageHistory> messageHistory;
	
	public List<MessageHistory> getMessageHistory() {
		return messageHistory;
	}

	public void setMessageHistory(List<MessageHistory> messageHistory) {
		this.messageHistory = messageHistory;
	}

	public Registration getRegistration() {
		return registration;
	}

	public void setRegistration(Registration registration) {
		this.registration = registration;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Contacts> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contacts> contacts) {
		this.contacts = contacts;
	}

}
