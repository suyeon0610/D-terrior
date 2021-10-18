package com.spring.myWeb.complete.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.CompleteVO;
import com.spring.myWeb.myhome.util.PageVO;

public interface ICompleteMapper {
	//글 등록
		void regist(CompleteVO vo);
		
		//글 목록 조회
		List<CompleteVO> getList(PageVO paging);
		
		//글 상세 조회
		CompleteVO getDetail(int bno);
		
		//총 게시물 수
		int getTotalArticles(PageVO paging);
		
		//글 수정
		void update(CompleteVO vo);
		
		//글 삭제
		void delete(int bno);  
		
		//프로필 정보 불러오기
		String getProfile(String writer);
		
		//좋아요 처리
		void like(CompleteVO vo);
		
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
