package com.dgit.mall.dto;

public class Address {
	private int memNo;
	private String zipcode;
	private String addr1;
	private String addr2;

	public Address() {
	}

	public Address(int memNo, String zipcode, String addr1, String addr2) {
		this.memNo = memNo;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	@Override
	public String toString() {
		return String.format("Address [memNo=%s, zipcode=%s, addr1=%s, addr2=%s]", memNo, zipcode, addr1, addr2);
	}

}
