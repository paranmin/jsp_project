package com.dgit.mall.handler.admin.member;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.Pagination;

public class AdminMemberListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sPage = request.getParameter("page");
		String where = request.getParameter("where");
		String query = request.getParameter("query");

		int page = 1;
		if (sPage != null && !sPage.isEmpty()) {
			page = Integer.parseInt(sPage);
		}

		int width = 5;	// 페이징 숫자 몇개
		int row = 20;	// 보여질 줄수
		int start = (page - 1) * row;

		String params = "";

		List<Member> list = null;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("offset", row);
		if (query != null && !query.equals("")) {
			if (where.equals("phone")) {
				query = CommonUtil.getInstance().phoneNumberHyphenAdd(query, false);
			}
			map.put("where", where);
			map.put("query", query);

			params = String.format("where=%s&query=%s", where, query);
		}
		int total = MemberService.getInstance().countTotalMemberBySearch(map);
		list = MemberService.getInstance().selectMemberListBySearch(map);
		
		int cnt = (int) Math.ceil((double)total / row);

		String imgUrl = request.getHeader("host") + request.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);
		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "list.do", params);

		request.setAttribute("where", where);
		request.setAttribute("query", query);
		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("memList", list);

		request.setAttribute("contentPage", "member/memberList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "member");
		request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

}
