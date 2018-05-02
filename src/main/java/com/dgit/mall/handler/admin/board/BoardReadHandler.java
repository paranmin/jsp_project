package com.dgit.mall.handler.admin.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardReadHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		SqlSession sqlSession = null;

		try {
			request.setAttribute("contentPage", "board/BoardRead.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "board");
			request.setAttribute("css", "board.css");

			sqlSession = MySqlSessionFactory.openSession();
			BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);

			int ChBoard = BoardREAD.updatecheck(number);
			sqlSession.commit();

			Board readBoard = BoardREAD.selectlistBoardReviewByid(number);
			System.out.println(readBoard);
			request.setAttribute("readBoard", readBoard);
			int prdNo = readBoard.getPrdno();
			ProductDao dao = sqlSession.getMapper(ProductDao.class);
			Product pro = dao.SelectProductByno(prdNo);
			request.setAttribute("pro", pro);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();

		}
		return TEMPLATE_PAGE;
	}
}
