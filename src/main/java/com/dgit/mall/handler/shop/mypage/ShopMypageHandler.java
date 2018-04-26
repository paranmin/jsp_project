package com.dgit.mall.handler.shop.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.BoardService;
import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Order;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		Member loginMember = (Member) session.getAttribute("auth");
		Address homeAddr = AddressService.getInstance().selectHomeByMemberNo(loginMember);
		loginMember.setAddr(homeAddr);

		List<Order> orderList = OrderService.getInstance().selectOrderByMember(loginMember);
		List<Board> boardList = BoardService.getInstance().selectBoardByMember(loginMember.getNo());

		request.setAttribute("boardList", boardList);
		request.setAttribute("orderList", orderList);
		request.setAttribute("loginMember", loginMember);
		return VIEW_FRONT_PATH + "mypage/mypage.jsp";
	}

}
