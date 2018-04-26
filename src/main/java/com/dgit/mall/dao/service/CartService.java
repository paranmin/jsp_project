package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.Cart;
import com.dgit.mall.util.MySqlSessionFactory;

public class CartService {
	private final static CartService instance = new CartService();
	private final String namespace = "com.dgit.mall.dao.CartDao.";

	public static CartService getInstance() {
		return instance;
	}

	public CartService() {
	}

	public List<Cart> selectAllCart(int mno) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectAllCart", mno);
		}
	}

	public int countSelectAllCartByMember(int mno) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + "countSelectAllCartByMember", mno);
		}
	}
	
	public int deleteCartByNo(Map<String, Object> map) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.delete(namespace + "deleteCartByNo", map);
		}
	}
}
