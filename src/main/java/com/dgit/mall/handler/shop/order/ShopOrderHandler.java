package com.dgit.mall.handler.shop.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.shop.ShopCommandHandler;


public class ShopOrderHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
		/*	String num = request.getParameter("no");
			int cNo = Integer.getInteger(num);
			request.setAttribute("cNo", cNo);*/
			return VIEW_FRONT_PATH + "order/orderPage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String productPr = request.getParameter("orderChargePrice");//상품가격
			String delfee = request.getParameter("delfee");//배송비
			String useCpPrice = request.getParameter("finalPrice");//총가격
			String payType = request.getParameter("selorderway");//결제타입
			String message = request.getParameter("orderMsg");//주문메세지
			String optionvalue = request.getParameter("optionValue");//옵션유무
			
		}
		return null;
	}

}
