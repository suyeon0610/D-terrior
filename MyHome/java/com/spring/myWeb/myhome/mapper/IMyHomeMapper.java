package com.spring.myWeb.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.myhome.util.PageVO;

public interface IMyHomeMapper {
	
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
	
	//프로필 정보 불러오기
	String getProfile(String writer);
	
	//좋아요 처리
	void like(MyHomeVO vo);
	
	//사용자 스크랩 긁어오기
	String getScrap(String writer);

	//사용자 스크랩 수정
	void updateScrap(@Param("writer")String writer, @Param("scrap") String scrap);	
	
	//조회수 수정
	void plusView(int bno);
	
	//좋아요 up
	void plusLike(@Param("bno") int bno, @Param("num")int num);
	
	//스크랩 up
	void plusScrap(@Param("bno")int bno, @Param("num")int num);
}
