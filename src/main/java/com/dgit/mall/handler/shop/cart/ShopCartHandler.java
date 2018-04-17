package com.dgit.mall.handler.shop.cart;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;


public class ShopCartHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "product/cartPage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
