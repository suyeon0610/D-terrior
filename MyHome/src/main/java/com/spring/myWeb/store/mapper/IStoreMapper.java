package com.spring.myWeb.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.StoreVO;
import com.spring.myWeb.store.util.StorePageVO;

public interface IStoreMapper {
	
	// 제품 등록
	void insert(StoreVO product);
	
	// 제품 상세보기
	StoreVO getDetail(int pno);
	
	// 제품 리스트
	List<StoreVO> getList(StorePageVO page);
	
	// 제품 전체 수
	int getTotalCount();
	
	// 제품 수정
	void modify(int pno);
	
	// 제품 삭제
	void delete(int pno);
	
	// 장바구니 담기
	void cartIn(@Param("pno") int pno, @Param("userNum") int userNum);
	
	// 장바구니 리스트
	List<StoreVO> getCartList(int userNum);
	
	// 장바구니 삭제
	void deleteCart(@Param("pno") int pno, @Param("userNum") int userNum);

}