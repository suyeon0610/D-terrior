package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 -- 완성형 인테리어
create table complete(
    bno number primary key,
    writer varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    thumb_img varchar2(200),
    regdate date default sysdate,
    updatedate date,
    like_cnt number(10,0) default 0,
    view_cnt number default 0,
    scrap_cnt number default 0,   
    money number,
    homeSize VARCHAR2(30),
    place VARCHAR2(30),   
    room VARCHAR2(30),   
    imgs varchar2(1000),
    usernum number not null
);
 */

@Getter
@Setter
@ToString
public class CompleteVO {
	private int bno, likeCnt, viewCnt, scrapCnt, userNum, scrapValue;
	private String writer, title, content, thumbImg, profile, imgs="";
	private Timestamp regDate, updateDate;	
	private int sort, money;
	private String homeSize, place, room;
	private String[] homeImg;

}
