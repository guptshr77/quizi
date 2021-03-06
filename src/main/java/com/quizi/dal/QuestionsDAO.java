package com.quizi.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.quizi.model.Matching;
import com.quizi.model.Question;

public class QuestionsDAO {
	public List<Question> getQuestions() {
		//variables and objects
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Question q = null;
		Matching m = null;
		List<Question> questions = new ArrayList();
		List<String> multipleChoice = null;
		List<Matching> matching = null;
		ResultSet rsmc = null;
		ResultSet rsm = null;
		
		//makes, gets and returns the list of questions in a random order
		try {
			stmt = con.createStatement();
			String getQuestions = "SELECT * FROM questions ORDER BY RANDOM() LIMIT 5;";
			System.out.println(getQuestions);
			rs = stmt.executeQuery(getQuestions);
			while(rs.next()) {
				q = new Question();
				q.setQuestionId(rs.getInt("questionId"));
				q.setQuestionType(rs.getInt("questionType"));
				q.setQuestionDescription(rs.getString("questionDescription"));
				q.setAnswer(rs.getString("answer"));
				//check if question types is of mulitple choice, get the multiple choice answer choices 
				if (q.getQuestionType() == 3) {
					String multipleChoicesQuery = "SELECT mcoption FROM multiplechoice WHERE questionid = " + q.getQuestionId() + ";";
					System.out.println(multipleChoicesQuery);
					rsmc = stmt.executeQuery(multipleChoicesQuery);
					multipleChoice = new ArrayList();
					while(rsmc.next()) {
						multipleChoice.add(rsmc.getString("mcoption"));
					}
					q.setMultipleChoice(multipleChoice);
					rsmc.close();
				//if the question type is of matching, we get the group of matching type
				}else if(q.getQuestionType() == 1) {

					String matchingQuery = "SELECT * FROM matching WHERE questionid = " + q.getQuestionId() + ";";
					System.out.println(matchingQuery);
					rsm = stmt.executeQuery(matchingQuery);
					matching = new ArrayList();

					while(rsm.next()) {
						m = new Matching();
						m.setWordId(rsm.getInt("wordid"));
						m.setWord(rsm.getString("word"));
						m.setDefinitionId(rsm.getInt("definitionid"));
						m.setDefinition(rsm.getString("definition"));
						matching.add(m);
					}
					Collections.shuffle(matching);
					q.setMatching(matching);
					rsm.close();
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
