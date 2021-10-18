package com.spring.myWeb.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.StoreVO;
import com.spring.myWeb.quiz.util.QuizPageVO;
import com.spring.myWeb.store.mapper.IStoreMapper;
import com.spring.myWeb.store.util.StorePageVO;

@Service
public class StoreService implements IStoreService {
	
	@Autowired
	private IStoreMapper mapper;

	@Override
	public void insert(StoreVO product) {
		mapper.insert(product);
	}

	@Override
	public StoreVO getDetail(int pno) {
		return mapper.getDetail(pno);
	}

	@Override
	public List<StoreVO> getList(StorePageVO page) {
		return mapper.getList(page);
	}
	
	@Override
	public int getTotalCount(StorePageVO page) {
		return mapper.getTotalCount(page);
	}

	@Override
	public void modify(int pno) {
		mapper.modify(pno);
	}

	@Override
	public void delete(int pno) {
		mapper.delete(pno);
	}
	
	@Override
	public void orderCount(int pno) {
		mapper.orderCount(pno);
	}
	
	@Override
	public String getCart(int userNum) {
		return mapper.getCart(userNum);
	}
	
	@Override
	public void cartIn(int pno, int userNum) {
		String cart = mapper.getCart(userNum);
		if(cart != null) {
			cart += ("," + pno);
		} else {
			cart = Integer.toString(pno);
		}
		
		Map<String, Object> data = new HashMap<>();
		data.put("cart", cart);
		data.put("userNum", userNum);
		
		mapper.cartIn(data);
	}

}