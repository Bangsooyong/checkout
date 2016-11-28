package com.shop.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.app.domain.ProductVO;

public interface ProductService {
	// 카트 테스트용 상품리스트
	public abstract List<ProductVO> selectAll();
	
	// 카트 테스트용 
	public abstract ProductVO selectByProductNo(int p_no);

}
