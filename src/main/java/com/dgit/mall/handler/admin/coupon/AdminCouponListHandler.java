package com.dgit.mall.handler.admin.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminCouponListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "coupon/couponList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "coupon");
		request.setAttribute("css", "coupon.css");

		return TEMPLATE_PAGE;
	}

}
