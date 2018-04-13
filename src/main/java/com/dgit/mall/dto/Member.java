package com.dgit.mall.dto;

import java.util.Date;

import com.dgit.mall.dto.type.Gender;
import com.dgit.mall.dto.type.PrivacyTerms;
import com.dgit.mall.dto.type.PushApp;
import com.dgit.mall.dto.type.PushEmail;
import com.dgit.mall.dto.type.PushSMS;
import com.dgit.mall.dto.type.ServiceTerms;

public class Member {
	private int no;
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String tel;
	private Gender gender;
	private String birth;
	private ServiceTerms serviceAgree;
	private PrivacyTerms privacyAgree;
	private PushEmail pushEmail;
	private PushSMS pushSMS;
	private PushApp pushApp;
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

	public Member(int no, String id, String name, String pwd, String email, String phone, String tel, Gender gender,
			String birth, ServiceTerms serviceAgree, PrivacyTerms privacyAgree, PushEmail pushEmail, PushSMS pushSMS,
			PushApp pushApp, Address addr, Date regdate) {
		this.no = no;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.gender = gender;
		this.birth = birth;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public ServiceTerms getServiceAgree() {
		return serviceAgree;
	}

	public void setServiceAgree(ServiceTerms serviceAgree) {
		this.serviceAgree = serviceAgree;
	}

	public PrivacyTerms getPrivacyAgree() {
		return privacyAgree;
	}

	public void setPrivacyAgree(PrivacyTerms privacyAgree) {
		this.privacyAgree = privacyAgree;
	}

	public PushEmail getPushEmail() {
		return pushEmail;
	}

	public void setPushEmail(PushEmail pushEmail) {
		this.pushEmail = pushEmail;
	}

	public PushSMS getPushSMS() {
		return pushSMS;
	}

	public void setPushSMS(PushSMS pushSMS) {
		this.pushSMS = pushSMS;
	}

	public PushApp getPushApp() {
		return pushApp;
	}

	public void setPushApp(PushApp pushApp) {
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
				"Member [no=%s, id=%s, name=%s, pwd=%s, email=%s, phone=%s, tel=%s, gender=%s, birth=%s, serviceAgree=%s, privacyAgree=%s, pushEmail=%s, pushSMS=%s, pushApp=%s, addr=%s, regdate=%s]",
				no, id, name, pwd, email, phone, tel, gender, birth, serviceAgree, privacyAgree, pushEmail, pushSMS,
				pushApp, addr, regdate);
	}

}
