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

public class ProductBestListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sPage = req.getParameter("page");

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

		Map<String, Object> bestMap = new HashMap<>();
		bestMap.put("start", start);
		bestMap.put("offset", offset);
		bestMap.put("orderbytarget", "rank");
		bestMap.put("orderby", "desc");

		// 카테고리별 전체 상품 갯수 (카테고리 없으면 전체 상품 갯수)
		int total = ProductService.getInstance().countTotalProductByProduct(new Product());

		int cnt = (int) Math.ceil((double) total / offset);

		String imgUrl = req.getHeader("host") + req.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);

		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "showBestList.do", params);

		List<Product> bestlist = ProductService.getInstance().selectProductByPagination(bestMap);

		req.setAttribute("paging", paging);
		req.setAttribute("best", bestlist);

		return VIEW_FRONT_PATH + "product/BestList.jsp";
	}

}
