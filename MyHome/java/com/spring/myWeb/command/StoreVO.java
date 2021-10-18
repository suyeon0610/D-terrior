package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE store (
    pno NUMBER NOT NULL,
    name VARCHAR2(500) NOT NULL,
    price VARCHAR2(100) NOT NULL,
    deli_price VARCHAR2(20) NOT NULL,
    deli_plus VARCHAR2(20), 
    category1 VARCHAR2(20) NOT NULL,
    category2 VARCHAR2(20) NOT NULL,
    release_date VARCHAR2(50),
    thumbnail VARCHAR2(1000) NOT NULL,
    product_img VARCHAR2(1000),
    product_explan VARCHAR2(1000),
    user_num NUMBER,
    order_cnt NUMBER DEFAULT 0,
    reg_date DATE DEFAULT SYSDATE,
    CONSTRAINT store_pk PRIMARY KEY(pno)
);
CREATE SEQUENCE store_seq
    start with 1
    increment by 1
    maxvalue 10000
    nocache
    nocycle;
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {
	
	int pno;
	int userNum;
	String name;
	String price;
	String deliPrice;
	String deliPlus;
	String category1;
	String category2;
	String releaseDate;
	String thumbnail;
	String productImg;
	String productExplan;
	private Timestamp regDate;
	
}