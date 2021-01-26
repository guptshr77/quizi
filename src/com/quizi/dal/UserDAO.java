package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.quizi.bo.*;
import com.quizi.model.LoginInfo;
import com.quizi.model.User;

public class UserDAO {

	public int validateUsername(String username) {
		Connection con = Utilities.getConnection();
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
		Connection con = Utilities.getConnection();
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

	public User login(LoginInfo login){
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet r = null;
		User user = null;

		try {
			stmt = con.createStatement();
			String sqlLogin = "SELECT firstName, lastName, userId FROM quser WHERE username = '" + login.getUsername() +"'  and password = '" + login.getPassword() + "';";
			System.out.println(sqlLogin);
			r = stmt.executeQuery(sqlLogin);

			if (r.next()) {
				user = new User();
				user.setFirstName(r.getString("firstName"));
				user.setLastName(r.getString("lastName"));
				user.setUserId(r.getInt("userId"));
				user.setUsername(login.getUsername());	
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;	
	}
	
	public User getUserDetails(int userId){
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet r = null;
		User user = null;

		try {
			stmt = con.createStatement();
			String sqlLogin = "SELECT firstname, lastname, userId FROM quser WHERE userid = " + userId + ";";
			System.out.println(sqlLogin);
			r = stmt.executeQuery(sqlLogin);

			if (r.next()) {
				user = new User();
				user.setFirstName(r.getString("firstName"));
				user.setLastName(r.getString("lastName"));
				user.setUserId(r.getInt("userId"));	
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;	
	}

}
