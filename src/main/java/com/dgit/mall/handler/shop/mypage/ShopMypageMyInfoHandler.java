package com.dgit.mall.handler.shop.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageMyInfoHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession(false);
			Member auth = (Member) session.getAttribute("auth");

			Member modifyMember = MemberService.getInstance().selectByMemberNo(auth.getNo());
			Address memberAddr = AddressService.getInstance().selectHomeByMemberNo(modifyMember);
			modifyMember.setAddr(memberAddr);
			request.setAttribute("modifyMember", modifyMember);
			return VIEW_FRONT_PATH + "mypage/myInfo.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
