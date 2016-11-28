package com.shop.app.persistence;

import com.shop.app.domain.CartVO;

public interface CartDAO {
	// 장바구니 추가
	public abstract int insertCart(CartVO vo);
	// 장바구니 삭제
	public abstract int deleteCart(int c_no);
}
