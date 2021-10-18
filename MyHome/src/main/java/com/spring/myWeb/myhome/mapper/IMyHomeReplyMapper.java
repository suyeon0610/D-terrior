package com.spring.myWeb.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.MyHomeReplyVO;
import com.spring.myWeb.myhome.util.PageVO;

public interface IMyHomeReplyMapper {
	
	//댓글 목록
	List<MyHomeReplyVO> getList(@Param("paging") PageVO paging, @Param("bno") int bno);
	
	//댓글 등록
	void regist(MyHomeReplyVO vo);
	
	//댓글 수정
	void update(MyHomeReplyVO vo);
	
	//댓글 삭제
	void delete(int rno);
	
	//댓글 총 갯수
	int getTotalReply(int bno);
	
	
}
