package com.dgit.mall.handler.shop.board;

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
		try {
			request.setAttribute("contentPage", "board/BoardReview.jsp");

			sqlSession = MySqlSessionFactory.openSession();
			BoardDao Dao = sqlSession.getMapper(BoardDao.class);

			List<Board> list = Dao.selectByAllReviewBoard();
			request.setAttribute("list", list);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return VIEW_FRONT_PATH + "board/BoardReview.jsp";

	}
}
