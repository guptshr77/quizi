package com.quizi.model;


import java.util.Date;
import java.util.List;

public class Report {
	private String questionDescription;
	private int questionType;
	private String answer;
	private String userAnswer;
	private boolean isCorrect;
	private int questionId;
	private Date dateTime;
	private List<Matching> matching;
	
	public boolean isCorrect() {
		return isCorrect;
	}
	public List<Matching> getMatching() {
		return matching;
	}
	public void setCorrect(boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
	public void setMatching(List<Matching> matching) {
		this.matching = matching;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

}
