package com.dgit.mall.handler.shop.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "mypage/mypage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			
		}
		// TODO Auto-generated method stub
		return null;
	}

}
