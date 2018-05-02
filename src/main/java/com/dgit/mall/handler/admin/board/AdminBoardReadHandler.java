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

public class AdminBoardReadHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String num = request.getParameter("brdno");
		int number = Integer.parseInt(num);

		SqlSession sqlSession = null;

		try {
			request.setAttribute("contentPage", "board/BoardReview.jsp");

			sqlSession = MySqlSessionFactory.openSession();
			BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

			int ChBoard = BoardREAD.updatecheck(number);
			sqlSession.commit();

			Board readBoard = BoardREAD.selectlistBoardReviewByid(number);
			String brdcode = request.getParameter("brdcode");
			System.out.println(readBoard);
			request.setAttribute("readBoard", readBoard);
			int prdNo = readBoard.getPrdno();
			ProductDao dao = sqlSession.getMapper(ProductDao.class);
			Product pro = dao.SelectProductByno(prdNo);
			request.setAttribute("pro", pro);

			if (readBoard.getBrdcode().equals("ReviewBoard")) {
				return "ReviewBoard.do";
			} else if (readBoard.getBrdcode().equals("QandABoard")) {
				return "BoardQandA.do";
			} else {
				return "NoticeBoard.do";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();

		}
		return null;
	}
}
