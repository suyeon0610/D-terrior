package com.spring.myWeb.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.QuizVO;
import com.spring.myWeb.quiz.mapper.IQuizMapper;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Service
public class QuizService implements IQuizService {

	@Autowired
	private IQuizMapper mapper;
	
	@Override
	public void regist(QuizVO vo) {
		mapper.regist(vo);
	}

	@Override
	public QuizVO getDetail(int quizNum) {
		return mapper.getDetail(quizNum);
	}

	@Override
	public List<QuizVO> getList(QuizPageVO page) {
		List<QuizVO> list = mapper.getList(page);
		
		for(QuizVO vo : list) {
			long today = System.currentTimeMillis();
			long regDate = vo.getRegDate().getTime();
			
			if((today - regDate) < 60*60*1000) {
				vo.setNewMark(true);
			} else {
				vo.setNewMark(false);
			}
		}
		
		return list;
	}

	@Override
	public void modify(QuizVO vo) {
		mapper.modify(vo);
	}

	@Override
	public void delete(int quizNum) {
		mapper.delete(quizNum);
	}

	@Override
	public int getTotalCount(QuizPageVO page) {
		return mapper.getTotalCount(page);
	}
	
	@Override
	public void updateCnt(int quizNum) {
		mapper.updateCnt(quizNum);
	}
	
}
