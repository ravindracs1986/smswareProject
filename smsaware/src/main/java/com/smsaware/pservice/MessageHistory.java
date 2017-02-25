package com.smsaware.pservice;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MessageHistory")
public class MessageHistory {
	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -8411036809386764855L;
	
	private Long messageHistoryId;
	private Long phone;
	private String message;
	private Date messageDate;
	private Long userId;
	
	public MessageHistory(){}
	
	public MessageHistory(Long phone, String message, Date messageDate, Long userId) {
		this.phone = phone;
		this.message = message;
		this.messageDate = messageDate;
		this.userId = userId;
	}
	@Id
	@GeneratedValue
	@Column(name = "MessageHistoryId")
	public Long getMessageHistoryId() {
		return messageHistoryId;
	}
	public void setMessageHistoryId(Long messageHistoryId) {
		this.messageHistoryId = messageHistoryId;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MessageHistory [messageHistoryId=" + messageHistoryId + ", phone=" + phone + ", message=" + message
				+ ", messageDate=" + messageDate + ", userId=" + userId + "]";
	}
	
	
	
	
	
}
