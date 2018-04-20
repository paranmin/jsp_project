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

public class ShopLeaveHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("post")) {
			String type = request.getParameter("type");

			int res = 0;
			if (type != null && type.equals("shop")) {
				HttpSession session = request.getSession(false);
				Member auth = (Member) session.getAttribute("auth");

				res = MemberService.getInstance().leaveMember(auth.getNo());
				if (res > 0) {
					session.invalidate();
				}
			} else if (type != null && type.equals("admin")) {
				String sNo = request.getParameter("no");
				int no = Integer.parseInt(sNo);
				res = MemberService.getInstance().leaveMember(no);
			}

			if (res > 0) {
				returnJSONLeaveResult(response, "회원탈퇴 되었습니다.", "yes");
			} else {
				returnJSONLeaveResult(response, "회원탈퇴 되지 않았습니다.", "no");
			}
		}
		return null;
	}

	private void returnJSONLeaveResult(HttpServletResponse response, String msg, String result) {
		Map<String, Object> json = new HashMap<>();
		json.put("msg", msg);
		json.put("result", result);
		CommonUtil.getInstance().printMessageByJSON(response, json);
	}
}
