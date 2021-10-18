package com.spring.myWeb.myhome.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {
	
	//페이지 정보 관련
	private int nowPage;
	private int countPerPage;
	
	//정렬 관련
	private int sort, money2;
	private String place;
	private String homeForm;
	private String money;
	private String homeSize;
	
	public PageVO() {		
		this.nowPage = 1;
		this.countPerPage = 9;
		this.sort = 1;
		this.money2 = 0;
	}

}
