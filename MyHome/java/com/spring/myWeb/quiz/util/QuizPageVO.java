package com.spring.myWeb.quiz.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuizPageVO {
	
	private int pageNum; //현재 페이지 번호
	private int countPerPage; //한 페이지 당 게시물 수
	private String condition;
	private String keyword; 
	private String sort;
	
	public QuizPageVO() {
		this.pageNum = 1;
		this.countPerPage = 10;	
	}

}
