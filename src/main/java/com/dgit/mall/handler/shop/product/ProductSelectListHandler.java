package com.dgit.mall.handler.shop.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.Pagination;

public class ProductSelectListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String select = request.getParameter("main_search");
		String sort = request.getParameter("sort");
		String sPage = request.getParameter("page");

		int page = 1;
		if (sPage != null && !sPage.isEmpty()) {
			page = Integer.parseInt(sPage);
		}

		// 상품 리스트는 특이한 경우라 게시판 페이징이랑 조금 다름.
		int item = 4; // 한줄에 아이템 몇개
		int width = 5; // 페이징 숫자 몇개
		int row = 3; // 보여질 줄수
		int offset = row * item;
		int start = (page - 1) * offset;

		String params = "";

		Map<String, Object> selectMap = new HashMap<>();
		selectMap.put("start", start);
		selectMap.put("offset", offset);
		selectMap.put("name", select);
		selectMap.put("view", 1);
		
		params = String.format("main_search=%s", select);
		if (sort != null && !sort.equals("")) {
			selectMap.put("sort", sort);
			if (sort.equals("high") || sort.equals("rank")) {
				selectMap.put("orderby", "desc");
			}
			params = String.format("%s&sort=%s", params, sort);
		}

		Product pro = new Product();
		pro.setName(select);
		pro.setUse(String.valueOf(1));
		int total = ProductService.getInstance().countTotalProductByProduct(pro);
		int cnt = (int) Math.ceil((double) total / offset);

		String imgUrl = request.getHeader("host") + request.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);

		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "showSelectList.do", params);

		List<Product> selectList = ProductService.getInstance().selectProductByPagination(selectMap);

		request.setAttribute("name", select);
		request.setAttribute("list", selectList);
		request.setAttribute("sort", sort);
		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		return VIEW_FRONT_PATH + "product/selectList.jsp";

	}

}
