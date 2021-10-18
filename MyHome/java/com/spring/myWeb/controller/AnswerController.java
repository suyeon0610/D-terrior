package com.spring.myWeb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.myWeb.command.AnswerVO;
import com.spring.myWeb.quiz.service.IAnswerService;
import com.spring.myWeb.quiz.util.QuizPageCreator;
import com.spring.myWeb.quiz.util.QuizPageVO;

@RestController
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private IAnswerService service;
	
	@PostMapping("/answerRegist")
	public String regist(HttpSession session ,@RequestBody AnswerVO vo) {
		System.out.println("/answer/answerRegist: POST");
		System.out.println(session.getAttribute("user"));
		
		service.regist(vo);
		return "regSuccess";
	} 
	
	@GetMapping("/answerList/{quizNum}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int quizNum, @PathVariable int pageNum) {
		System.out.println("/answer/answerList: GET");
		
		QuizPageVO paging = new QuizPageVO();
		paging.setPageNum(pageNum);
		paging.setCountPerPage(5);
		
		QuizPageCreator qpc = new QuizPageCreator();
		qpc.setPage(paging);
		qpc.setPageTotalCount(service.getTotalCount(quizNum));
		
		List<AnswerVO> list = service.getList(quizNum, paging);
		
		Map<String, Object> data = new HashMap<>();
		data.put("list", list);
		data.put("qpc", qpc);
		
		return data;
		
	}
	
	@PostMapping("/answerModify")
	public String modify(@RequestBody AnswerVO vo) {
		System.out.println("/answer/answerModify: POST");
		
		service.modify(vo);
		return "modSuccess";
	}
	
	@PostMapping("/answerDelete")
	public String delete(@RequestBody int answerNum) {
		System.out.println("/answer/answerDelete: POST");
		
		service.delete(answerNum);
		return "delSuccess";
	}
	
}
