package com.shop.app.persistence;

import com.shop.app.domain.OrderVO;

public interface OrderDAO {
	public abstract int insertOder(OrderVO vo);
	public abstract int getBuy_no(String b_id);
}
