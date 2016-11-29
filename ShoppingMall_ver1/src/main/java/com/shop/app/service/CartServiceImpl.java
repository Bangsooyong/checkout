package com.shop.app.service;

import java.util.List;

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
	@Override
	public List<CartVO> read(String b_id) {
		return dao.selectAll(b_id);
	}
	@Override
	public int deleteCart(int c_no) {
		return dao.deleteCart(c_no);
	}

}
