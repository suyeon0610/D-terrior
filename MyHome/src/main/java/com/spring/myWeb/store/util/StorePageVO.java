package com.spring.myWeb.store.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StorePageVO {
	
	private int pageNum; //현재 페이지 번호
	private int countPerPage; //한 페이지 당 게시물 수
	private String category1;
	private String category2;
	
	public StorePageVO() {
		this.pageNum = 1;
		this.countPerPage = 8;
	}

}
