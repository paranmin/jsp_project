package com.dgit.mall.dto;

import java.util.Date;

import com.dgit.mall.dto.type.AddressType;

public class Address {
	private int addrNo;
	private int memNo;
	private String zipcode;
	private String addr1;
	private String addr2;
	private AddressType addrType;
	private Date regdate;
	private String addrName;
	
	
	
	public Address(int addrNo, int memNo, String zipcode, String addr1, String addr2, AddressType addrType,
			Date regdate, String addrName) {
		this.addrNo = addrNo;
		this.memNo = memNo;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addrType = addrType;
		this.regdate = regdate;
		this.addrName = addrName;
	}



	public Address() {
	}



	public int getAddrNo() {
		return addrNo;
	}



	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
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



	public AddressType getAddrType() {
		return addrType;
	}



	public void setAddrType(AddressType addrType) {
		this.addrType = addrType;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public String getAddrName() {
		return addrName;
	}



	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}



	@Override
	public String toString() {
		return "Address [addrNo=" + addrNo + ", memNo=" + memNo + ", zipcode=" + zipcode + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", addrType=" + addrType + ", regdate=" + regdate + ", addrName=" + addrName
				+ "]";
	}

}
