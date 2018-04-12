package com.dgit.mall.handler.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopFindMemberHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "/member/findMember.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String findType = request.getParameter("findType");
			String findId = request.getParameter("findId");
			String findPwd = request.getParameter("findPwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			if (findType == null || findType.equals("")) {
				request.setAttribute("error_msg", "잘못된 요청입니다.");
				return VIEW_FRONT_PATH + "/member/findMember.jsp";
			}
			
			Member findMember = new Member();
			findMember.setName(name);
			if (findType.equalsIgnoreCase("id")) {
				if (findId.equalsIgnoreCase("phone")) {
					findMember.setPhone(phone);
				} else {
					findMember.setEmail(email);
				}
			} else if (findType.equalsIgnoreCase("pwd")) {
				if (findPwd.equalsIgnoreCase("phone")) {
					findMember.setPhone(phone);
				} else {
					findMember.setEmail(email);
				}
			} else {
				request.setAttribute("error_msg", "잘못된 요청입니다.");
				return VIEW_FRONT_PATH + "/member/findMember.jsp";
			}
			
			Member findedMember = MemberService.getInstance().selectByFindMember(findMember);
			if (findedMember == null) {
				request.setAttribute("error_msg", "내용과 일치하는 회원정보가 없습니다.");
				return VIEW_FRONT_PATH + "/member/findMember.jsp";
			}
			String result = "";
			if (findType.equalsIgnoreCase("pwd")) {
				// 랜덤 비번 생성 후 맴버 업데이트 하기
				CommonUtil.getInstance().sendFindPwdMail(findedMember);
				result =  "비밀번호는 가입시 등록하신 이메일로 보내드렸습니다.";
			}
			request.setAttribute("member", findedMember);
			request.setAttribute("msg", result);
			return VIEW_FRONT_PATH + "/member/findedMember.jsp";
		}
		return null;
	}

}
