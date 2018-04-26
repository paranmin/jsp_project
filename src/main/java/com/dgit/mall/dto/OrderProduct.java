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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((prdNo == null) ? 0 : prdNo.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderProduct other = (OrderProduct) obj;
		if (prdNo == null) {
			if (other.prdNo != null)
				return false;
		} else if (!prdNo.equals(other.prdNo))
			return false;
		return true;
	}
	
}
