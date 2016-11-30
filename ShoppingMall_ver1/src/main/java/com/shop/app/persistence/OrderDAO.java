package com.shop.app.persistence;

import com.shop.app.domain.OrderVO;

public interface OrderDAO {
	public abstract int insertOder(OrderVO vo);
}
