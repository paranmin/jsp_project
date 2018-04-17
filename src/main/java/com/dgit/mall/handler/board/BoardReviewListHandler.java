package com.dgit.mall.handler.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardReviewListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;

		request.setAttribute("contentPage", "board/BoardReview.jsp");
		request.setAttribute("sub_menu", "list");

		sqlSession = MySqlSessionFactory.openSession();
		BoardDao Dao = sqlSession.getMapper(BoardDao.class);

		List<Board> list = Dao.selectByAllQandABoard();
		request.setAttribute("list", list);

		return VIEW_FRONT_PATH + "board/BoardReview.jsp";
	}

}
