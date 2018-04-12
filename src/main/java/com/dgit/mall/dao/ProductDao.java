package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;

import com.dgit.mall.dto.Option;
import com.dgit.mall.dto.OptionDetail;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;

public interface ProductDao {
	public int insertProduct(Product pro) throws SQLException;
	public int insertProImg(Proimg img) throws SQLException;
	public int insertOption(Option opt) throws SQLException;
	public int insertOptionDetail(OptionDetail det) throws SQLException;
	public int selectLastInsert() throws SQLException;
	public int selectLastInsertOption() throws SQLException;
	
	public List<Product> selectAllProduct() throws SQLException;
	public List<Product> selectCateProduct(Product pro) throws SQLException;
	public List<Product> selectNameProduct(Product pro) throws SQLException;
	public List<Product> selectNCProduct(Product pro) throws SQLException;
}
