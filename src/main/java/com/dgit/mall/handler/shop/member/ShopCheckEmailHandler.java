package com.dgit.mall.handler.shop.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopCheckEmailHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");

		HttpSession session = request.getSession(false);
		Member auth = (Member) session.getAttribute("auth");

		if (auth != null) {
			Member my = MemberService.getInstance().selectByFindMember(auth);

			if (my != null && my.getEmail().equalsIgnoreCase(email)) {
				returnResultJSON(response, "현재 사용중인 정보와 동일합니다.", "yes");
				return null;
			}
		}

		int res = MemberService.getInstance().checkDuplEmail(email);
		if (res > 0) {
			returnResultJSON(response, "사용불가합니다.", "no");
			return null;
		}

		returnResultJSON(response, "사용가능합니다.", "yes");
		return null;
	}

	private void returnResultJSON(HttpServletResponse response, String msg, String result) {
		Map<String, Object> json = new HashMap<>();
		json.put("msg", msg);
		json.put("result", result);
		CommonUtil.getInstance().printMessageByJSON(response, json);
	}
}
