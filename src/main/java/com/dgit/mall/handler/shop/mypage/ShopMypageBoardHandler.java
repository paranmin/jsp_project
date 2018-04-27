package com.dgit.mall.handler.shop.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.BoardService;

import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;

public class ShopMypageBoardHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");

			int limit = 10;

			Map<String, Object> memPageLimit = new HashMap<>();
			memPageLimit.put("no", loginMember.getNo());
			memPageLimit.put("limit", limit);

			List<Board> boardList = BoardService.getInstance().selectBoardByMember(memPageLimit);

			request.setAttribute("boardList", boardList);
			return VIEW_FRONT_PATH + "mypage/boardList.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
