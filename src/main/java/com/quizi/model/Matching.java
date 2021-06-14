package com.quizi.model;

import java.util.List;

public class Matching {
	private int matchingQuestionId;
	private int wordId;
	private String word;
	private int definitionId;
	private String definition;

	public int getMatchingQuestionId() {
		return matchingQuestionId;
	}
	public void setMatchingQuestionId(int matchingQuestionId) {
		this.matchingQuestionId = matchingQuestionId;
	}
	public int getWordId() {
		return wordId;
	}
	public void setWordId(int wordId) {
		this.wordId = wordId;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getDefinitionId() {
		return definitionId;
	}
	public void setDefinitionId(int definitionId) {
		this.definitionId = definitionId;
	}
	public String getDefinition() {
		return definition;
	}
	public void setDefinition(String definition) {
		this.definition = definition;
	}

}
