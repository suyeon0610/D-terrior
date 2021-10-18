package com.spring.myWeb.quiz.mapper;

import java.util.List;
import java.util.Map;

import com.spring.myWeb.command.AnswerVO;
import com.spring.myWeb.quiz.util.QuizPageVO;

public interface IAnswerMapper {

	// 답변 등록
	void regist(AnswerVO vo);

	// 답변 목록
	List<AnswerVO> getList(Map<String, Object> datas);

	// 답변 수정
	void modify(AnswerVO vo);

	// 답변 삭제
	void delete(int answerNum);

	// 답변 게시글 수
	int getTotalCount(int quizNum);

}
