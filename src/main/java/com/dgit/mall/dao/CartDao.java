package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;

import com.dgit.mall.dto.Cart;

public interface CartDao {
	public List<Cart> selectAllCart(int mno) throws SQLException;
	public void insertCart(Cart cart) throws SQLException;
}
