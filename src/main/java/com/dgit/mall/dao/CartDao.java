package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dgit.mall.dto.Cart;

public interface CartDao {
	public List<Cart> selectAllCart(int mno) throws SQLException;
	public int deleteByClickBtn(Map<String, Object> map) throws SQLException;
	public int deleByAll(int mno) throws SQLException;
	public List<Cart> selectByselectedCart(Map<String, Object> map) throws SQLException;
	
}
