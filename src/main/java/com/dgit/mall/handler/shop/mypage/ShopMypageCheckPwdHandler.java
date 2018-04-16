package com.dgit.mall.handler.shop.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageCheckPwdHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "mypage/checkPw.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String pwd = request.getParameter("pwd");

			if (pwd == null || pwd.equals("")) {
				request.setAttribute("error_msg", "비밀번호를 입력해주세요.");
				return VIEW_FRONT_PATH + "mypage/checkPw.jsp";
			}
			
			HttpSession session = request.getSession(false);
			Member auth = (Member) session.getAttribute("auth");
			
			Member checkMember = new Member(auth.getId(), pwd);
			checkMember = MemberService.getInstance().selectByLogin(checkMember);
			
			if (checkMember == null) {
				request.setAttribute("error_msg", "해당 회원정보가 존재하지 않습니다.\\n다시 시도해주세요.");
				return VIEW_FRONT_PATH + "mypage/checkPw.jsp";
			}
			session.setAttribute("reCheckPwd", "success");
			response.sendRedirect("myinfo.do");
		}
		return null;
	}

}
