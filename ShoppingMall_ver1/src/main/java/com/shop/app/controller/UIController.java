package com.shop.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
public class UIController {
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String openIndex(){
		
		return "/UI/index";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String openRegister(){
		return "/UI/register";
	}

}
