package com.shop.app.service;

import com.shop.app.domain.OrderVO;

public interface OrderService {
	public abstract int insertOrder(OrderVO vo);
	public abstract int getBuyNo(String b_id);
}
