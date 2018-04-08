package com.dgit.mall.handler.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminProductListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "product/productList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "product");
		request.setAttribute("css", "product.css");

		return TEMPLATE_PAGE;
	}

}
