package com.smsaware.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

	private Connection con;
	public Connection getConnection(){
		if (con == null) {
			try {
				
				try {
					Class.forName(PropertiesManager.getInstance().getValue("JDBCDriver")).newInstance();
					con = DriverManager.getConnection(PropertiesManager.getInstance().getValue("DbHost"), PropertiesManager.getInstance().getValue("DbUserName"), PropertiesManager.getInstance().getValue("DbPassword"));
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} catch (SQLException ex) {
				System.out.println(ex);
			}
		}

		return con;
	}
//Connection con = Database.getInstance().getConnection();
}
