package com.dgit.mall.handler.admin;

import com.dgit.mall.controller.CommandHandler;

public abstract class AdminCommandHandler implements CommandHandler {
	protected static String TEMPLATE_PAGE = "/WEB-INF/manager/template.jsp";
	protected static String NOTICEBOARD_PAGE = "/WEB-INF/manager/BoardNotice.jsp";
	protected static String BOARDQANDA_PAGE = "/WEB-INF/manager/BoardQandA.jsp";
	protected static String BOARDREVIEW_PAGE = "/WEB-INF/manager/BoardReview.jsp";
}
