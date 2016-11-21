package com.shop.app.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.app.domain.BuyerVO;

@Repository
public class BuyerDAOImpl implements BuyerDAO{
	
	private static final String NAMESPACE = "com.shop.app.BuyerMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public int insert(BuyerVO vo) {
		int result =  sqlSession.insert(NAMESPACE+".buyer-insert", vo);
		return result;
	}
	
	// 회원가입 ID 중복검사 AJAX에 쓰임
	@Override
	public BuyerVO select(String b_id) {
		BuyerVO vo =sqlSession.selectOne(NAMESPACE+".select-by-b_id", b_id);
		return vo;
	}
}
