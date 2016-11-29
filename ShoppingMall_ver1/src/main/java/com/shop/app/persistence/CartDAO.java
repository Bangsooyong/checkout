package com.shop.app.persistence;

import java.util.List;

import com.shop.app.domain.CartVO;

public interface CartDAO {
	// 장바구니 추가
	public abstract int insertCart(CartVO vo);
	// 장바구니 삭제
	public abstract int deleteCart(int c_no);
	// 장바구니 불러오기
	public abstract List<CartVO> selectAll(String b_id);
	// 수량 업데이트
	public abstract int updateCount(int c_no, int buy_cnt);
}
