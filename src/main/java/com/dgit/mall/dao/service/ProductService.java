package com.dgit.mall.dao.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductService {
	private static final ProductService instance = new ProductService();

	public static ProductService getInstance() {
		return instance;
	}

	private ProductService() {
	}

	public int insertProduct(Product pro) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			ProductDao dao = sqlSession.getMapper(ProductDao.class);

			res = dao.insertProduct(pro);
			sqlSession.commit();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
}
