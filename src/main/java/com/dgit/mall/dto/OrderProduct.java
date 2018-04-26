package com.dgit.mall.dto;

public class OrderProduct {
	private int opSellingPrice;
	private int opQuantity;
	private String opOption;
	private Order order;
	private Product prdNo;
	public OrderProduct() {
	}
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
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(Product prdNo) {
		this.prdNo = prdNo;
	}
	public OrderProduct(int opSellingPrice, int opQuantity, String opOption, Order order, Product prdNo) {
		super();
		this.opSellingPrice = opSellingPrice;
		this.opQuantity = opQuantity;
		this.opOption = opOption;
		this.order = order;
		this.prdNo = prdNo;
	}
	@Override
	public String toString() {
		return "OrderProduct [opSellingPrice=" + opSellingPrice + ", opQuantity=" + opQuantity + ", opOption="
				+ opOption + ", order=" + order + ", prdNo=" + prdNo + "]";
	}
	
}
