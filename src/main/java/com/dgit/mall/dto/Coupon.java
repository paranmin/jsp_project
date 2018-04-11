package com.dgit.mall.dto;

import java.util.Date;

public class Coupon {
	private int cNo;
	private String cName;
	private int cuseMorePrice;
	private int csalePrice;
	private Date climitDate;
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getCuseMorePrice() {
		return cuseMorePrice;
	}
	public void setCuseMorePrice(int cuseMorePrice) {
		this.cuseMorePrice = cuseMorePrice;
	}
	public int getCsalePrice() {
		return csalePrice;
	}
	public void setCsalePrice(int csalePrice) {
		this.csalePrice = csalePrice;
	}
	public Date getClimitDate() {
		return climitDate;
	}
	public void setClimitDate(Date climitDate) {
		this.climitDate = climitDate;
	}
	public Coupon(int cNo, String cName, int cuseMorePrice, int csalePrice, Date climitDate) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.cuseMorePrice = cuseMorePrice;
		this.csalePrice = csalePrice;
		this.climitDate = climitDate;
	}
	public Coupon() {
	}
	@Override
	public String toString() {
		return "Coupon [cNo=" + cNo + ", cName=" + cName + ", cuseMorePrice=" + cuseMorePrice + ", csalePrice="
				+ csalePrice + ", climitDate=" + climitDate + "]";
	}
	
	
}