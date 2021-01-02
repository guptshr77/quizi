package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.quizi.bo.*;
import com.quizi.model.LoginInfo;
import com.quizi.model.User;;

public class UserDAO {
	
	public int validateUsername(String username) {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet r = null;
		int validateResult = -1;
		
		try {
			stmt = con.createStatement();
			String sqlUsername = "SELECT count(*) AS rowcount FROM quser WHERE username = '" + username + "';";
			System.out.println(sqlUsername);
			r = stmt.executeQuery(sqlUsername);
			r.next();
			if (r.getInt("rowcount") > 0 ) {
				System.out.println("This User Name has already been taken");
				validateResult = 0;
			}else {
				System.out.println("New User");
				validateResult = 1;
			}

		} catch (SQLException e) {
			System.out.println(e.toString());
		}finally {
			try {
				if(con != null) {
					r.close();	
					con.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		return validateResult;
	}
	
	public void addUser(User user) {
		Connection con = getConnection();
		try {
			Statement stmt = con.createStatement();
			String sqlQuser = "INSERT INTO QUSER(username, password, firstName, lastName) values('" 
								+ user.getUsername() + "', '"
								+ user.getPassword() + "', '"
								+ user.getFirstName() + "', '"
								+ user.getLastName()						
								+ "')";
			System.out.println(sqlQuser);
			stmt.executeUpdate(sqlQuser);
			stmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		}finally {
				try {
					if(con != null)
						con.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
		}
	}

	public void validateCredentials(UserBO user) {
		getConnection();
	}

	private Connection getConnection() {
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
	
	public int login(LoginInfo login){
		Connection con = getConnection();
		Statement stmt = null;
		int loginSuccess = -1;
		ResultSet r = null;
		
		try {
			stmt = con.createStatement();
			String sqlLogin = "SELECT count(*) AS rowcount FROM quser WHERE username = '" + login.getUsername() +"'  and password = '" + login.getPassword() + "';";
			System.out.println(sqlLogin);
			r = stmt.executeQuery(sqlLogin);
			r.next();
			
			if (r.getInt("rowcount") == 1) {
				loginSuccess = 0;				
			}else {
				loginSuccess = 1;
			}
			

		} catch (SQLException e) {
			loginSuccess = 1;
			e.printStackTrace();
		}
		return loginSuccess;	
	}
		
}
