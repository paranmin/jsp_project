package com.dgit.mall.handler.shop.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.Pagination;

public class ProductListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cate = req.getParameter("cate");
		String sort = req.getParameter("sort");
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

		List<Product> prolist = null;
		List<Product> bestlist = null;

		Map<String, Object> bestMap = new HashMap<>();
		bestMap.put("offset", item);
		bestMap.put("sort", "rank"); // 팔린거 고정
		bestMap.put("orderby", "desc"); // 팔린거 역순

		Map<String, Object> cateMap = new HashMap<>();
		cateMap.put("start", start);
		cateMap.put("offset", offset);

		if (cate != null && !cate.equals("")) {
			cateMap.put("category", cate);
			bestMap.put("category", cate);
			params = String.format("cate=%s", cate);
		}
		if (sort != null && !sort.equals("")) {
			cateMap.put("sort", sort);
			
			if (!params.equals("")) {
				params = String.format("%s&sort=%s", params, sort);
			} else {
				params = String.format("sort=%s", sort);
			}

			if (sort.equals("high") || sort.equals("rank")) {
				cateMap.put("orderby", "desc");
			}
		}
		// 카테고리별 전체 상품 갯수 (카테고리 없으면 전체 상품 갯수)
		int total = ProductService.getInstance().countTotalProductByCategory(new Product(cate));

		int cnt = (int) Math.ceil((double) total / offset);

		String imgUrl = req.getHeader("host") + req.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);

		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "showList.do", params);

		prolist = ProductService.getInstance().selectProductByPagination(cateMap);
		bestlist = ProductService.getInstance().selectProductByPagination(bestMap);

		req.setAttribute("list", prolist);
		req.setAttribute("best", bestlist);
		req.setAttribute("page", page);
		req.setAttribute("cate", cate);
		req.setAttribute("sort", sort);
		req.setAttribute("total", total);
		req.setAttribute("paging", paging);
		return VIEW_FRONT_PATH + "product/productList.jsp";

	}
}
