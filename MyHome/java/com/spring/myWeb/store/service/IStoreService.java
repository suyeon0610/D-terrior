package com.spring.myWeb.store.service;

import java.util.List;

import com.spring.myWeb.command.StoreVO;
import com.spring.myWeb.quiz.util.QuizPageVO;
import com.spring.myWeb.store.util.StorePageVO;

public interface IStoreService {

	// 제품 등록
	void insert(StoreVO product);
	
	// 제품 상세보기
	StoreVO getDetail(int pno);
	
	// 제품 리스트
	List<StoreVO> getList(StorePageVO page);
	
	// 제품 전체 수
	int getTotalCount(StorePageVO page);
	
	// 제품 수정
	void modify(int pno);
	
	// 제품 삭제
	void delete(int pno);
	
	// 주문수량
	void orderCount (int pno);
	
	// 장바구니
	String getCart(int userNum);
	
	// 장바구니 담기
	void cartIn(int pno, int userNum);
	
}