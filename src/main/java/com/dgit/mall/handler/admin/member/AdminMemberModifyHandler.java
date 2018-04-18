package com.dgit.mall.handler.admin.member;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.MemberAddress;
import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminMemberModifyHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("no");

		HttpSession session = request.getSession(false);
		if (sNo == null || sNo.equals("")) {
			session.setAttribute("error_msg", "잘못된 호출입니다.\\n회원 번호가 없습니다.");
			response.sendRedirect("list.do");
			return null;
		}
		int no = Integer.parseInt(sNo);

		if (request.getMethod().equalsIgnoreCase("get")) {
			Member member = MemberService.getInstance().selectByMemberNo(no);
			if (member == null) {
				session.setAttribute("error_msg", "존재하지 않는 회원입니다.");
				response.sendRedirect("list.do");
				return null;
			}
			Address memAddr = AddressService.getInstance().selectHomeByMemberNo(member);
			request.setAttribute("member", member);
			request.setAttribute("memberAddr", memAddr);
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}

		request.setAttribute("contentPage", "member/memberModify.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "member");
		request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

}
