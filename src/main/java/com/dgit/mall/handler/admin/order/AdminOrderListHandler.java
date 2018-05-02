package com.dgit.mall.handler.admin.order;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.OrderService;

import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.Pagination;

public class AdminOrderListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sPage = request.getParameter("page");
		String where = request.getParameter("where");
		String query = request.getParameter("query");

		int page = 1;
		if (sPage != null && !sPage.isEmpty()) {
			page = Integer.parseInt(sPage);
		}

		int width = 5;	// 페이징 숫자 몇개
		int row = 20;	// 보여질 줄수
		int start = (page - 1) * row;

		String params = "";

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("offset", row);
		if (query != null && !query.equals("")) {
			if (where.equals("orderPhone") || where.equals("receiverPhone")) {
				query = CommonUtil.getInstance().phoneNumberHyphenAdd(query, false);
			}
			map.put("where", where);
			map.put("query", query);

			params = String.format("where=%s&query=%s", where, query);
		}
		int total = OrderService.getInstance().countTotalOrderBySearch(map);
		List<Order> list = OrderService.getInstance().selectOrderListBySearch(map);
		Map<String, Object> ordProductMap = new HashMap<>();
		for (Order ord : list) {
			List<OrderProduct> ordProductList = OrderService.getInstance().selectOrderProduct(ord.getOrdNo());

			String ordPrdName = ordProductList.get(0).getPrdNo().getName();
			if (ordProductList.size() > 1) {
				ordPrdName = String.format("%s 외 %d 개", ordPrdName, (ordProductList.size() - 1));
			}
			ordProductMap.put(ord.getOrdNo(), ordPrdName);
		}
		
		int cnt = (int) Math.ceil((double)total / row);

		String imgUrl = request.getHeader("host") + request.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);
		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "list.do", params);


		request.setAttribute("where", where);
		request.setAttribute("query", query);
		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("orderList", list);
		request.setAttribute("orderProduct", ordProductMap);

		request.setAttribute("contentPage", "order/orderList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "order");
		request.setAttribute("useAwesome", "use");
		request.setAttribute("css", "order.css");

		return TEMPLATE_PAGE;
	}

}
