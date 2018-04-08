package com.dgit.mall.handler.admin.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminOrderListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "order/orderList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "order");
		request.setAttribute("css", "order.css");

		return TEMPLATE_PAGE;
	}

}
