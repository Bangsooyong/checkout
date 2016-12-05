package com.shop.app.service;

import java.util.List;

import com.shop.app.domain.CartVO;

public interface CartService {
	public abstract int insertCart(CartVO vo);
	public abstract int deleteCart(int c_no);
	public abstract List<CartVO> read(String b_id);
	public abstract int updateBuyCnt(int c_no, int buy_cnt);
	public abstract CartVO readCart(int c_no);
	public abstract int updateBuyNo(int buy_no, int c_no);
}
