package com.spring.myWeb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myWeb.command.MyHomeReplyVO;
import com.spring.myWeb.myhome.mapper.IMyHomeReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class MyHomeReplymapperTest {
	
	@Autowired
	private IMyHomeReplyMapper mapper;
	
	@Test
	public void registTest() {
		System.out.println("댓글 등록 테스트");
		for(int i=1;i<=73;i++) {
			MyHomeReplyVO vo = new MyHomeReplyVO();
			vo.setBno(220);
			vo.setWriter("jiseong" + i);
			vo.setContent("댓글 등록 테스트 " + i);
			mapper.regist(vo);
		}
	}

}
