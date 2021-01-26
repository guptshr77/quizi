package com.quizi.dal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.quizi.model.Matching;
import com.quizi.model.Report;

public class ReportDAO {
	public List<Report> getReport(int userId, boolean isFullReport) {
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Report r = null;
		List<Report> report = new ArrayList();
		Matching m = null;
		ResultSet rsm = null;
		List<Matching> matching = null;

		try {
			stmt = con.createStatement();
			String reportResponse = "SELECT q.questiondescription, q.questiontype, q.answer, u.useranswer, u.isCorrect, u.questionid, u.datetime FROM questions q, userresponse u WHERE q.questionId = u.questionId AND u.userId = " + userId;
			if(!isFullReport)
				reportResponse += " ORDER BY u.datetime DESC LIMIT 5";
			reportResponse += ";";
			System.out.println(reportResponse);
			rs = stmt.executeQuery(reportResponse);

			while(rs.next()) {
				r = new Report();
				r.setQuestionDescription(rs.getString("questiondescription"));
				r.setQuestionType(rs.getInt("questiontype"));
				r.setAnswer(rs.getString("answer"));
				r.setUserAnswer(rs.getString("useranswer"));
				r.setCorrect(rs.getBoolean("iscorrect"));
				r.setQuestionId(rs.getInt("questionid"));
				r.setDateTime(rs.getTime("datetime"));
				if(r.getQuestionType() == 1) {

					String matchingQuery = "SELECT * FROM matching WHERE questionid = " + r.getQuestionId() + ";";
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
					r.setMatching(matching);
					rsm.close();
				}
				report.add(r);
			}

		} catch (SQLException e) {
			System.out.println(e.toString());
		}finally{
			try {
				if(con != null) {
					rs.close();	
					con.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		return report;
	}


}