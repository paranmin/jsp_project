package com.dgit.mall.handler.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopLogoutHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		Member loginMember = (Member) session.getAttribute("auth");
		if (loginMember != null) {
			session.removeAttribute("cntCart");
			session.removeAttribute("auth");
			session.invalidate();
		}
		
		response.sendRedirect(request.getContextPath()+"/shop/main.do");
		return null;
	}

}
