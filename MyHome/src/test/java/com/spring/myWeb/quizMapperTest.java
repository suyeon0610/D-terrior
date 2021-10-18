package com.spring.myWeb;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myWeb.command.QuizVO;
import com.spring.myWeb.quiz.mapper.IQuizMapper;
import com.spring.myWeb.quiz.util.QuizPageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class quizMapperTest {
	
	@Autowired
	private IQuizMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=320; i++) {
			QuizVO vo = new QuizVO();
			vo.setTitle("테스트 글" + i);
			vo.setWriter("지성");
			vo.setContent("테스트 글 내용입니다" + i);
			vo.setType("타입" + i);
			vo.setFileLoca("");
			mapper.regist(vo);
		}
		
		System.out.println("입력이 완료되었습니다.");
	}
	
	
	@Test
	public void getListTest() {
		QuizPageVO paging = new QuizPageVO();
		List<QuizVO> list = mapper.getList(paging);
		for(QuizVO vo : list) {
			System.out.println(vo);
		}
	}
	
	/*
	@Test
	public void getDetailTest() {
		QuizVO vo = mapper.getDetail(55);
		System.out.println("이름: " + vo.getWriter() + " 제목: " + vo.getTitle() + " 내용: " + vo.getContent() + " 타입: " + vo.getType() + " 작성일: " + vo.getRegDate());
	}
	
	@Test
	public void modifyTest() {
		QuizVO vo = new QuizVO();
		vo.setQuizNum(5);
		vo.setTitle("수정된 제목");
		vo.setContent("수정된 내용");
		vo.setType("수정된 타입");
		vo.setFileloca("aa");
		vo.setFilename("bb");
		vo.setFilerealname("cc");
		vo.setUploadpath("dd");
		mapper.modify(vo);
		System.out.println("수정이 완료되었습니다.");
		System.out.println(mapper.getDetail(5));
	}
	
	@Test
	public void deleteTest() {
		mapper.delete(2);
		List<QuizVO> list = mapper.getList();
		for(QuizVO vo : list) {
			System.out.println(vo);
		}
	}
	*/

}
