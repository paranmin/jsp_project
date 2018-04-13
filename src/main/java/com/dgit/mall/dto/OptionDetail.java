package com.dgit.mall.dto;

public class OptionDetail {
	private int poNo;
	private int podNo;
	private String podValue;
	private String podCost;
	private int prdNo;
	public OptionDetail() {}
	public OptionDetail(int poNo, int podNo, String podValue, String podCost, int prdNo) {
		super();
		this.poNo = poNo;
		this.podNo = podNo;
		this.podValue = podValue;
		this.podCost = podCost;
		this.prdNo = prdNo;
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
	public int getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}
	@Override
	public String toString() {
		return String.format("OptionDetail [poNo=%s, podNo=%s, podValue=%s, podCost=%s, prdNo=%s]", poNo, podNo,
				podValue, podCost, prdNo);
	}
	
}
