package com.dgit.mall.handler.shop.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class QandABoardReadHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QandABoardReadHandler"+2);
		String num = request.getParameter("brdno");
		int number = Integer.parseInt(num);

		SqlSession sqlSession = null;
		sqlSession = MySqlSessionFactory.openSession();

		BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

		try {
			// request.setAttribute("contentPage", "board/BoardReview.jsp");
			int ChBoard = BoardREAD.updatecheck(number);
			sqlSession.commit();
			Board readBoard = BoardREAD.selectlistBoardReviewByid(number);
			request.setAttribute("readBoard", readBoard);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return VIEW_FRONT_PATH + "board/BoardQandARead.jsp";
	}
}
