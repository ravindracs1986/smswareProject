package com.smsaware.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reply")
public class ReplyComments {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -8411036809386764861L;
	private Long replyId;
	private String username;
	private String email;
	private String comments;
	private Long commentsId;
	private String approved;
	private Date replyDate;
	
	public ReplyComments() {
	}

	public ReplyComments(String username, String email, String comments, Long commentsId, String approved,
			Date replyDate) {
		this.username = username;
		this.email = email;
		this.comments = comments;
		this.commentsId = commentsId;
		this.approved = approved;
		this.replyDate = replyDate;
	}
	@Id
	@GeneratedValue
	@Column(name = "replyId")
	public Long getReplyId() {
		return replyId;
	}

	public void setReplyId(Long replyId) {
		this.replyId = replyId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Long getCommentsId() {
		return commentsId;
	}

	public void setCommentsId(Long commentsId) {
		this.commentsId = commentsId;
	}

	public String getApproved() {
		return approved;
	}

	public void setApproved(String approved) {
		this.approved = approved;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "ReplyComments [replyId=" + replyId + ", username=" + username + ", email=" + email + ", comments="
				+ comments + ", commentsId=" + commentsId + ", approved=" + approved + ", replyDate=" + replyDate + "]";
	}

	
	
}
