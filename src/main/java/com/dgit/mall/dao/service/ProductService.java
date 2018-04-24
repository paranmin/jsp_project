package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductService {
	private static final ProductService instance = new ProductService();
	private final String namespace = "com.dgit.mall.dao.ProductDao.";

	public static ProductService getInstance() {
		return instance;
	}

	private ProductService() {
	}

	public int insertProduct(Product pro) {
		System.out.println(pro);
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			ProductDao dao = sqlSession.getMapper(ProductDao.class);

			System.out.println(sqlSession.toString());
			res = dao.insertProduct(pro);
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public List<Product> selectAllProduct() throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectAllProduct");
		}
	}

	public List<Product> selectBestAllProduct() throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectBestAllProduct");
		}
	}

	public List<Product> selectCateProduct(Product pro) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectCateProduct", pro);
		}
	}

	public List<Product> selectBestCateProduct(String cate) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectBestCateProduct", cate);
		}
	}

	public List<Product> selectProductByPagination(Map<String, Object> map) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectProductByPagination", map);
		}
	}
}
