package com.spring.myWeb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class WebSocketController {

	@GetMapping("/openChat")
	public String openChat() {
		return "/wstest/index";
	}
	
	@GetMapping("/adminChat")
	public String adminChat() {
		return "/wstest/admin";
	}
}
