package com.dgit.mall.dto;

import com.dgit.mall.dto.type.CouponUseYN;

public class UserCoupon {
	private int ucNo;
	private Coupon cNo;
	private Member mNo;
	private CouponUseYN yn;

	public UserCoupon() {
	}

	public UserCoupon(int ucNo, Coupon cNo, Member mNo, CouponUseYN yn) {
		this.ucNo = ucNo;
		this.cNo = cNo;
		this.mNo = mNo;
		this.yn = yn;
	}

	public int getUcNo() {
		return ucNo;
	}

	public void setUcNo(int ucNo) {
		this.ucNo = ucNo;
	}

	public Coupon getcNo() {
		return cNo;
	}

	public void setcNo(Coupon cNo) {
		this.cNo = cNo;
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

	@Override
	public String toString() {
		return String.format("UserCoupon [ucNo=%s, cNo=%s, mNo=%s, yn=%s]", ucNo, cNo, mNo, yn);
	}

}
