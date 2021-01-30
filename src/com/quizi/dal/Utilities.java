package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Utilities {
	
	private String db_urlString;
	private String db_user;
	private String db_password;

	public static Connection getConnection() {
		Connection connection = null;
		
		loadProperties();

		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(db_urlString, db_user, db_password);

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
	
	public static void loadProperties() {
        try (InputStream input = new FileInputStream("database.properties")) {

            Properties prop = new Properties();

            // load a properties file
            prop.load(input);
            db_urlString = prop.getProperty("db.urlString");
            db_user = prop.getProperty("db.user");
            db_password = prop.getProperty("db.password");
            
            // get the property value and print it out
            System.out.println(db_urlString);
            System.out.println(db_user);
            System.out.println(db_password);

        } catch (IOException ex) {
            ex.printStackTrace();
        }
	}
}
