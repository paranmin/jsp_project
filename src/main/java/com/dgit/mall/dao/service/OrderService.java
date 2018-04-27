package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

	public Order selectOrder(String ordNo) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectOrder", ordNo);
		}
	}

	public List<Order> selectOrderByMember(Map<String, Object> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectOrderByMember", map);
		}
	}

	public List<OrderProduct> selectOrderProduct(String ordNo) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectOrderProduct", ordNo);
		}
	}
	
	public int countTotalOrderBySearch(Map<String, Object> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "countTotalOrderBySearch", map);
		}
	}
	
	public List<Order> selectOrderListBySearch(Map<String, Object> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectOrderListBySearch", map);
		}
	}
}
