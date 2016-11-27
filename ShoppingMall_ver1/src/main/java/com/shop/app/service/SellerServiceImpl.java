package com.shop.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.app.domain.SellerVO;
import com.shop.app.persistence.SellerDAO;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	public SellerDAO dao;
	
	@Override
	public int insert(SellerVO vo) {
		return dao.insert(vo);
	}

	@Override
	public SellerVO read(String s_id) {
		return dao.select(s_id);
	}

	@Override
	public boolean isValidUser(String s_id, String s_pw) {
		return dao.isValidUser(s_id, s_pw);
	}

}
