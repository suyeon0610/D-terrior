package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE quiz (
quiz_num NUMBER,
writer VARCHAR2(100) NOT NULL, --user_nickname
title VARCHAR2(100) NOT NULL,
content VARCHAR2(2000) NOT NULL,
type VARCHAR2(50), --질문 유형
reg_date DATE DEFAULT SYSDATE,
update_date DATE DEFAULT NULL,
file_loca VARCHAR2(100),
views NUMBER DEFAULT 0,
constraint quiz_pk primary key(quiz_num)
);

CREATE SEQUENCE quiz_seq
start with 1
increment by 1
maxvalue 10000
nocache
nocycle;
*/

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class QuizVO {
	
	private int quizNum;
	private String writer;
	private String title;
	private String content;
	private String type;
	private String fileLoca;
	private int views;
	private Timestamp regDate;
	private Timestamp updateDate;
	private int answerCnt;
	private boolean newMark;

}
