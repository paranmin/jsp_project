package com.dgit.mall.dto;

public class Product {
	private int prd_no;
	private String prd_name;
	private String prd_sub_desc; //상품 부가 설명
	private String prd_main_img; //상품 메인이미지
	private String prd_content; //상세설명(이미지)
	private int prd_cost; //원가
	/*private String use_discount; //할인 유무*/
	private String prd_discount_per; //할인율
	private int prd_selling_price; //판매가
	private int prd_stock; //상품재고
	private String prd_use_option; //옵션유무
	private String prd_category;
	
	public Product() {	}
	
	
	public String getPrd_category() {
		return prd_category;
	}


	public void setPrd_category(String prd_category) {
		this.prd_category = prd_category;
	}


	public int getPrd_no() {
		return prd_no;
	}


	public void setPrd_no(int prd_no) {
		this.prd_no = prd_no;
	}


	public String getPrd_name() {
		return prd_name;
	}


	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public String getPrd_sub_desc() {
		return prd_sub_desc;
	}


	public void setPrd_sub_desc(String prd_sub_desc) {
		this.prd_sub_desc = prd_sub_desc;
	}


	public String getPrd_main_img() {
		return prd_main_img;
	}


	public void setPrd_main_img(String prd_main_img) {
		this.prd_main_img = prd_main_img;
	}


	public String getPrd_content() {
		return prd_content;
	}


	public void setPrd_content(String prd_content) {
		this.prd_content = prd_content;
	}


	public int getPrd_cost() {
		return prd_cost;
	}


	public void setPrd_cost(int prd_cost) {
		this.prd_cost = prd_cost;
	}


	public String getPrd_discount_per() {
		return prd_discount_per;
	}


	public void setPrd_discount_per(String prd_discount_per) {
		this.prd_discount_per = prd_discount_per;
	}


	public int getPrd_selling_price() {
		return prd_selling_price;
	}


	public void setPrd_selling_price(int prd_selling_price) {
		this.prd_selling_price = prd_selling_price;
	}


	public int getPrd_stock() {
		return prd_stock;
	}


	public void setPrd_stock(int prd_stock) {
		this.prd_stock = prd_stock;
	}


	public String getPrd_use_option() {
		return prd_use_option;
	}


	public void setPrd_use_option(String prd_use_option) {
		this.prd_use_option = prd_use_option;
	}


	@Override
	public String toString() {
		return String.format(
				"Product [prd_no=%s, prd_name=%s, prd_sub_desc=%s, prd_main_img=%s, prd_content=%s, prd_cost=%s, prd_discount_per=%s, prd_selling_price=%s, prd_stock=%s, prd_use_option=%s, prd_category=%s]",
				prd_no, prd_name, prd_sub_desc, prd_main_img, prd_content, prd_cost, prd_discount_per,
				prd_selling_price, prd_stock, prd_use_option, prd_category);
	}




}
