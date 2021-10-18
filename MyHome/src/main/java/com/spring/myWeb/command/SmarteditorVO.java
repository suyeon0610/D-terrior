package com.spring.myWeb.command;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class SmarteditorVO {
	private MultipartFile filedata;
	private String callback;
	private String callback_func;
}
