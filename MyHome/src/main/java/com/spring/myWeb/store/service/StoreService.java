package com.spring.myWeb.store.service;

import java.util.List;

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
	public int getTotalCount() {
		return mapper.getTotalCount();
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
	public void cartIn(int pno, int userNum) {
		mapper.cartIn(pno, userNum);
	}
	
	@Override
	public List<StoreVO> getCartList(int userNum) {
		return mapper.getCartList(userNum);
	}
	
	@Override
	public void deleteCart(int pno, int userNum) {
		mapper.deleteCart(pno, userNum);
	}
	
}