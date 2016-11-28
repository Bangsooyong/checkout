package com.shop.app.persistence;

import java.util.List;

import com.shop.app.domain.ProductVO;

public interface ProductDAO {
	// 카트 테스트용 상품리스트
	public abstract List<ProductVO> selectAll();
	
	// 카트 테스트용 
	public abstract ProductVO selectByProductNo(int p_no);
}
