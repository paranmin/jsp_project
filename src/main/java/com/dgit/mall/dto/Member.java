package com.dgit.mall.dto;

import java.util.Date;

public class Member {
	private int no;
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private char serviceAgree;
	private char privacyAgree;
	private char pushEmail;
	private char pushSMS;
	private char pushApp;
	private Address addr;
	private Date regdate;

	public Member() {
	}

	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public Member(int no, String id, String name, String pwd, String email, String phone, Date regdate) {
		this.no = no;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
	}

	public Member(int no, String id, String name, String pwd, String email, String phone, char serviceAgree,
			char privacyAgree, char pushEmail, char pushSMS, char pushApp, Address addr, Date regdate) {
		this.no = no;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.serviceAgree = serviceAgree;
		this.privacyAgree = privacyAgree;
		this.pushEmail = pushEmail;
		this.pushSMS = pushSMS;
		this.pushApp = pushApp;
		this.addr = addr;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getServiceAgree() {
		return serviceAgree;
	}

	public void setServiceAgree(char serviceAgree) {
		this.serviceAgree = serviceAgree;
	}

	public char getPrivacyAgree() {
		return privacyAgree;
	}

	public void setPrivacyAgree(char privacyAgree) {
		this.privacyAgree = privacyAgree;
	}

	public char getPushEmail() {
		return pushEmail;
	}

	public void setPushEmail(char pushEmail) {
		this.pushEmail = pushEmail;
	}

	public char getPushSMS() {
		return pushSMS;
	}

	public void setPushSMS(char pushSMS) {
		this.pushSMS = pushSMS;
	}

	public char getPushApp() {
		return pushApp;
	}

	public void setPushApp(char pushApp) {
		this.pushApp = pushApp;
	}

	public Address getAddr() {
		return addr;
	}

	public void setAddr(Address addr) {
		this.addr = addr;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return String.format(
				"Member [no=%s, id=%s, name=%s, pwd=%s, email=%s, phone=%s, serviceAgree=%s, privacyAgree=%s, pushEmail=%s, pushSMS=%s, pushApp=%s, addr=%s, regdate=%s]",
				no, id, name, pwd, email, phone, serviceAgree, privacyAgree, pushEmail, pushSMS, pushApp, addr,
				regdate);
	}

}
