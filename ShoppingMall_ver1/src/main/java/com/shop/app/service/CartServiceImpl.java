package com.shop.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.app.domain.CartVO;
import com.shop.app.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	public CartDAO dao;
	
	@Override
	public int insertCart(CartVO vo) {
		return dao.insertCart(vo);
	}

}
