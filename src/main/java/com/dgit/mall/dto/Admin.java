package com.dgit.mall.dto;

import java.util.Date;

public class Admin {
	private int no;
	private String id;
	private String name;
	private String password;
	private Date regdate;

	public Admin() {
	}

	public Admin(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public Admin(int no, String id, String name, String password, Date regdate) {
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return String.format("AdminMember [no=%s, id=%s, name=%s, password=%s, regdate=%s]", no, id, name, password,
				regdate);
	}

}
