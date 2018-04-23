package com.dgit.mall.dto;

import com.dgit.mall.dto.type.CartToOrder;

public class Cart {
	private int no;
	private int prdQuantity;
	private String prdOpName;
	private int prdOpPrice;
	private Member member;
	private Product product;
	private CartToOrder type;
	private OptionDetail optiondetail;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrdQuantity() {
		return prdQuantity;
	}
	public void setPrdQuantity(int prdQuantity) {
		this.prdQuantity = prdQuantity;
	}
	public String getPrdOpName() {
		return prdOpName;
	}
	public void setPrdOpName(String prdOpName) {
		this.prdOpName = prdOpName;
	}
	public int getPrdOpPrice() {
		return prdOpPrice;
	}
	public void setPrdOpPrice(int prdOpPrice) {
		this.prdOpPrice = prdOpPrice;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public CartToOrder getType() {
		return type;
	}
	public void setType(CartToOrder type) {
		this.type = type;
	}
	public OptionDetail getOptiondetail() {
		return optiondetail;
	}
	public void setOptiondetail(OptionDetail optiondetail) {
		this.optiondetail = optiondetail;
	}
	public Cart(int no, int prdQuantity, String prdOpName, int prdOpPrice, Member member, Product product,
			CartToOrder type, OptionDetail optiondetail) {
		super();
		this.no = no;
		this.prdQuantity = prdQuantity;
		this.prdOpName = prdOpName;
		this.prdOpPrice = prdOpPrice;
		this.member = member;
		this.product = product;
		this.type = type;
		this.optiondetail = optiondetail;
	}
	public Cart() {
	}
	@Override
	public String toString() {
		return "Cart [no=" + no + ", prdQuantity=" + prdQuantity + ", prdOpName=" + prdOpName + ", prdOpPrice="
				+ prdOpPrice + ", member=" + member + ", product=" + product + ", type=" + type + ", optiondetail="
				+ optiondetail + "]";
	}
	
	
	
	
}
