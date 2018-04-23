package com.dgit.mall.handler.shop.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class QandABoardListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;
		try {
			request.setAttribute("contentPage", "board/BoardQandA.jsp");
			System.out.println("l1");
			sqlSession = MySqlSessionFactory.openSession();
			BoardDao Dao = sqlSession.getMapper(BoardDao.class);
			System.out.println("l2");
			List<Board> list = Dao.selectByAllQandABoard();
			System.out.println("l3");
			request.setAttribute("list", list);
			System.out.println("l4");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("l5");
			e.printStackTrace();
			
		} finally {
			sqlSession.close();
			System.out.println("l6");
		}
		return VIEW_FRONT_PATH + "board/BoardQandA.jsp";
	}

}
