package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;

import com.dgit.mall.dto.Coupon;
import com.dgit.mall.dto.UserCoupon;

public interface CouponDao {
	public List<Coupon> selectByAll() throws SQLException;

	public int selectByNo(Coupon coupon) throws SQLException;

	public int insertCoupon(Coupon coupon) throws SQLException;

	public int deleteCoupon(String cNo) throws SQLException;

	public int insertMemberCoupon(UserCoupon usercoupon) throws SQLException;
	
	public List<UserCoupon> selectByMem(int mNo) throws SQLException;
}
