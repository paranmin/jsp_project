package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	public List<Product> selectSaleProduct() throws SQLException;
	
	public Product SelectProductByno(int no) throws SQLException;
	public List<Proimg> SelectProimgByno(int no) throws SQLException;
	
	public List<Option> SelectOptionByno(int no) throws SQLException;
	public List<OptionDetail> SelectOpDeByno(int OPno) throws SQLException;
	
	public void updateProduct(Product pro) throws SQLException;
	
	public void deleteOption(int no) throws SQLException;
	public void deleteOptionDetail(int no) throws SQLException;
	
	public void deleteProimg(Proimg img) throws SQLException;
	
	public List<Product> selectBestAllProduct() throws SQLException;
	public List<Product> selectBestCateProduct(String cate) throws SQLException;

	public List<Product> selectProductByPagination(Map<String, Object> map) throws SQLException;
	public int countTotalProductByCategory(Product product) throws SQLException;
	
	public int selectNameProductCount(Product pro) throws SQLException;
	public int allProduct(int no);

} 
