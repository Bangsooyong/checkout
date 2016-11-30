package com.shop.app.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.app.domain.CartVO;
import com.shop.app.domain.OrderVO;
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
	
	@RequestMapping(value="openOrder", method=RequestMethod.GET)
	public String openOrder(){
		return "test_order";
	}
	
	@RequestMapping(value="tossOrder", method=RequestMethod.GET)
	public String insertOrder(int c_no, Model model){
		logger.info("insertOrder 컨트롤러 실행");
		List<CartVO> list  = cartService.readCart(c_no);
		model.addAttribute("listForOrder", list);
		
		// 테스트 오더 페이지로 카트에서 체크된 리스트 보내줌
		return "redirect:test_order";
	}

}
