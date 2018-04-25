package com.dgit.mall.handler.admin.product;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.admin.AdminCommandHandler;

import com.dgit.mall.util.Pagination;

public class AdminProductListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sPage = request.getParameter("page");
		String cate = request.getParameter("cate");
		String name = request.getParameter("selectName");
		String sView = request.getParameter("view");

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

		String pagingCate = null;
		if (cate != null && !cate.equals("All") && !cate.equals("")) {
			map.put("category", cate);
			params = makeParams(params, "category", cate);
			pagingCate = cate;
		}
		if (name != null && !name.equals("")) {
			map.put("name", name);
			params = makeParams(params, "name", name);
		}
		if (sView != null && !sView.equals("2")) {
			map.put("view", sView);
			params = makeParams(params, "view", sView);
		}

		int total = ProductService.getInstance().countTotalProductByProduct(new Product(pagingCate));
		List<Product> listPro = ProductService.getInstance().selectProductByPagination(map);

		int cnt = (int) Math.ceil((double)total / row);

		String imgUrl = request.getHeader("host") + request.getContextPath() + "/images";
		Pagination.getInstance().initPagination(imgUrl);
		String paging = Pagination.getInstance().makePaging(cnt, page, width, row, "list.do", params);

		request.setAttribute("name", name);
		request.setAttribute("cate", cate);
		request.setAttribute("view", sView);
		request.setAttribute("total", total);
		request.setAttribute("list", listPro);
		request.setAttribute("paging", paging);

		request.setAttribute("contentPage", "product/productList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "product");
		request.setAttribute("css", String.format("%s?v=%s", "productlist.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

	private String makeParams(String params, String key, String value) {
		if (!params.equals("")) {
			params +=  "&";
		}
		return String.format("%s%s=%s", params, key, value);
	}

}
