package com.spring.myWeb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.myWeb.command.MyHomeReplyVO;
import com.spring.myWeb.myhome.service.IMyHomeReplyService;
import com.spring.myWeb.myhome.util.PageCreator;
import com.spring.myWeb.myhome.util.PageVO;

@RestController
@RequestMapping("/homeReply")
public class MyHomeReplyController {
	
	@Autowired
	private IMyHomeReplyService service;
	
	@PostMapping("/regist")
	public String regist(@RequestBody MyHomeReplyVO vo) {
		System.out.println("/homeReply/regist: GET");
		service.regist(vo);
		
		return "success";
		
	}
	
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable("bno") int bno, @PathVariable("pageNum") int pageNum){
		System.out.println("/homeReply/getList/{bno}/{pageNum}: GET");
		System.out.println("bno: " + bno);
		System.out.println("pageNum: " + pageNum);
		
		Map<String, Object> datas = new HashMap<>();
		
		PageVO paging = new PageVO();
		paging.setNowPage(pageNum);
		
		PageCreator pc = new PageCreator(paging, service.getTotalReply(bno));
		System.out.println("beginPage: " + pc.getBeginPage());
		System.out.println("endPage: " + pc.getEndPage());
		
		List<MyHomeReplyVO> list = service.getList(paging, bno);
		
		for(MyHomeReplyVO vo : list) {
			System.out.println("댓글정보: " + vo);
		}
		
		datas.put("list", list);
		datas.put("pc", pc);
		datas.put("total", service.getTotalReply(bno));
		
		return datas;		
	}
	
	@PostMapping("/update")
	public String update(@RequestBody MyHomeReplyVO vo) {
		System.out.println("/homeReply/update: POST");
		
		service.update(vo);
		
		return "modSuccess";		
	}
	
	@PostMapping("/delete")
	public String delete(@RequestBody int rno) {
		System.out.println("/homeReply/delete: POST");
		
		service.delete(rno);
		
		return "delSuccess";
	}
	
	
	
	
}
