package com.dgit.mall.handler.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.controller.CommandHandler;

public class MainFrontHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/WEB-INF/front/main.jsp";
	}

}
