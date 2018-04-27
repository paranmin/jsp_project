package com.dgit.mall.handler.admin.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminOrderViewHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		if (request.getMethod().equalsIgnoreCase("get")) {

			Order order = OrderService.getInstance().selectOrder(no);
			List<OrderProduct> ordPrdList = OrderService.getInstance().selectOrderProduct(no);

			request.setAttribute("order", order);
			request.setAttribute("ordPrdList", ordPrdList);
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		request.setAttribute("contentPage", "order/orderView.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "order");
		request.setAttribute("useAwesome", "use");
		request.setAttribute("css", "order.css");

		request.setAttribute("no", no);
		return TEMPLATE_PAGE;
	}

}
