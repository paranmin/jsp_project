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
		System.out.println(2);
		String num = request.getParameter("brdno");
		int number = Integer.parseInt(num);

		SqlSession sqlSession = null;
		sqlSession = MySqlSessionFactory.openSession();

		BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

		int ChBoard = BoardREAD.updatecheck(number);

		System.out.println(ChBoard);

		sqlSession.commit();

		try {
			// request.setAttribute("contentPage", "board/BoardReview.jsp");

			Board readBoard = BoardREAD.selectlistBoardReviewByid(number);
			System.out.println(3);
			request.setAttribute("readBoard", readBoard);
			System.out.println(4);
			return VIEW_FRONT_PATH + "board/BoardQandARead.jsp";

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(5);
		} finally {
			System.out.println(6);
			sqlSession.close();
			System.out.println(7);
		}
		System.out.println(8);
		return null;
	}
}
