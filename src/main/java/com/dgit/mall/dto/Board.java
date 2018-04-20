package com.dgit.mall.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	private int brdNo;
	private String brdcode;
	private String brdtitle;
	private String brdwriter;
	private String brdpassword;
	private int brdparent;
	private int brddepth;
	private String brduseattachment;
	private String brdcontent;
	private int prdno;
	private Date brdregdate;
	private String select;
	private int brdch;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int brdNo, String brdcode, String brdtitle, String brdwriter, String brdpassword, int brdparent,
			int brddepth, String brduseattachment, String brdcontent, int prdno, Date brdregdate, String select,
			int brdch) {
		super();
		this.brdNo = brdNo;
		this.brdcode = brdcode;
		this.brdtitle = brdtitle;
		this.brdwriter = brdwriter;
		this.brdpassword = brdpassword;
		this.brdparent = brdparent;
		this.brddepth = brddepth;
		this.brduseattachment = brduseattachment;
		this.brdcontent = brdcontent;
		this.prdno = prdno;
		this.brdregdate = brdregdate;
		this.select = select;
		this.brdch = brdch;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public String getBrdcode() {
		return brdcode;
	}

	public void setBrdcode(String brdcode) {
		this.brdcode = brdcode;
	}

	public String getBrdtitle() {
		return brdtitle;
	}

	public void setBrdtitle(String brdtitle) {
		this.brdtitle = brdtitle;
	}

	public String getBrdwriter() {
		return brdwriter;
	}

	public void setBrdwriter(String brdwriter) {
		this.brdwriter = brdwriter;
	}

	public String getBrdpassword() {
		return brdpassword;
	}

	public void setBrdpassword(String brdpassword) {
		this.brdpassword = brdpassword;
	}

	public int getBrdparent() {
		return brdparent;
	}

	public void setBrdparent(int brdparent) {
		this.brdparent = brdparent;
	}

	public int getBrddepth() {
		return brddepth;
	}

	public void setBrddepth(int brddepth) {
		this.brddepth = brddepth;
	}

	public String getBrduseattachment() {
		return brduseattachment;
	}

	public void setBrduseattachment(String brduseattachment) {
		this.brduseattachment = brduseattachment;
	}

	public String getBrdcontent() {
		return brdcontent;
	}

	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}

	public int getPrdno() {
		return prdno;
	}

	public void setPrdno(int prdno) {
		this.prdno = prdno;
	}

	public Date getBrdregdate() {
		return brdregdate;
	}

	public void setBrdregdate(Date brdregdate) {
		this.brdregdate = brdregdate;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public int getBrdch() {
		return brdch;
	}

	public void setBrdch(int brdch) {
		this.brdch = brdch;
	}

	@Override
	public String toString() {

		return "Board [brdNo=" + brdNo + ", brdcode=" + brdcode + ", brdtitle=" + brdtitle + ", brdwriter=" + brdwriter
				+ ", brdpassword=" + brdpassword + ", brdparent=" + brdparent + ", brddepth=" + brddepth
				+ ", brduseattachment=" + brduseattachment + ", brdcontent=" + brdcontent + ", prdno=" + prdno
				+ ", brdregdate=" + brdregdate + ", select=" + select + ", brdch=" + brdch + "]";
	}

}
