package com.quizi.bo;

import java.util.List;

import com.quizi.dal.QuestionsDAO;
import com.quizi.model.Question;

/*
 * Class: QuestionsBO
 * Description: This class gets the list of questions and sends to the controller.  
 */
public class QuestionsBO {
	public List<Question> getQuestions() {
		QuestionsDAO questionsDAO = new QuestionsDAO();
		return questionsDAO.getQuestions();

	}
}
