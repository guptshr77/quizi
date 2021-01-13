package com.quizi.model;

import java.util.List;

public class Question {
	private int questionId;
	private int questionType;
	private String questionDescription;
	private String answer;
	private List<String> multipleChoice;
	

	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	public String getQuestionDescription() {
		return questionDescription;
	}
	public void setQuestionDescription(String questionDescription) {
		this.questionDescription = questionDescription;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public List<String> getMultipleChoice() {
		return multipleChoice;
	}
	public void setMultipleChoice(List<String> multipleChoice) {
		this.multipleChoice = multipleChoice;
	}
	

}
