package com.dgit.mall.handler.admin.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminOrderViewHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderNo = request.getParameter("no");
		if (request.getMethod().equalsIgnoreCase("get")) {

		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		request.setAttribute("contentPage", "order/orderView.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "order");
		request.setAttribute("useAwesome", "use");
		request.setAttribute("css", "order.css");

		request.setAttribute("no", orderNo);
		return TEMPLATE_PAGE;
	}

}
