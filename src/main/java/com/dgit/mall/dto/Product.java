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
	private int sellingCount; // 판매갯수

	public Product() {
	}

	public Product(int prdNo) {
		this.prdNo = prdNo;
	}

	public Product(int prdNo, String name, String subDesc, String mainImg, String content, int cost, String discountPer,
			int sellingPrice, int stock, String useOption, String category, String use) {
		this.prdNo = prdNo;
		this.name = name;
		this.subDesc = subDesc;
		this.mainImg = mainImg;
		this.content = content;
		this.cost = cost;
		this.discountPer = discountPer;
		this.sellingPrice = sellingPrice;
		this.stock = stock;
		this.useOption = useOption;
		this.category = category;
		this.use = use;
	}

	public Product(int prdNo, String name, String subDesc, String mainImg, String content, int cost, String discountPer,
			int sellingPrice, int stock, String useOption, String category, String use, int sellingCount) {
		this.prdNo = prdNo;
		this.name = name;
		this.subDesc = subDesc;
		this.mainImg = mainImg;
		this.content = content;
		this.cost = cost;
		this.discountPer = discountPer;
		this.sellingPrice = sellingPrice;
		this.stock = stock;
		this.useOption = useOption;
		this.category = category;
		this.use = use;
		this.sellingCount = sellingCount;
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

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public int getSellingCount() {
		return sellingCount;
	}

	public void setSellingCount(int sellingCount) {
		this.sellingCount = sellingCount;
	}

	@Override
	public String toString() {
		return String.format(
				"Product [prdNo=%s, name=%s, subDesc=%s, mainImg=%s, content=%s, cost=%s, discountPer=%s, sellingPrice=%s, stock=%s, useOption=%s, category=%s, use=%s, sellingCount=%s]",
				prdNo, name, subDesc, mainImg, content, cost, discountPer, sellingPrice, stock, useOption, category,
				use, sellingCount);
	}

}
