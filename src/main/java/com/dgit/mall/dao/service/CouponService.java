package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.util.MySqlSessionFactory;

public class CouponService {
	private static final CouponService instance = new CouponService();

	public static CouponService getInstance() {
		return instance;
	}

	public CouponService() {
	}
	
	public List<Coupon> selectByAll(){
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			CouponDao dao = sqlSession.getMapper(CouponDao.class);
			return dao.selectByAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
