package com.dgit.mall.dto;

public class Proimg {
	private int prdNo;
	private int imgNo;
	private String img;

	public Proimg() {
	}

	public Proimg(int prdNo, int imgNo, String img) {
		super();
		this.prdNo = prdNo;
		this.imgNo = imgNo;
		this.img = img;
	}

	public int getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return String.format("Proimg [prdNo=%s, imgNo=%s, img=%s]", prdNo, imgNo, img);
	}
	
	
}
