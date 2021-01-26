package com.quizi.bo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.quizi.dal.CheckAnswersDAO;
import com.quizi.dal.ReportDAO;
import com.quizi.model.Question;
import com.quizi.model.Report;
import com.quizi.model.User;

public class CheckAnswersBO {
	public List<Report> checkAnswer(HttpServletRequest request){
		CheckAnswersDAO answerDAO = new CheckAnswersDAO();	
		String userAnswer = null;
		String correctAnswer = null;
		Boolean isCorrect = false;
		int userId = Integer.parseInt(request.getParameter("userId")); 
		boolean isMatchingCorrect = true;

		for (int i = 1; i <= 5; i++) {	
			isCorrect = false;
			int questionId = Integer.parseInt(request.getParameter("quesId_"+ i));
			int questionType = Integer.parseInt(request.getParameter("ques" + questionId + "_type"));

			if(questionType == 1){
				isCorrect = true;
				isMatchingCorrect = true;
				for(int optCount = 0; optCount < 4; optCount++){
					if (request.getParameter("ques_" + questionId + "_opt" + optCount) != request.getParameter("definitionId" + optCount)) {
						isMatchingCorrect = false;
						isCorrect = false;
						break;
					}
				}
			}else {
				correctAnswer = answerDAO.getAnswer(questionId);
				userAnswer = request.getParameter("opt" + questionId);

				if (correctAnswer.equalsIgnoreCase(userAnswer)) {
					System.out.println("You got question " + i + " correct");
					isCorrect = true;
				}
			}
			answerDAO.storeUserAnswer(userId, questionId, userAnswer, isCorrect);
		}

		ReportDAO reportdao = new ReportDAO();
		List<Report> reports = reportdao.getReport(userId, false);
		return reports;
	}

}