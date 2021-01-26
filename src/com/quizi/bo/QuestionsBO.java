package com.quizi.bo;

import java.util.List;

import com.quizi.dal.QuestionsDAO;
import com.quizi.model.Question;

public class QuestionsBO {
	public List<Question> getQuestions() {
		QuestionsDAO questionsDAO = new QuestionsDAO();
		return questionsDAO.getQuestions();

	}
}
