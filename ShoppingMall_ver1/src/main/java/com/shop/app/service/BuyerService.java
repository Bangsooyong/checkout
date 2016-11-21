package com.shop.app.service;

import com.shop.app.domain.BuyerVO;

public interface BuyerService {
	
	public abstract int insert(BuyerVO vo);
	public abstract BuyerVO read(String b_id);
	

}
