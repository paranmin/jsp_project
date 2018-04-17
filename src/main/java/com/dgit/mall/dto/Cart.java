package com.dgit.mall.dto;

public class Cart {
	private int ctNo;
	private int ctPrdQuantity;
	private String ctPrdOpname;
	private Member mNo;
	private Product prdNo;
	public int getCtNo() {
		return ctNo;
	}
	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}
	public int getCtPrdQuantity() {
		return ctPrdQuantity;
	}
	public void setCtPrdQuantity(int ctPrdQuantity) {
		this.ctPrdQuantity = ctPrdQuantity;
	}
	public String getCtPrdOpname() {
		return ctPrdOpname;
	}
	public void setCtPrdOpname(String ctPrdOpname) {
		this.ctPrdOpname = ctPrdOpname;
	}
	public Member getmNo() {
		return mNo;
	}
	public void setmNo(Member mNo) {
		this.mNo = mNo;
	}
	public Product getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(Product prdNo) {
		this.prdNo = prdNo;
	}
	@Override
	public String toString() {
		return "Cart [ctNo=" + ctNo + ", ctPrdQuantity=" + ctPrdQuantity + ", ctPrdOpname=" + ctPrdOpname + ", mNo="
				+ mNo + ", prdNo=" + prdNo + "]";
	}
	public Cart(int ctNo, int ctPrdQuantity, String ctPrdOpname, Member mNo, Product prdNo) {
		super();
		this.ctNo = ctNo;
		this.ctPrdQuantity = ctPrdQuantity;
		this.ctPrdOpname = ctPrdOpname;
		this.mNo = mNo;
		this.prdNo = prdNo;
	}
	public Cart() {
	}
	
	
	
}
