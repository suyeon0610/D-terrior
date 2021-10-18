package com.spring.myWeb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myWeb.command.CompleteVO;
import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.complete.mapper.ICompleteMapper;
import com.spring.myWeb.myhome.mapper.IMyHomeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class CompleteMapperTest {

	@Autowired
	private ICompleteMapper mapper;
	
	//글 등록 테스트
	@Test
	public void registTest() {
		for(int i=1;i<=220;i++) {
			CompleteVO vo = new CompleteVO();
			vo.setWriter("지성" + i);
			vo.setTitle("테스트" + i);
			vo.setContent("테스트 글쓰기" + i);
			mapper.regist(vo);
			System.out.println(vo);
		}
			
	}
	
}
