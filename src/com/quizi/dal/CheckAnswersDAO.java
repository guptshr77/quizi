package com.quizi.dal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.quizi.model.Question;

public class CheckAnswersDAO {
	public String getAnswer(String questionId) {
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String answer = null;
		
		try {
			stmt = con.createStatement();
			String correctAnswer = "SELECT answer FROM questions WHERE questionId = " + questionId + ";";
			System.out.println(correctAnswer);
			rs = stmt.executeQuery(correctAnswer);
			rs.next();
			answer = rs.getString("answer");
		} catch (SQLException e) {
			System.out.println(e.toString());
		}finally {
			try {
				if(con != null) {
					rs.close();	
					con.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		return answer;
	}
	
	public int storeUserAnswer(int userId, int questionId, String userAnswer, boolean isCorrect){
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int result = -1;
		
		try {
			stmt = con.createStatement();
			String sqlUsername = "INSERT INTO userResponse VALUES (" + userId + ", " + questionId +", '" + userAnswer + "', " + isCorrect + ", current_timestamp);";
			System.out.println(sqlUsername);
			stmt.executeUpdate(sqlUsername);
			result = 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.toString());
			result = 1;
		}
		return result;
	}
}
