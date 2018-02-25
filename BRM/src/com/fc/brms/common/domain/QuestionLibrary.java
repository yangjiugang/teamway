package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class QuestionLibrary implements Serializable {

	private static final long serialVersionUID = 1L;
	private int questionId;
	private String questionNum;
	private int questionType;
	private int typeId;
	private int levelId;
	private String questionContent;
	private int questionPoints;
	private int questionStatus;
	private String answer;
	private int isRight;
	private String answer2;
	private int isRight2;
	private String answer3;
	private int isRight3;
	private String answer4;
	private int isRight4;
	private String answer5;
	private int isRight5;
	private String answer6;
	private int isRight6;
	private String answer7;
	private int isRight7;
	private String answer8;
	private int isRight8;
	private String answer9;
	private int isRight9;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private int questionOrder;
	private int detailId;
	private QuestionType questionTypeClass;
	private QuestionDifficultyLevel questionLevel;
	private String correctAnswer;

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public int getDetailId() {
		return detailId;
	}

	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}

	public int getQuestionOrder() {
		return questionOrder;
	}

	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}

	public QuestionType getQuestionTypeClass() {
		return questionTypeClass;
	}
	
	public void setQuestionTypeClass(QuestionType questionTypeClass) {
		this.questionTypeClass = questionTypeClass;
	}

	public QuestionDifficultyLevel getQuestionLevel() {
		return questionLevel;
	}

	public void setQuestionLevel(QuestionDifficultyLevel questionLevel) {
		this.questionLevel = questionLevel;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setQuestionNum(String questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionNum() {
		return this.questionNum;
	}

	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}

	public int getQuestionType() {
		return this.questionType;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getTypeId() {
		return this.typeId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public int getLevelId() {
		return this.levelId;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionContent() {
		return this.questionContent;
	}

	public void setQuestionPoints(int questionPoints) {
		this.questionPoints = questionPoints;
	}

	public int getQuestionPoints() {
		return this.questionPoints;
	}

	public void setQuestionStatus(int questionStatus) {
		this.questionStatus = questionStatus;
	}

	public int getQuestionStatus() {
		return this.questionStatus;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}

	public int getIsRight() {
		return this.isRight;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getAnswer2() {
		return this.answer2;
	}

	public void setIsRight2(int isRight2) {
		this.isRight2 = isRight2;
	}

	public int getIsRight2() {
		return this.isRight2;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public String getAnswer3() {
		return this.answer3;
	}

	public void setIsRight3(int isRight3) {
		this.isRight3 = isRight3;
	}

	public int getIsRight3() {
		return this.isRight3;
	}

	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}

	public String getAnswer4() {
		return this.answer4;
	}

	public void setIsRight4(int isRight4) {
		this.isRight4 = isRight4;
	}

	public int getIsRight4() {
		return this.isRight4;
	}

	public void setAnswer5(String answer5) {
		this.answer5 = answer5;
	}

	public String getAnswer5() {
		return this.answer5;
	}

	public void setIsRight5(int isRight5) {
		this.isRight5 = isRight5;
	}

	public int getIsRight5() {
		return this.isRight5;
	}

	public void setAnswer6(String answer6) {
		this.answer6 = answer6;
	}

	public String getAnswer6() {
		return this.answer6;
	}

	public void setIsRight6(int isRight6) {
		this.isRight6 = isRight6;
	}

	public int getIsRight6() {
		return this.isRight6;
	}

	public void setAnswer7(String answer7) {
		this.answer7 = answer7;
	}

	public String getAnswer7() {
		return this.answer7;
	}

	public void setIsRight7(int isRight7) {
		this.isRight7 = isRight7;
	}

	public int getIsRight7() {
		return this.isRight7;
	}

	public void setAnswer8(String answer8) {
		this.answer8 = answer8;
	}

	public String getAnswer8() {
		return this.answer8;
	}

	public void setIsRight8(int isRight8) {
		this.isRight8 = isRight8;
	}

	public int getIsRight8() {
		return this.isRight8;
	}

	public void setAnswer9(String answer9) {
		this.answer9 = answer9;
	}

	public String getAnswer9() {
		return this.answer9;
	}

	public void setIsRight9(int isRight9) {
		this.isRight9 = isRight9;
	}

	public int getIsRight9() {
		return this.isRight9;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public int getCreateUser() {
		return this.createUser;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateUser(int lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public int getLastUpdateUser() {
		return this.lastUpdateUser;
	}
}