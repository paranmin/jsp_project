package com.dgit.mall.dto;

import java.util.Date;

public class Cuopon {
	private String cNo;
	private String cName;
	private int cuseMorePrice;
	private int csalePrice;
	private Date climitDate;
	public String getcNo() {
		return cNo;
	}
	public void setcNo(String cNo) {
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
	public Cuopon(String cNo, String cName, int cuseMorePrice, int csalePrice, Date climitDate) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.cuseMorePrice = cuseMorePrice;
		this.csalePrice = csalePrice;
		this.climitDate = climitDate;
	}
	public Cuopon() {
	}
	@Override
	public String toString() {
		return "Cuopon [cNo=" + cNo + ", cName=" + cName + ", cuseMorePrice=" + cuseMorePrice + ", csalePrice="
				+ csalePrice + ", climitDate=" + climitDate + "]";
	}
	
	
	
}
