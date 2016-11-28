package com.shop.app.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.app.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	private static final String NAMESPACE = "com.shop.app.ProductMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectAll() {
		return sqlSession.selectList(NAMESPACE+".selectAll-product");
	}

	// 카트테스트용
	@Override
	public ProductVO selectByProductNo(int p_no) {
		ProductVO vo = sqlSession.selectOne(NAMESPACE+".select-by-p_no", p_no);
		
		return vo;
	}
}
