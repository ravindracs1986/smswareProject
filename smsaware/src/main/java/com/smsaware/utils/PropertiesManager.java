package com.smsaware.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesManager {	


	private static final String SMSAWARE_PROPERTIES = "smsaware.properties";
	
	private static PropertiesManager  instance = null;

	private Properties prop= new Properties();
	
	
	private PropertiesManager()
	{
		
		InputStream inputStream = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream(SMSAWARE_PROPERTIES);

		try {
			prop.load(inputStream);
			
			
		} catch (IOException e) {
			System.out.println("Unable to load the properties file:" + SMSAWARE_PROPERTIES);		
		}
				 
	}
	

	public static synchronized PropertiesManager getInstance(){
		
		if(instance == null){
			instance = new PropertiesManager();
		}
		return instance;
		
	}
	
	public String getValue(String key){
		return this.prop.getProperty(key);
	}
	
	

}
