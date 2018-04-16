package com.dgit.mall.dto;

public class MemberAddress {
	private Member mNo;
	private int mdZipcode;
	private String mdAddress;
	public Member getmNo() {
		return mNo;
	}
	public void setmNo(Member mNo) {
		this.mNo = mNo;
	}
	public int getMdZipcode() {
		return mdZipcode;
	}
	public void setMdZipcode(int mdZipcode) {
		this.mdZipcode = mdZipcode;
	}
	public String getMdAddress() {
		return mdAddress;
	}
	public void setMdAddress(String mdAddress) {
		this.mdAddress = mdAddress;
	}
	public MemberAddress() {
	}
	public MemberAddress(Member mNo, int mdZipcode, String mdAddress) {
		super();
		this.mNo = mNo;
		this.mdZipcode = mdZipcode;
		this.mdAddress = mdAddress;
	}
	@Override
	public String toString() {
		return "MemberAddress [mNo=" + mNo + ", mdZipcode=" + mdZipcode + ", mdAddress=" + mdAddress + "]";
	}
	
	
}
