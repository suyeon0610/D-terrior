package com.spring.myWeb.myhome.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CookieValue;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.myhome.util.PageVO;

public interface IMyHomeService {

	//글 등록
	void regist(MyHomeVO vo);
	
	//글 목록 조회
	List<MyHomeVO> getList(PageVO paging);
	
	//글 상세 조회
	MyHomeVO getDetail(int bno);
	
	//총 게시물 수
	int getTotalArticles(PageVO paging);
	
	//글 수정
	void update(MyHomeVO vo);
	
	//글 삭제
	void delete(int bno); 
	
	//프로필
	String getProfile(String writer);
	
	//좋아요 처리
	void like(MyHomeVO vo);
	
	//사용자 스크랩 긁어오기
	String getScrap(String writer);

	//사용자 스크랩 수정
	int updateScrap(String writer, String scrap, int bno);	
	
	//조회수 up
	void plusView(int bno);
	
	//좋아요 up
	void plusLike(int bno, int num);
	
	//스크랩 up
	void plusScrap(int bno, int num);
	
}
