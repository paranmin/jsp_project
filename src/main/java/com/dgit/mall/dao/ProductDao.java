package com.dgit.mall.dao;

import java.sql.SQLException;

import com.dgit.mall.dto.Product;

public interface ProductDao {
	
	public void insertProduct(Product pro) throws SQLException;
}
