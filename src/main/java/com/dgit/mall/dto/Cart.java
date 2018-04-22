package com.dgit.mall.dto;

public class Cart {
	private int no;
	private int prdQuantity;
	private String prdOpName;
	private int prdOpPrice;
	private Member member;
	private Product product;

	public Cart() {
	}

	public Cart(int no, int prdQuantity, String prdOpName, int prdOpPrice, Member member, Product product) {
		this.no = no;
		this.prdQuantity = prdQuantity;
		this.prdOpName = prdOpName;
		this.prdOpPrice = prdOpPrice;
		this.member = member;
		this.product = product;
	}

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

	@Override
	public String toString() {
		return String.format("Cart [no=%s, prdQuantity=%s, prdOpName=%s, prdOpPrice=%s, member=%s, product=%s]", no,
				prdQuantity, prdOpName, prdOpPrice, member, product);
	}

}
