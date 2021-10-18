package com.spring.myWeb;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.myhome.mapper.IMyHomeMapper;
import com.spring.myWeb.myhome.util.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class MyHomeMapperTest {
	
	@Autowired
	private IMyHomeMapper mapper;
	
	//글 등록 테스트
	@Test
	public void registTest() {
		for(int i=1;i<=220;i++) {
			MyHomeVO vo = new MyHomeVO();
			vo.setWriter("태현" + i);
			vo.setTitle("테스트" + i);
			vo.setContent("테스트 글쓰기" + i);
			mapper.regist(vo);
			System.out.println(vo);
		}
			
	}
	
	//글 목록 불러오기 테스트
	@Test
	public void getListTest() {
		PageVO paging = new PageVO();
		paging.setCountPerPage(10);
		paging.setNowPage(13);
		
		List<MyHomeVO> list = mapper.getList(paging);
		System.out.println("게시물 갯수: " + list.size());
		
		for(MyHomeVO vo : list) {
			System.out.println(vo);
		}
	}
	
	//글 상세보기 테스트
	@Test
	public void getDetailTest() {
		System.out.println(mapper.getDetail(12));
	}
	
	//글 수정 테스트
	@Test
	public void updateTest() {
		MyHomeVO vo = new MyHomeVO();
		vo.setWriter("수정된 작성자에요!!");
		vo.setTitle("수정된 제목!!");
		vo.setContent("수정된 내용!!");
		vo.setBno(1);
		mapper.update(vo);
		
		System.out.println("수정 후 1번 게시글: " + vo);
	}
	
	//글 삭제 테스트
	@Test
	public void deleteTest() {
		System.out.println("220번글 삭제!");
		
		mapper.delete(220);
		System.out.println(mapper.getDetail(220));
	}
	

}
