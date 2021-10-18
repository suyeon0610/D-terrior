package com.spring.myWeb.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.MyHomeReplyVO;
import com.spring.myWeb.myhome.mapper.IMyHomeReplyMapper;
import com.spring.myWeb.myhome.util.PageVO;

@Service
public class MyHomeReplyService implements IMyHomeReplyService {
	
	@Autowired
	private IMyHomeReplyMapper mapper;

	@Override
	public List<MyHomeReplyVO> getList(PageVO paging, int bno) {
		return mapper.getList(paging, bno);
	}

	@Override
	public void regist(MyHomeReplyVO vo) {
		mapper.regist(vo);
	}

	@Override
	public void update(MyHomeReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

	@Override
	public int getTotalReply(int bno) {
		return mapper.getTotalReply(bno);
	}

}
