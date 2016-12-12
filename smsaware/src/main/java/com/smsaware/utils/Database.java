package com.smsaware.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

	private static Database dbIsntance;
	private static Connection con;

	private Database() {
		// private constructor //
	}

	public static Database getInstance() {
		if (dbIsntance == null) {
			dbIsntance = new Database();
		}
		return dbIsntance;
	}

	public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException {

		if (con == null) {
			try {
				//jdbc:mysql://localhost:3307/dbname
				System.out.println("database class connection^%%%%%%");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				String host = "jdbc:mysql://localhost:3306/smsaware";
				String username = "root";
				String password = "smsaware";
				con = DriverManager.getConnection(host, username, password);
			} catch (SQLException ex) {
				System.out.println(ex);
			}
		}

		return con;
	}
//Connection con = Database.getInstance().getConnection();
}
