package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.util.MySqlSessionFactory;

public class CartService {
	private final static CartService instance = new CartService();

	public static CartService getInstance() {
		return instance;
	}

	public CartService() {
	}
	
	public List<Cart> selectAllCart(int cart){
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			CartDao dao = sqlSession.getMapper(CartDao.class);
			return dao.selectAllCart(cart);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
