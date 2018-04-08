package com.dgit.mall.handler.admin.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminBaseListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "base/baseList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "base");
		request.setAttribute("css", "base.css");

		return TEMPLATE_PAGE;
	}

}
