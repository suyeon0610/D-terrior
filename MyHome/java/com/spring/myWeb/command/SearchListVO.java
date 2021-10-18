package com.spring.myWeb.command;

import java.util.List;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class SearchListVO {
	private List<MyHomeVO> homeList;
	private List<QuizVO> quizList;
	private List<CompleteVO> compList;
	private List<StoreVO> storeList;
}
