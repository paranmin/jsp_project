package com.dgit.mall.handler.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.CartService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopLoginHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "member/login.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("loginId");
			String pwd = request.getParameter("loginPwd");

			if (id == null || id.isEmpty() || pwd == null || pwd.isEmpty()) {
				response.sendRedirect("login.do");
				return null;
			}

			HttpSession session = request.getSession(false);
			Member loginMember = MemberService.getInstance().selectByLogin(new Member(id, pwd));
			if (loginMember == null) {
				session.setAttribute("error_msg", "회원 ID나 회원 비밀번호가 틀립니다.");
				response.sendRedirect("login.do");
				return null;
			}
			int cntCart = CartService.getInstance().countSelectAllCartByMember(loginMember.getNo());
			session.setAttribute("auth", loginMember);
			session.setAttribute("cntCart", cntCart);
			response.sendRedirect(request.getContextPath() + "/shop/main.do");
		}
		return null;
	}

}
