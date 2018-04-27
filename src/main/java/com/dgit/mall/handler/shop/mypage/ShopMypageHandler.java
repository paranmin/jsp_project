package com.dgit.mall.handler.shop.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.BoardService;
import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		Member loginMember = (Member) session.getAttribute("auth");
		Address homeAddr = AddressService.getInstance().selectHomeByMemberNo(loginMember);
		loginMember.setAddr(homeAddr);

		int limit = 3;

		Map<String, Object> memPageLimit = new HashMap<>();
		memPageLimit.put("no", loginMember.getNo());
		memPageLimit.put("limit", limit);
		List<Order> orderList = OrderService.getInstance().selectOrderByMember(memPageLimit);

		int orderTotalPrice = 0;

		List<Map<String, Object>> recentOrder = new ArrayList<>();
		for (Order ord : orderList) {
			orderTotalPrice = orderTotalPrice + ord.getOrdPrice();
			List<OrderProduct> ordProductList = OrderService.getInstance().selectOrderProduct(ord.getOrdNo());

			String ordPrdName = ordProductList.get(0).getPrdNo().getName();
			if (ordProductList.size() > 1) {
				ordPrdName = String.format("%s 외 %d 개", ordPrdName, (ordProductList.size() - 1));
			}
			Map<String, Object> map = new HashMap<>();
			map.put("orderNo", ord.getOrdNo());
			map.put("ordDate", ord.getRegdate());
			map.put("ordPrice", ord.getOrdPrice());
			map.put("ordPrdName", ordPrdName);
			recentOrder.add(map);
		}
		List<Board> boardList = BoardService.getInstance().selectBoardByMember(memPageLimit);

		request.setAttribute("orderTotalPrice", orderTotalPrice);
		request.setAttribute("boardList", boardList);
		request.setAttribute("recentOrder", recentOrder);
		request.setAttribute("loginMember", loginMember);
		return VIEW_FRONT_PATH + "mypage/mypage.jsp";
	}

}
