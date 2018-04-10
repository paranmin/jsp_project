package com.dgit.mall.dto;

import java.util.Date;

public class Member {
	private int no;
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return String.format("Member [no=%s, id=%s, name=%s, pwd=%s, email=%s, phone=%s, regdate=%s]", no, id, name,
				pwd, email, phone, regdate);
	}

}
