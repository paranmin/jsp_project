package com.dgit.mall.util;

public class Pagination {
	private static final Pagination instance = new Pagination();

	private String imgUrl;
	public static Pagination getInstance() {
		return instance;
	}

	private Pagination() {
	}

	public void initPagination(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	/*
	 <ul class="pagination">
		<li><a href="#"><img src="${pageContext.request.contextPath}/images/first_btn.gif" alt="처음" title="처음" /></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/images/prev_btn.gif" alt="이전" title="이전" /></a></li>
		<li class="page">1</li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">6</a></li>
		<li><a href="#">7</a></li>
		<li><a href="#">8</a></li>
		<li><a href="#">9</a></li>
		<li><a href="#">10</a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/images/next_btn.gif" alt="다음" title="다음" /></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/images/last_btn.gif" alt="마지막" title="마지막" /></a></li>
	</ul>
	 * */
	public String makePaging(int cnt, int page, int width, int row, String url, String params) {
		if (cnt <= 0) {
			return null;
		}

		if (!params.equals("")) {
			params = "&" + params;
		}
		StringBuilder sb = new StringBuilder();
		sb.append("<ul class=\"pagination\">");

		String prev = "";
		if (page <= 1) {
			prev = String.format("%s?page=%s%s", url, 1, params);
		} else {
			prev = String.format("%s?page=%s%s", url, page - 1, params);
		}
		sb.append(String.format("<li><a href=\"%s\"><img src=\"http://%s/prev_btn.gif\" alt=\"이전\" title=\"이전\" /></a></li>", prev, imgUrl));

		int start = 0;
		int length = width;
		if (page > width) {
			int temp = (int) Math.floor((page-1)/width);
			start = temp * width;
			length = length + (temp * width);
		}

		for (int i = start; i < length; i++) {
			int cur = i + 1;
			if (cnt < cur) {
				break;
			}
			if (cur == page) {
				sb.append(String.format("<li class=\"page\">%s</li>", cur));
			} else {
				sb.append(String.format("<li><a href=\"%s?page=%2$s%3$s\">%2$s</a></li>", url, cur, params));
			}
		}
		String next = "";
		if (page >= cnt) {
			next = String.format("%s?page=%s%s", url, cnt, params);
		} else {
			next = String.format("%s?page=%s%s", url, page + 1, params);
		}
		sb.append(String.format("<li><a href=\"%s\"><img src=\"http://%s/next_btn.gif\" alt=\"다음\" title=\"다음\" /></a></li>", next, imgUrl));

		sb.append("</ul>");
		return sb.toString();
	}
}
