package com.shop.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.app.domain.CartVO;
import com.shop.app.service.CartService;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="insertCart", method=RequestMethod.GET)
	public String insertCart(CartVO vo){
		logger.info("insertCart 컨트롤러 실행");
		cartService.insertCart(vo);
		logger.info("카트 인서트 성공");
		return "test_cart";
	}
	
	@RequestMapping(value="deleteCart", method=RequestMethod.GET)
	public String deleteCart(int c_no){
		logger.info("deleteCart 컨트롤러 실행");
		return "";
	}
	
}
