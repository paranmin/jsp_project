package com.dgit.mall.dao.service;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.util.MySqlSessionFactory;

public class OrderService {
	private static final OrderService instance = new OrderService();
	private final String namespace = "com.dgit.mall.dao.OrderDao.";

	public static OrderService getInstance() {
		return instance;
	}

	private OrderService() {
	}

	public int insertOrder(Order order) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "insertOrder", order);
			sqlSession.commit();
		}
		return res;
	}

	public int insertOrderProduct(OrderProduct orderproduct) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "insertOrderProduct", orderproduct);
			sqlSession.commit();
		}
		return res;
	}
}
