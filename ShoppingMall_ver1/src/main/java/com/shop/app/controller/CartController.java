package com.shop.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		return "redirect:selectCart";
	}
	
	@RequestMapping(value="selectCart", method=RequestMethod.GET)
	public String selectCart(Model model){
		logger.info("selectCart 컨트롤러 실행");
		// TODO: 로그인 세션으로 b_id 줘야함.. 임시로 aaaa해놈
		String b_id="aaaa";
		List<CartVO> list = cartService.read(b_id);
		if (list.size()!=0){
			list.get(0).getBuy_cnt();
			model.addAttribute("cartList", list);
			return "test_cart";	
		} else {
			logger.info("장바구니빔... 예외처리 추가 필요함");
			return "";
		}
		
	}
	
	@RequestMapping(value="deleteCart", method=RequestMethod.POST)
	public void deleteCart(@RequestBody int c_no, HttpServletResponse response) throws IOException{
		logger.info("deleteCart 컨트롤러 실행");
		logger.info("c_no : "+c_no);
		int result = cartService.deleteCart(c_no);
		if (result==1){
			response.getWriter().print(1);
			logger.info("장바구니 삭제 성공");
		} else {
			response.getWriter().print(2);
			logger.info("장바구니 삭제 실패");
		}
	}
	
	@RequestMapping(value="updateCartBuyCnt", method=RequestMethod.GET)
	public String updateCart(int c_no, int buy_cnt){
		cartService.updateBuyCnt(c_no, buy_cnt);
		return "redirect:selectCart";
	}
	
}
