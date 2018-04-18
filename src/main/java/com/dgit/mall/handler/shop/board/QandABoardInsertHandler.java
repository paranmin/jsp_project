package com.dgit.mall.handler.shop.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;

public class QandABoardInsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {

			return VIEW_FRONT_PATH + "/board/BoardQandAForm.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {

			return VIEW_FRONT_PATH + "/board/BoardQandA.jsp";

		}
		return null;
	}

}
