package com.dgit.mall.dto;

public class OrderProduct {
	private int opSellingPrice;
	private int opQuantity;
	private String opOption;
	private Order ordNo;
	private Product prdNo;
	public int getOpSellingPrice() {
		return opSellingPrice;
	}
	public void setOpSellingPrice(int opSellingPrice) {
		this.opSellingPrice = opSellingPrice;
	}
	public int getOpQuantity() {
		return opQuantity;
	}
	public void setOpQuantity(int opQuantity) {
		this.opQuantity = opQuantity;
	}
	public String getOpOption() {
		return opOption;
	}
	public void setOpOption(String opOption) {
		this.opOption = opOption;
	}
	public Order getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(Order ordNo) {
		this.ordNo = ordNo;
	}
	public Product getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(Product prdNo) {
		this.prdNo = prdNo;
	}
	public OrderProduct(int opSellingPrice, int opQuantity, String opOption, Order ordNo, Product prdNo) {
		super();
		this.opSellingPrice = opSellingPrice;
		this.opQuantity = opQuantity;
		this.opOption = opOption;
		this.ordNo = ordNo;
		this.prdNo = prdNo;
	}
	public OrderProduct() {
	}
	@Override
	public String toString() {
		return "OrderProduct [opSellingPrice=" + opSellingPrice + ", opQuantity=" + opQuantity + ", opOption="
				+ opOption + ", ordNo=" + ordNo + ", prdNo=" + prdNo + "]";
	}
	
	
}
