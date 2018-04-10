package com.dgit.mall.handler.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopLogoutHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/shop/main.do");
		return null;
	}

}
