package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;

import com.dgit.mall.dto.Coupon;

public interface CouponDao {
	public List<Coupon> selectByAll() throws SQLException;
}
