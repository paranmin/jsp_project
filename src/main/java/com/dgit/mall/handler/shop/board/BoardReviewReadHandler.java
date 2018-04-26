package com.dgit.mall.handler.shop.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardReviewReadHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String num = request.getParameter("brdno");
		int number = Integer.parseInt(num);
		SqlSession sqlSession = null;
		/*int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		int pro = dao.allProduct(no);
		System.out.println(pro);
		request.setAttribute("pro", pro);*/

		
		try {
			request.setAttribute("contentPage", "board/BoardReview.jsp");

			sqlSession = MySqlSessionFactory.openSession();
			BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

	
			int ChBoard = BoardREAD.updatecheck(number);
			sqlSession.commit();

			Board readBoard = BoardREAD.selectlistBoardReviewByid(number);
			System.out.println(readBoard);
			request.setAttribute("readBoard", readBoard);

			return VIEW_FRONT_PATH + "board/BoardReviewRead.jsp";

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return null;
	}
}
