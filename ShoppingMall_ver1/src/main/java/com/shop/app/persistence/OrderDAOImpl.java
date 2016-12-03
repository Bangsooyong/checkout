package com.shop.app.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.app.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	private static final String NAMESPACE = "com.shop.app.OrderMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertOder(OrderVO vo) {
		return sqlSession.insert(NAMESPACE+".order-insert", vo);
	}
	@Override
	public int getBuy_no(String b_id) {
		return sqlSession.selectOne(NAMESPACE+".get-buy_no", b_id);
	}

}
