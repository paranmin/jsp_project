package com.dgit.mall.dto;

import com.dgit.mall.dto.type.CouponUseYN;

public class UserCoupon {
	private int ucNo;
	private Coupon coupon;
	private Member mNo;
	private CouponUseYN yn;
	public UserCoupon() {
	}
	public int getUcNo() {
		return ucNo;
	}
	public void setUcNo(int ucNo) {
		this.ucNo = ucNo;
	}
	public Coupon getCoupon() {
		return coupon;
	}
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	public Member getmNo() {
		return mNo;
	}
	public void setmNo(Member mNo) {
		this.mNo = mNo;
	}
	public CouponUseYN getYn() {
		return yn;
	}
	public void setYn(CouponUseYN yn) {
		this.yn = yn;
	}
	public UserCoupon(int ucNo, Coupon coupon, Member mNo, CouponUseYN yn) {
		super();
		this.ucNo = ucNo;
		this.coupon = coupon;
		this.mNo = mNo;
		this.yn = yn;
	}
	@Override
	public String toString() {
		return "UserCoupon [ucNo=" + ucNo + ", coupon=" + coupon + ", mNo=" + mNo + ", yn=" + yn + "]";
	}

	
}
