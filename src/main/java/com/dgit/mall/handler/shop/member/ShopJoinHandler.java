package com.dgit.mall.handler.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopJoinHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "member/terms.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String chkpassword = request.getParameter("chkpassword");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String chkfourteen = request.getParameter("chkfourteen");
			String serviceAgree = request.getParameter("serviceAgree");
			String privacyAgree = request.getParameter("privacyAgree");
			String ademail = request.getParameter("ademail");
			String adsms = request.getParameter("adsms");
			String adpush = request.getParameter("adpush");
			
			
		}
		return null;
	}

}
