package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
-- answer 테이블 생성(pk 설정)
CREATE TABLE answer (
   answer_num NUMBER,
   quiz_num NUMBER,
   writer VARCHAR2(100) NOT NULL, --user_nickname
   content VARCHAR2(2000) NOT NULL,
   reg_date DATE DEFAULT SYSDATE,
   update_date DATE DEFAULT NULL,
   constraint answer_pk primary key(answer_num)
);
-- fk 설정
ALTER TABLE answer
ADD CONSTRAINT answer_fk FOREIGN KEY(quiz_num) 
REFERENCES quiz(quiz_num) ON DELETE CASCADE;
-- 시퀀스 생성
CREATE SEQUENCE answer_seq
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
public class AnswerVO {

	private int answerNum;
	private int quizNum;
	private String writer;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String profile;

}
