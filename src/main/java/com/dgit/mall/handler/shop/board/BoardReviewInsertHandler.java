package com.dgit.mall.handler.shop.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class BoardReviewInsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			
			return VIEW_FRONT_PATH + "/board/Reviewform.jsp";
		}else if (request.getMethod().equalsIgnoreCase("post")) {
			
			
			return VIEW_FRONT_PATH + "/board/BoardReview.jsp";
			
		}
		return null;
	}

}
