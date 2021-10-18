package com.spring.myWeb.quiz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.AnswerVO;
import com.spring.myWeb.quiz.mapper.IAnswerMapper;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Service
public class AnswerService implements IAnswerService {

	@Autowired
	private IAnswerMapper mapper;
	
	@Override
	public void regist(AnswerVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<AnswerVO> getList(int quizNum, QuizPageVO paging) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("quizNum", quizNum);
		datas.put("paging", paging);
	
		return mapper.getList(datas);
	}

	@Override
	public void modify(AnswerVO vo) {
		mapper.modify(vo);
	}

	@Override
	public void delete(int answerNum) {
		mapper.delete(answerNum);
	}

	@Override
	public int getTotalCount(int quizNum) {
		return mapper.getTotalCount(quizNum);
	}

}
