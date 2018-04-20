package com.dgit.mall.dto;

public class Product {
	private int prdNo;
	private String name;
	private String subDesc; // 상품 부가 설명
	private String mainImg; // 상품 메인이미지
	private String content; // 상세설명(이미지)
	private int cost; // 원가
	/* private String use_discount; //할인 유무 */
	private String discountPer; // 할인율
	private int sellingPrice; // 판매가
	private int stock; // 상품재고
	private String useOption; // 옵션유무
	private String category;
	private String use;
	private int prdNum;

	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int prdNo) {
		super();
		this.prdNo = prdNo;
	}

	public int getPrdNum() {
		return prdNum;
	}

	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}

	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public int getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubDesc() {
		return subDesc;
	}

	public void setSubDesc(String subDesc) {
		this.subDesc = subDesc;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDiscountPer() {
		return discountPer;
	}

	public void setDiscountPer(String discountPer) {
		this.discountPer = discountPer;
	}

	public int getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getUseOption() {
		return useOption;
	}

	public void setUseOption(String useOption) {
		this.useOption = useOption;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return String.format(
				"Product [prdNo=%s, name=%s, subDesc=%s, mainImg=%s, content=%s, cost=%s, discountPer=%s, sellingPrice=%s, stock=%s, useOption=%s, category=%s, use=%s, prdNum=%s]",
				prdNo, name, subDesc, mainImg, content, cost, discountPer, sellingPrice, stock, useOption, category,
				use, prdNum);
	}
	
}
