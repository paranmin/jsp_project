package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;

public interface OrderDao {
	public int insertOrder(Order order) throws SQLException;

	public int insertOrderProduct(OrderProduct product) throws SQLException;

	public Order selectOrder(String ordNo) throws SQLException;

	public List<OrderProduct> selectOrderProduct(String ordNo) throws SQLException;

	public List<Order> selectOrderByMember(Map<String, Object> map) throws SQLException;
	
	public int countTotalOrderBySearch(Map<String, Object> map) throws SQLException;
	
	public List<Order> selectOrderListBySearch(Map<String, Object> map) throws SQLException;
}
