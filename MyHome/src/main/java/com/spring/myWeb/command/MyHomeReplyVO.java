package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyHomeReplyVO {
	
	private int bno, rno;
	private String writer, content, profile;
	private Timestamp regDate, updateDate;
	
	
}
