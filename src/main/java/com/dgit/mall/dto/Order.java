package com.dgit.mall.dto;

import com.dgit.mall.dto.type.PayType;

public class Order {
	private String ordNo;
	private int ordPrice;
	private int ordCouponPrice;
	private int deliveryFee;
	private String ordMessage;
	private PayType type;
	private Member member;
	private Address address; //배송지번호
	private String receiver;
	private String rcPhone1;
	private String rcPhone2; //주문회원의 전화번호가 들어감
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getRcPhone1() {
		return rcPhone1;
	}
	public void setRcPhone1(String rcPhone1) {
		this.rcPhone1 = rcPhone1;
	}
	public String getRcPhone2() {
		return rcPhone2;
	}
	public void setRcPhone2(String rcPhone2) {
		this.rcPhone2 = rcPhone2;
	}
	public Order() {
	}
	public Order(String ordNo, int ordPrice, int ordCouponPrice, int deliveryFee, String ordMessage, PayType type,
			Member member, Address address, String receiver, String rcPhone1, String rcPhone2) {
		super();
		this.ordNo = ordNo;
		this.ordPrice = ordPrice;
		this.ordCouponPrice = ordCouponPrice;
		this.deliveryFee = deliveryFee;
		this.ordMessage = ordMessage;
		this.type = type;
		this.member = member;
		this.address = address;
		this.receiver = receiver;
		this.rcPhone1 = rcPhone1;
		this.rcPhone2 = rcPhone2;
	}
	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", ordPrice=" + ordPrice + ", ordCouponPrice=" + ordCouponPrice
				+ ", deliveryFee=" + deliveryFee + ", ordMessage=" + ordMessage + ", type=" + type + ", member="
				+ member + ", address=" + address + ", receiver=" + receiver + ", rcPhone1=" + rcPhone1 + ", rcPhone2="
				+ rcPhone2 + "]";
	}
	
	
	
	
	

}
