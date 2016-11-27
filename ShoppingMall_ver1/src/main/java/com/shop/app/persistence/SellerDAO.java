package com.shop.app.persistence;

import com.shop.app.domain.SellerVO;

public interface SellerDAO {

	public abstract int insert(SellerVO vo);
	
	public abstract SellerVO select(String s_id);
	
	public abstract boolean isValidUser(String s_id, String s_pw);
	
} // end SellerDAO class
