package com.shop.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.app.domain.OrderVO;
import com.shop.app.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO dao;
	
	@Override
	public int insertOrder(OrderVO vo) {
		return dao.insertOder(vo);
	}
	
}
