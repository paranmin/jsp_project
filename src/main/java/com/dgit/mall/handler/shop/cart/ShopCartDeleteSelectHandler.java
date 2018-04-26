package com.dgit.mall.handler.shop.cart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.CartService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopCartDeleteSelectHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("post")) {

			String[] cartNo = request.getParameterValues("cartNo");
			String mno = request.getParameter("clickRemovemNo");
			int mNo = Integer.parseInt(mno);

			Map<String, Object> map = new HashMap<>();
			map.put("mNo", mNo);
			map.put("ctNo", cartNo);

			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");
			if (mNo == loginMember.getNo()) {
				int res = CartService.getInstance().deleteCartByNo(map);
				if (res > 0) {
					int cntCart = CartService.getInstance().countSelectAllCartByMember(mNo);
					session.setAttribute("cntCart", cntCart);
				}
			}

			map = new HashMap<>();
			map.put("rel", "ok");
			CommonUtil.getInstance().printMessageByJSON(response, map);
		}
		return null;
	}

}
