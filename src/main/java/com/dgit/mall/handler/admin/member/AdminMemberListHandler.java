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

public class AdminMemberListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String where = request.getParameter("where");
			String query = request.getParameter("search_query");

			List<Member> list = null;
			if (query != null && !query.equals("")) {
				Map<String, String> map = new HashMap<>();
				map.put("where", where);
				map.put("query", query);
				list = MemberService.getInstance().selectMemberListBySearch(map);
			} else {
				list = MemberService.getInstance().selectMemberList();
			}

			request.setAttribute("where", where);
			request.setAttribute("query", query);
			request.setAttribute("memList", list);
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		request.setAttribute("contentPage", "member/memberList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "member");
		request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

}
