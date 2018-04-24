package com.dgit.mall.handler.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;

public class ShopMainHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Product> prolist = ProductService.getInstance().selectAllProduct();
		List<Product> bestlist = ProductService.getInstance().selectBestAllProduct();
		request.setAttribute("list", prolist);
		request.setAttribute("best", bestlist);

		return VIEW_FRONT_PATH + "main.jsp";
	}

}
