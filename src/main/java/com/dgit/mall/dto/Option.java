package com.dgit.mall.dto;

public class Option {
	private int poNo;
	private String poName;
	private String poValue;
	private String poPrice;
	private int poParent;
	private int poDepth;
	private int prdNo;
	public Option() {}
	public Option(int poNo, String poName, String poValue, String poPrice, int poParent, int poDepth, int prdNo) {
		super();
		this.poNo = poNo;
		this.poName = poName;
		this.poValue = poValue;
		this.poPrice = poPrice;
		this.poParent = poParent;
		this.poDepth = poDepth;
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
	public String getPoValue() {
		return poValue;
	}
	public void setPoValue(String poValue) {
		this.poValue = poValue;
	}
	public String getPoPrice() {
		return poPrice;
	}
	public void setPoPrice(String poPrice) {
		this.poPrice = poPrice;
	}
	public int getPoParent() {
		return poParent;
	}
	public void setPoParent(int poParent) {
		this.poParent = poParent;
	}
	public int getPoDepth() {
		return poDepth;
	}
	public void setPoDepth(int poDepth) {
		this.poDepth = poDepth;
	}
	public int getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}
	@Override
	public String toString() {
		return String.format("Option [poNo=%s, poName=%s, poValue=%s, poPrice=%s, poParent=%s, poDepth=%s, prdNo=%s]",
				poNo, poName, poValue, poPrice, poParent, poDepth, prdNo);
	}
}
