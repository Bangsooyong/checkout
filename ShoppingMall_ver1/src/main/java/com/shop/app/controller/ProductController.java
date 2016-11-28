package com.shop.app.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.app.domain.ProductVO;
import com.shop.app.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	// 상품리스트 불러오는 콘트롤러
	@RequestMapping(value="/list")
	public String productAll(Model model){
		List<ProductVO> list = productService.selectAll();
		model.addAttribute("productList", list);
		return "test_product_list";
	}
	
	// 상품리스트에서 누르면 상품리스트 보여주는 콘트롤러 
	@RequestMapping(value="/detail")
	public String productDetail(int p_no, Model model){
		ProductVO vo = productService.selectByProductNo(p_no);
		model.addAttribute("productDetail", vo);
		return "test_detail";
	}
	
}
