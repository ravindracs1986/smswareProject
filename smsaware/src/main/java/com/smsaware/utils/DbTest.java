package com.smsaware.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbTest {

	public static void main(String[] args) throws SQLException {
		

		PreparedStatement statement = null;
		ResultSet resultado = null;
		String query = "SELECT * FROM user";
		Connection conn = null;// Database.getInstance().getConnection();

		try {
			conn = Database.getInstance().getConnection();
			statement = conn.prepareStatement(query);
			resultado = statement.executeQuery();

			while (resultado.next()) {
				System.out.println(resultado.getString(1) + "\t" + resultado.getString(2) + "\t");
			}
		} catch (Exception e) {
			System.err.println("El porque del cascar: " + e.getMessage());
		} finally {
			conn.close();

		}

	}

}
