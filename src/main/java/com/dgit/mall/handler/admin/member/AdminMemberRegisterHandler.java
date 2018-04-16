package com.dgit.mall.handler.admin.member;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminMemberRegisterHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		request.setAttribute("contentPage", "member/memberRegister.jsp");
		request.setAttribute("sub_menu", "register");
		request.setAttribute("menu", "member");
		request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

}
