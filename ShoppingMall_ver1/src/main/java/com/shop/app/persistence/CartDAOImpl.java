package com.shop.app.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.app.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	private static final String NAMESPACE = "com.shop.app.CartMapper";
	
	@Autowired
	private SqlSession sqlSession;
	/* ----------------------------------------------------------------------------------------------------- */
	// 장바구니 추가
	@Override
	public int insertCart(CartVO vo) {
		return sqlSession.insert(NAMESPACE+".cart-insert", vo); 
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public int deleteCart(int c_no) {
		return sqlSession.delete(NAMESPACE, c_no);
	}
	/* ----------------------------------------------------------------------------------------------------- */
	@Override
	public List<CartVO> selectAll(String b_id) {
		return sqlSession.selectList(NAMESPACE+".cart-select-by-b_id", b_id);
	}

}
