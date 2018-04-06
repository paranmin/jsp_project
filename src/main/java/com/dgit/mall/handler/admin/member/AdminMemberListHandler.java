package com.dgit.mall.handler.admin.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminMemberListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "member/memberList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "member");
		request.setAttribute("css", "member.css");

		return TEMPLATE_PAGE;
	}

}
