package com.shop.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.app.domain.ProductVO;
import com.shop.app.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	public ProductDAO dao;

	@Override
	public List<ProductVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public ProductVO selectByProductNo(int p_no) {
		return dao.selectByProductNo(p_no);
	}

}
