package com.dgit.mall.handler.shop.member;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopTermsHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			response.sendRedirect(request.getContextPath() + "/shop/join.do");
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String serviceAgree = request.getParameter("serviceAgree");
			String privacyAgree = request.getParameter("privacyAgree");

			if (serviceAgree == null || serviceAgree.isEmpty() || privacyAgree == null || privacyAgree.isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/shop/join.do");
			} else {
				request.setAttribute("serviceAgree", serviceAgree);
				request.setAttribute("privacyAgree", privacyAgree);
				request.setAttribute("ademail", request.getParameter("ademail"));
				request.setAttribute("adsms", request.getParameter("adsms"));
				request.setAttribute("adpush", request.getParameter("adpush"));
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/shop/member/join.jsp");
				dispatcher.forward(request, response);
			}
		}
		return null;
	}

}
