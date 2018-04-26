package com.dgit.mall.dto;

import java.util.Date;

public class Coupon {
	private String no;
	private String name;
	private int cuseMorePrice;
	private int csalePrice;
	private Date climitDate;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Coupon(String no, String name, int cuseMorePrice, int csalePrice, Date climitDate) {
		super();
		this.no = no;
		this.name = name;
		this.cuseMorePrice = cuseMorePrice;
		this.csalePrice = csalePrice;
		this.climitDate = climitDate;
	}
	public Coupon() {
	}
	@Override
	public String toString() {
		return "Coupon [no=" + no + ", name=" + name + ", cuseMorePrice=" + cuseMorePrice + ", csalePrice=" + csalePrice
				+ ", climitDate=" + climitDate + "]";
	}
	
	
}