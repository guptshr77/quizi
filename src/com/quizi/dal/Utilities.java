package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class Utilities {

	public static Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost/quizi","postgres","tiger");

			if (connection != null) {
				System.out.println("Connection OK");

			}else {
				System.out.println("Connection failed");
			}

		}catch(Exception e) {
			System.out.println(e);
		}

		return connection;
	}
}
