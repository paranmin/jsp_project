package com.dgit.mall.handler.admin.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;


public class AdminBoardListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "board/boardList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "board");
		request.setAttribute("css", "board.css");

		return TEMPLATE_PAGE;
	}

}
