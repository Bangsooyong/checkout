package com.shop.app.service;

import com.shop.app.domain.BuyerVO;

public interface BuyerService {
	
	public abstract int insert(BuyerVO vo);
	public abstract BuyerVO read(String b_id);
	public abstract boolean isValidUser(String b_id, String b_pw);
	

}
