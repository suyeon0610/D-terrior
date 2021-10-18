package com.spring.myWeb.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
	CREATE TABLE cart (
	    cno NUMBER PRIMARY KEY,
	    pno NUMBER NOT NULL,
	    user_num NUMBER NOT NULL
	);

	CREATE SEQUENCE cart_seq
	    start with 1
	    increment by 1
	    maxvalue 10000
	    nocache
	    nocycle;
*/

@Getter
@Setter
@ToString
public class CartVO {
	private int cno;
	private int pno;
	private int userNum;
}
