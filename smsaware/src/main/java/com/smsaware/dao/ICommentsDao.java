package com.smsaware.dao;

import java.util.List;
import java.util.Map;

import com.smsaware.model.Comments;

public interface ICommentsDao {

	public List<Comments> submitComments(Comments comments);
	public Map<Integer,List<Comments>> getComments(int pageid,int total);
}
