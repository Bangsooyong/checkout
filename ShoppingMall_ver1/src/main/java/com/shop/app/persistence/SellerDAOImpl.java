package com.shop.app.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.app.domain.SellerVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	private static final String NAMESPACE = "com.shop.app.SellerMapper";

	@Autowired
	private SqlSession sqlSesson;
	
	/* ----------------------------------------------------------------------------------------------------- */
	// 회원가입 등록
	@Override
	public int insert(SellerVO vo) {
		int result = sqlSesson.insert(NAMESPACE + ".seller-insert", vo);
		return result;
	}
	/* ----------------------------------------------------------------------------------------------------- */
	// 회원가입 ID 중복검사 AJAX에 쓰임
	@Override
	public SellerVO select(String s_id) {
		SellerVO vo = sqlSesson.selectOne(NAMESPACE + ".select-by-s_id", s_id);
		return vo;
	}
	/* ----------------------------------------------------------------------------------------------------- */
	// 로그인 ??
	@Override
	public boolean isValidUser(String s_id, String s_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("s_id", s_id);
		map.put("s_pw", s_pw);
		int result = sqlSesson.selectOne(NAMESPACE + ".seller-login", map);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}
	/* ----------------------------------------------------------------------------------------------------- */
} // end SellerDAOImpl class
