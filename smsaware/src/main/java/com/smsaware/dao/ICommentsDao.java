package com.smsaware.dao;

import java.util.List;
import java.util.Map;

import com.smsaware.model.Comments;
import com.smsaware.model.ReplyComments;

public interface ICommentsDao {

	public List<Comments> submitComments(Comments comments);
	public Map<Integer,List<Comments>> getComments(int pageid,int total);
	public List<ReplyComments> submitReply(ReplyComments comments);
	public List<ReplyComments> getReply(long comntId);
	public int changePassword(String oldPassword,String newPassword,Long userId);
}
