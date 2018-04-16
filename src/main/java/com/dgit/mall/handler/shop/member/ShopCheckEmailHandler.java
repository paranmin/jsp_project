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

public class ShopMypageCheckEmailHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");

		HttpSession session = request.getSession(false);
		Member auth = (Member) session.getAttribute("auth");
		Member my = MemberService.getInstance().selectByFindMember(auth);

		Map<String, Object> json = new HashMap<>();
		if (my.getEmail().equalsIgnoreCase(email)) {
			json.put("msg", "현재 사용중인 정보와 동일합니다.");
			json.put("result", "yes");
			CommonUtil.getInstance().printMessageByJSON(response, json);
			return null;
		}

		int res = MemberService.getInstance().checkDuplEmail(email);
		if (res > 0) {
			json.put("msg", "사용불가합니다.");
			json.put("result", "no");
			CommonUtil.getInstance().printMessageByJSON(response, json);
			return null;
		}

		json.put("msg", "사용가능합니다.");
		json.put("result", "yes");
		CommonUtil.getInstance().printMessageByJSON(response, json);
		return null;
	}

}
