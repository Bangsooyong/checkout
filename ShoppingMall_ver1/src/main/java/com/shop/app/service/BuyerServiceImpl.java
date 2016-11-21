package com.shop.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.app.domain.BuyerVO;
import com.shop.app.persistence.BuyerDAO;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired // 스프링 프레임워크에서 관리하는 DAO 빈 객체를 주입
	private BuyerDAO dao;
	
	@Override
	public int insert(BuyerVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public BuyerVO read(String b_id) {
		return dao.select(b_id);
	}
}
