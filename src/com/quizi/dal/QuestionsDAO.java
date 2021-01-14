package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.quizi.model.Question;

public class QuestionsDAO {
	public List<Question> getQuestions() {
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Question q = null;
		List<Question> questions = new ArrayList();
		List<String> multipleChoice = null;
		ResultSet rsmc = null;
		
		try {
			stmt = con.createStatement();
			String getQuestions = "SELECT * FROM questions WHERE questionType = 3 LIMIT 5;";
			System.out.println(getQuestions);
			rs = stmt.executeQuery(getQuestions);
			while(rs.next()) {
				q = new Question();
				q.setQuestionId(rs.getInt("questionId"));
				q.setQuestionType(rs.getInt("questionType"));
				q.setQuestionDescription(rs.getString("questionDescription"));
				q.setAnswer(rs.getString("answer"));
				if (q.getQuestionType() == 3) {
					String multipleChoicesQuery = "SELECT mcoption FROM multiplechoice WHERE questionid = " + q.getQuestionId() + ";";
					System.out.println(multipleChoicesQuery);
					rsmc = stmt.executeQuery(multipleChoicesQuery);
					multipleChoice = new ArrayList();
					while(rsmc.next()) {
						multipleChoice.add(rsmc.getString("mcoption"));
					}
					q.setMultipleChoice(multipleChoice);
				}
				questions.add(q);
				
			}
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
		return questions;
	}
	

}
