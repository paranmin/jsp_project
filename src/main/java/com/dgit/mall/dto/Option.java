package com.dgit.mall.dto;

public class Option {
	private int poNo;
	private String poName;
	private int prdNo;
	public Option() {}
	public Option(int poNo, String poName, int prdNo) {
		super();
		this.poNo = poNo;
		this.poName = poName;
		this.prdNo = prdNo;
	}
	public int getPoNo() {
		return poNo;
	}
	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}
	public String getPoName() {
		return poName;
	}
	public void setPoName(String poName) {
		this.poName = poName;
	}
	public int getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}
	@Override
	public String toString() {
		return String.format("Option [poNo=%s, poName=%s, prdNo=%s]", poNo, poName, prdNo);
	}
	
}
