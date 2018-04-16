package com.dgit.mall.handler.shop.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopCheckIdHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");

		System.out.println(id);
		if (id == null || id.equals("")) {
			returnResultJSON(response, "아이디를 입력해주세요.", "no");
			return null;
		}

		int res = MemberService.getInstance().checkDuplId(id);
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
