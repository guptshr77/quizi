package com.quizi.dal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.quizi.model.Report;

public class ReportDAO {
	public List<Report> getReport(int userId, boolean isFullReport) {
		Connection con = Utilities.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int result = -1;
		Report r = null;
		List<Report> report = new ArrayList();

		try {
			stmt = con.createStatement();
			String reportResponse = "SELECT q.questiondescription, q.questiontype, q.answer, u.useranswer, u.isCorrect FROM questions q, userresponse u WHERE q.questionId = u.questionId AND u.userId = " + userId;
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
				r.setIsCorrect(rs.getBoolean("iscorrect"));
				report.add(r);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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