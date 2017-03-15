package com.smsaware.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.smsaware.model.Comments;
import com.smsaware.model.Registration;
import com.smsaware.model.ReplyComments;
import com.smsaware.utils.HibernateUtil;

public class CommentsDao implements ICommentsDao{

	@Override
	public List<Comments> submitComments(Comments comments) {
		List<Comments>  response = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(comments);
			response = (List<Comments>) session.createQuery("from Comments").list();
			/*for (Comments s : Registrations) {
				System.out.println("comments @@@@");

			}*/
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return response;
	}

	@Override
	public Map<Integer,List<Comments>> getComments(int pageid, int total) {
		// TODO Auto-generated method stub
		
		Map<Integer,List<Comments>> response =new HashMap<Integer,List<Comments>>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		List<Comments> commentsList=null;
		int count=0;
		try {
			tx = session.beginTransaction();
			commentsList = (List<Comments>) session.createQuery("from Comments").setFirstResult(pageid).setMaxResults(total).list();
			count = ((Long)session.createQuery("select count(*) from Comments").uniqueResult()).intValue();
			response.put(count, commentsList);
			
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return response;
	}

	@Override
	public List<ReplyComments> submitReply(ReplyComments comments) {
		List<ReplyComments>  response = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(comments);
			response = (List<ReplyComments>) session.createQuery("from ReplyComments").list();
			/*for (Comments s : Registrations) {
				System.out.println("comments @@@@");

			}*/
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return response;
	}

	@Override
	public List<ReplyComments> getReply(long comntId) {
		List<ReplyComments> commentReply=null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			commentReply = (List<ReplyComments>) session.createQuery("from ReplyComments R WHERE R.commentsId = '" + comntId + "'").list();
			
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return commentReply;
	}

	@Override
	public int changePassword(String oldPassword, String newPassword,Long userId) {
		int result=0;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			Query query = session
					.createQuery("update Registration set password= '" + newPassword + "' where id='" + userId + "'");
			result = query.executeUpdate();
			

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();

		}
		return result;
		
	}

}
