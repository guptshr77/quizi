package com.quizi.model;

public class Report {
	private String questionDescription;
	private int questionType;
	private String answer;
	private String userAnswer;
	private boolean isCorrect;
	
	public String getQuestionDescription() {
		return questionDescription;
	}
	public void setQuestionDescription(String questionDescription) {
		this.questionDescription = questionDescription;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	public String isAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String isUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public boolean getIsCorrect() {
		return isCorrect;
	}
	public void setIsCorrect(boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
}
