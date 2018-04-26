package com.dgit.mall.handler.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;

public class ShopMainHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> newMap = new HashMap<>();
		newMap.put("offset", 4);
		Map<String, Object> bestMap = new HashMap<>();
		String test = "low";
		/*NEW NAME LOW PRICE HIGH PRICE RANK*/
		bestMap.put("orderbytarget", test);
		if (test.equals("new")) {
			bestMap.remove("orderbytarget");
		} else if (test.equals("name")) {
			bestMap.put("orderby", "asc");
		} else if (test.equals("low")) {
			bestMap.put("orderby", "asc");
		} else if (test.equals("high")) {
			bestMap.put("orderby", "desc");
		} else if (test.equals("rank")) {
			bestMap.put("orderby", "desc");
		}
		bestMap.put("offset", 4);
		List<Product> prolist = ProductService.getInstance().selectProductByPagination(newMap);
		List<Product> bestlist = ProductService.getInstance().selectProductByPagination(bestMap);
		request.setAttribute("list", prolist);
		request.setAttribute("best", bestlist);

		return VIEW_FRONT_PATH + "main.jsp";
	}

}
