package com.dgit.mall.dto;

import com.dgit.mall.dto.type.PayType;

public class Order {
	private String ordNo;
	private int ordPrice;
	private int ordCouponPrice;
	private String ordOption;
	private int deliveryFee;
	private String ordMessage;
	private PayType type;
	private Member memberNo;
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public int getOrdPrice() {
		return ordPrice;
	}
	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}
	public int getOrdCouponPrice() {
		return ordCouponPrice;
	}
	public void setOrdCouponPrice(int ordCouponPrice) {
		this.ordCouponPrice = ordCouponPrice;
	}
	public String getOrdOption() {
		return ordOption;
	}
	public void setOrdOption(String ordOption) {
		this.ordOption = ordOption;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public String getOrdMessage() {
		return ordMessage;
	}
	public void setOrdMessage(String ordMessage) {
		this.ordMessage = ordMessage;
	}
	public PayType getType() {
		return type;
	}
	public void setType(PayType type) {
		this.type = type;
	}
	public Member getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Member memberNo) {
		this.memberNo = memberNo;
	}
	public Order(String ordNo, int ordPrice, int ordCouponPrice, String ordOption, int deliveryFee, String ordMessage,
			PayType type, Member memberNo) {
		super();
		this.ordNo = ordNo;
		this.ordPrice = ordPrice;
		this.ordCouponPrice = ordCouponPrice;
		this.ordOption = ordOption;
		this.deliveryFee = deliveryFee;
		this.ordMessage = ordMessage;
		this.type = type;
		this.memberNo = memberNo;
	}
	public Order() {
	}
	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", ordPrice=" + ordPrice + ", ordCouponPrice=" + ordCouponPrice
				+ ", ordOption=" + ordOption + ", deliveryFee=" + deliveryFee + ", ordMessage=" + ordMessage + ", type="
				+ type + ", memberNo=" + memberNo + "]";
	}
}
