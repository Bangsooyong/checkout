package com.shop.app.persistence;

import com.shop.app.domain.BuyerVO;

public interface BuyerDAO {
	public abstract int insert(BuyerVO vo);
	public abstract BuyerVO select(String b_id);
}
