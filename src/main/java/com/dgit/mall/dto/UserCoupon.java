package com.dgit.mall.dto;

public class UserCoupon {
	private int ucNo;
	private Coupon cNo;
	private Member mNo;
	private CouponUseYN yn;
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
	public UserCoupon(int ucNo, Coupon cNo, Member mNo, CouponUseYN yn) {
		super();
		this.ucNo = ucNo;
		this.cNo = cNo;
		this.mNo = mNo;
		this.yn = yn;
	}
	public UserCoupon() {
	}
	@Override
	public String toString() {
		return "UserCoupon [ucNo=" + ucNo + ", cNo=" + cNo + ", mNo=" + mNo + ", yn=" + yn + "]";
	}
	
	
}
