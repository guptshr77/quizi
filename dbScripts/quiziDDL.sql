CREATE TABLE quser(
	userid SERIAL PRIMARY KEY,
	username VARCHAR(10),
	password VARCHAR(10),
	firstName VARCHAR(20),
	lastName VARCHAR(20)
);

CREATE TABLE questions(
	questionId SERIAL PRIMARY KEY,
	questionType INT,
	questionDescription VARCHAR(200),
	answer VARCHAR(150)
);

CREATE TABLE userResponse(
	userId INT,
	questionId INT,
	userAnswer VARCHAR(100),
	isCorrect BOOLEAN,
	dateTime TIMESTAMP,
	CONSTRAINT fk_question
		FOREIGN KEY (questionId) 
			REFERENCES questions(questionId),
	CONSTRAINT fk_user
		FOREIGN KEY (userid)
			REFERENCES quser(userid)
);

CREATE TABLE multipleChoice(
	questionId INT, 
	mcOption VARCHAR(100),
	CONSTRAINT fk_question
		FOREIGN KEY (questionId) 
			REFERENCES questions(questionId)
);

CREATE TABLE matching(
	questionId INT,
	wordId INT,
	word VARCHAR(30),
	definitionId INT,
	definition VARCHAR(200),
	CONSTRAINT fk_question
		FOREIGN KEY (questionId) 
			REFERENCES questions(questionId)
);