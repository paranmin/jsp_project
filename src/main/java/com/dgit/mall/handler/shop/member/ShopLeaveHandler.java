package com.dgit.mall.handler.shop.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopMypageLeaveHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("post")) {
			HttpSession session = request.getSession(false);
			Member auth = (Member) session.getAttribute("auth");

			int res = MemberService.getInstance().leaveMember(auth);
			if (res > 0) {
				session.invalidate();
				Map<String, Object> json = new HashMap<>();
				json.put("msg", "회원탈퇴 되었습니다.");
				json.put("result", "yes");
				CommonUtil.getInstance().printMessageByJSON(response, json);
				return null;
			}
		}
		return null;
	}

}
