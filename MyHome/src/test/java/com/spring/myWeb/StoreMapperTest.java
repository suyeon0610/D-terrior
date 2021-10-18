package com.spring.myWeb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myWeb.command.StoreVO;
import com.spring.myWeb.store.mapper.IStoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class StoreMapperTest {
	
	@Autowired
	private IStoreMapper mapper;

	@Test
	public void insertTest() {
		for(int i=1;i<=220;i++) {
			StoreVO vo = new StoreVO();
			vo.setName("테스트" + i);
			vo.setPrice("50000");
			vo.setDeliPlus("2500");
			vo.setDeliPrice("3000");
			vo.setCategory1("카테고리1");
			vo.setCategory2("카테고리2");
			vo.setReleaseDate("5");
			vo.setThumbnail("테스트 썸네일" + i);
			vo.setProductExplan("테스트 입니다" + i);
			vo.setUserNum(5);
			
			System.out.println(vo);
			mapper.insert(vo);
		}
		
		System.out.println("상품 등록 완료!");
		
	}

}