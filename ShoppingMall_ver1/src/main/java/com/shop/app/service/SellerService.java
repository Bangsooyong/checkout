package com.shop.app.service;

import com.shop.app.domain.SellerVO;

public interface SellerService {

	public abstract int insert(SellerVO vo);
	public abstract SellerVO read(String s_id);
	public abstract boolean isValidUser(String s_id, String s_pw);
	
}
