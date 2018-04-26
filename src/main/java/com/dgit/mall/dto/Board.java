package com.dgit.mall.dto;

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
	private int selected;
	private int brdch;
	private int memNo;

	public Board() {
	}

	public Board(int brdNo, String brdcode, String brdtitle, String brdwriter, String brdpassword, int brdparent,
			int brddepth, String brduseattachment, String brdcontent, int prdno, Date brdregdate, int selected,
			int brdch, int memNo) {
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
		this.selected = selected;
		this.brdch = brdch;
		this.memNo = memNo;
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

	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public int getBrdch() {
		return brdch;
	}

	public void setBrdch(int brdch) {
		this.brdch = brdch;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return String.format(
				"Board [brdNo=%s, brdcode=%s, brdtitle=%s, brdwriter=%s, brdpassword=%s, brdparent=%s, brddepth=%s, brduseattachment=%s, brdcontent=%s, prdno=%s, brdregdate=%s, selected=%s, brdch=%s, memNo=%s]",
				brdNo, brdcode, brdtitle, brdwriter, brdpassword, brdparent, brddepth, brduseattachment, brdcontent,
				prdno, brdregdate, selected, brdch, memNo);
	}

}
