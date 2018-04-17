package com.dgit.mall.dto;

import java.util.Date;

public class Board {
	private int brdNo;
	private String brdcode;
	private String brdtitle;
	private String brdparent;
	private String brddepth;
	private String brduseattachment;
	private String brdcontent;
	private int prdno;
	private Date brdregdate;
	private String select;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int brdNo, String brdcode, String brdtitle, String brdparent, String brddepth, String brduseattachment,
			String brdcontent, int prdno, Date brdregdate) {
		super();
		this.brdNo = brdNo;
		this.brdcode = brdcode;
		this.brdtitle = brdtitle;
		this.brdparent = brdparent;
		this.brddepth = brddepth;
		this.brduseattachment = brduseattachment;
		this.brdcontent = brdcontent;
		this.prdno = prdno;
		this.brdregdate = brdregdate;
	}

	@Override
	public String toString() {
		return "Board [brdNo=" + brdNo + ", brdcode=" + brdcode + ", brdtitle=" + brdtitle + ", brdparent=" + brdparent
				+ ", brddepth=" + brddepth + ", brduseattachment=" + brduseattachment + ", brdcontent=" + brdcontent
				+ ", prdno=" + prdno + ", brdregdate=" + brdregdate + "]";
	}

}
