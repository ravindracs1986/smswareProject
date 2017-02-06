package com.smsaware.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comments {

	/**
	 * SMSAWARE
	 */
	private static final long serialVersionUID = -8411036809386764861L;
	private Long commentsId;
	private String username;
	private String email;
	private String website;
	private String subjects;
	private String comments;
	private Date commentDate;
	private Long parentsId;
	private String approved;
	
	public Comments() {
	}


	public Comments(String username, String email, String website, String subjects, String comments,Date commentDate, Long parentsId,String approved) {
		this.username = username;
		this.email = email;
		this.website = website;
		this.subjects = subjects;
		this.comments = comments;
		this.commentDate = commentDate;
		this.parentsId = parentsId;
		this.approved=approved;
	}

	@Id
	@GeneratedValue
	@Column(name = "commentsId")
	public Long getCommentsId() {
		return commentsId;
	}


	public void setCommentsId(Long commentsId) {
		this.commentsId = commentsId;
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


	public String getWebsite() {
		return website;
	}


	public void setWebsite(String website) {
		this.website = website;
	}


	public String getSubjects() {
		return subjects;
	}


	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public Date getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}


	public Long getParentsId() {
		return parentsId;
	}


	public void setParentsId(Long parentsId) {
		this.parentsId = parentsId;
	}
	public String getApproved() {
		return approved;
	}
	public void setApproved(String approved) {
		this.approved = approved;
	}


	@Override
	public String toString() {
		return "Comments [commentsId=" + commentsId + ", username=" + username + ", email=" + email + ", website="
				+ website + ", subjects=" + subjects + ", comments=" + comments + ", commentDate=" + commentDate + ", parentsId=" + parentsId + "]";
	}
	
	

}
