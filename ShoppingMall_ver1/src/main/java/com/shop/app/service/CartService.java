package com.shop.app.service;

import java.util.List;

import com.shop.app.domain.CartVO;

public interface CartService {
	public abstract int insertCart(CartVO vo);
	public abstract int deleteCart(int c_no);
	public abstract List<CartVO> read(String b_id);
	public abstract int updateBuyCnt(int c_no, int buy_cnt);
}
