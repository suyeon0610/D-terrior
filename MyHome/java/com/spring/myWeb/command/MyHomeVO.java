package com.spring.myWeb.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 -- 내 집 뽐내기 테이블 생성
create table myhome(
    bno number,
    writer varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    thumb_img varchar2(200),
    regdate date default sysdate,
    updatedate date,
    like_cnt number(10,0) default 0,
    view_cnt number default 0,
    scrap_cnt number default 0,
    homeForm VARCHAR2(30),
    money VARCHAR2(30),
    homeSize VARCHAR2(30),
    place VARCHAR2(30),
    direction VARCHAR2(30),
    room VARCHAR2(30),
    age VARCHAR2(30),
    family VARCHAR2(30),
    worker VARCHAR2(30),
    region VARCHAR2(30),
    imgs varchar2(1000),
    usernum number
);

-- 글 번호 pk 설정
alter table myhome
add constraint bno_pk primary key(bno);

-- 작성자 외래키 설정 (user테이블 생성 후 추가하기)
alter table myhome
add constraint writer_fk foreign key
references user(id);

-- 시퀀스 생성
create sequence myhome_seq
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
public class MyHomeVO {
	
	private int bno, likeCnt, viewCnt, scrapCnt, userNum, scrapValue;
	private String writer, title, content, thumbImg, profile, imgs="";
	private Timestamp regDate, updateDate;	
	private int sort;
	private String homeForm, money, homeSize, place
	, direction, room, age, family, worker, region;
	private String[] homeImg;

}









