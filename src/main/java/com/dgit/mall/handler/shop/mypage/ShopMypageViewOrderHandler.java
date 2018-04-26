package com.dgit.mall.handler.shop.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageViewOrderHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String no = request.getParameter("no");

			Order order = OrderService.getInstance().selectOrder(no);
			List<OrderProduct> ordPrdList = OrderService.getInstance().selectOrderProduct(no);

			request.setAttribute("order", order);
			request.setAttribute("ordPrdList", ordPrdList);
			return VIEW_FRONT_PATH + "mypage/viewOrder.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
