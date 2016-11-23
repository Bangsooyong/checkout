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
		return "/sudo_loginSelect";
	}
	
	@RequestMapping(value="checkout", method=RequestMethod.GET)
	public String openProduct(){
		return "/UI/checkout";
	}
	
	@RequestMapping(value="cart", method=RequestMethod.GET)
	public String openCart(){
		return "/UI/cart";
	}
	@RequestMapping(value="contact", method=RequestMethod.GET)
	public String openContact(){
		return "/UI/contact";
	}
	@RequestMapping(value="product_detail", method=RequestMethod.GET)
	public String openProductDetail(){
		return "/UI/product_detail";
	}


}
