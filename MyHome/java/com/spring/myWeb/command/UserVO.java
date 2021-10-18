package com.spring.myWeb.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	/*
	CREATE TABLE users (
   id VARCHAR2(100) not null,
   pw VARCHAR2(50) NOT NULL,
   nick_name VARCHAR2(50) NOT NULL,
   user_Num number(10, 0) primary key,
   phone1 VARCHAR2(20),
   phone2 VARCHAR2(20),
   phone3 VARCHAR2(20),
   grade VARCHAR2(20) DEFAULT 'normal',
   interest VARCHAR2(300),
   addr_basic VARCHAR2(300),
   addr_detail VARCHAR2(300),
   zip_num VARCHAR2(300),
   major VARCHAR2(300),
   profile VARCHAR2(300),
   reg_date DATE DEFAULT SYSDATE,
   scrap VARCHAR2(500), 
   paper VARCHAR2(500)
   cart VARCHAR2(500)
   );
	 */

		private String id;
		private String pw;
		private int userNum;
		private String nickName;
		private String phone1;
		private String phone2;
		private String phone3;
		private String grade;
		private String interest;
		private String addrBasic;
		private String addrDetail;
		private String zipNum;
		private String major;
		private String profile;
		private Timestamp regDate;
		private String scrap;
		private String paper;
		private String cart;
}
