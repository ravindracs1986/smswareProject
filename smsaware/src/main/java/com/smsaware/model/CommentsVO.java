package com.smsaware.model;

import java.util.List;

public class CommentsVO {
private Comments comments;
private List<ReplyComments> reply;


public Comments getComments() {
	return comments;
}
public void setComments(Comments comments) {
	this.comments = comments;
}
public List<ReplyComments> getReply() {
	return reply;
}
public void setReply(List<ReplyComments> reply) {
	this.reply = reply;
}




}
