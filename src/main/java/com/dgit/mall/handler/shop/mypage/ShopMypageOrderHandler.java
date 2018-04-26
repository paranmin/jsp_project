package com.dgit.mall.handler.shop.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Order;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageOrderHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");

			Map<String, Object> memOrder = new HashMap<>();
			memOrder.put("no", loginMember.getNo());
			List<Order> orderList = OrderService.getInstance().selectOrderByMember(memOrder);

			request.setAttribute("orderList", orderList);
			request.setAttribute("member", loginMember);
			return VIEW_FRONT_PATH + "mypage/orderList.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
