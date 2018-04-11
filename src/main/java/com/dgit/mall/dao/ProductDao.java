package com.dgit.mall.dao;

import java.sql.SQLException;

import com.dgit.mall.dto.Option;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;

public interface ProductDao {
	public int insertProduct(Product pro) throws SQLException;
	public int insertProImg(Proimg img) throws SQLException;
	public int insertOption(Option opt) throws SQLException;
	public int selectLastInsert() throws SQLException;
	
}
