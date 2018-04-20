package com.dgit.mall.dto;

public class OptionDetail {
	private int poNo;
	private int podNo;
	private String podValue;
	private String podCost;
	private int podStock;
	
	public OptionDetail() {}

	public OptionDetail(int poNo, int podNo, String podValue, String podCost, int podStock) {
		super();
		this.poNo = poNo;
		this.podNo = podNo;
		this.podValue = podValue;
		this.podCost = podCost;
		this.podStock = podStock;
	}
	public int getPodStock() {
		return podStock;
	}
	public void setPodStock(int podStock) {
		this.podStock = podStock;
	}
	public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public int getPodNo() {
		return podNo;
	}
	public void setPodNo(int podNo) {
		this.podNo = podNo;
	}
	public String getPodValue() {
		return podValue;
	}
	public void setPodValue(String podValue) {
		this.podValue = podValue;
	}
	public String getPodCost() {
		return podCost;
	}
	public void setPodCost(String podCost) {
		this.podCost = podCost;
	}
	
	@Override
	public String toString() {
		return String.format("OptionDetail [poNo=%s, podNo=%s, podValue=%s, podCost=%s]", poNo, podNo,
				podValue, podCost);
	}
	
}
