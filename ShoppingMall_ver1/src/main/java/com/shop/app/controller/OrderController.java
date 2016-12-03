package com.shop.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.shop.app.service.CartService;
import com.shop.app.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value="openOrderComplete", method=RequestMethod.GET)
	public void openOrder(){
		
	}
	
	@RequestMapping(value="tossOrder", method=RequestMethod.GET)
	public void insertOrder(int c_no, Model model){
		logger.info("insertOrder 컨트롤러 실행");

	}

}
