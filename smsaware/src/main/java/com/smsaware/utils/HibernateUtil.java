package com.smsaware.utils;

import java.net.URL;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {

	 private static SessionFactory sessionFactory = buildSessionFactory();
    //private static final SessionFactory sessionFactory;
   // public static String  hibernatePropsFilePath = "/com/javawebtutor/model/hibernate.cfg.xml";
    
    //ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
   // URL resource = classLoader.getResource( "/com/javawebtutor/model/hibernate.cfg.xml" );
   // String fullPath = resource.getPath();
    //spublic static String  hibernatePropsFilePath=fullPath;
    /*static {
        try {
           // sessionFactory = new AnnotationConfiguration().configure(hibernatePropsFilePath).buildSessionFactory();
        	sessionFactory = new Configuration()
            .configure(hibernatePropsFilePath)
            .buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }*/

    /*public static Session openSession() {
        return sessionFactory.openSession();
    }*/
    
    private static SessionFactory buildSessionFactory() {
        try {
        	 System.out.println("inside buildSessionFactory ");
            // load from different directory
        	//URL configFile = getServletContext().getResource("/WEB-INF/hibernate.xml");
        	//Configuration().configure(configFile)
        	Configuration config=new Configuration().configure("hibernate.cfg.xml");
        	sessionFactory = config.buildSessionFactory();

            return sessionFactory;

        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
       System.out.println("output");
       if(sessionFactory==null){
    	   System.out.println("sessionfactory null");
    	   buildSessionFactory();
       }
    	return sessionFactory;
    }

    public static void shutdown() {
        // Close caches and connection pools
        getSessionFactory().close();
    }
    
    
    
}