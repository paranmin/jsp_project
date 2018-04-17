package com.dgit.mall.dao;

import java.sql.SQLException;

import com.dgit.mall.dto.Order;

public interface OrderDao {
	public int insertOrder(Order order) throws SQLException;
}
