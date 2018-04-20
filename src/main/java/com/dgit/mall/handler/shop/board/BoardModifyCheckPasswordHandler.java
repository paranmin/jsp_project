package com.dgit.mall.handler.shop.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardModifyCheckPasswordHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);

			
			
			request.setAttribute("number", number);
			return VIEW_FRONT_PATH + "board/BoardModifyCheckpassword.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			String pw = request.getParameter("brdpassword");
			SqlSession sqlSession = null;

			request.setAttribute("number", number);
			try {
				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

				Board readBoard = BoardREAD.selectCheckPass(number);

				request.setAttribute("readBoard", readBoard);
				System.out.println(readBoard);
				if (readBoard.getBrdpassword().equals(pw)) {
					return VIEW_FRONT_PATH + "board/BoardModify.jsp";

				} else {
					JOptionPane.showConfirmDialog(null, "다시 입력하세요");
					return VIEW_FRONT_PATH + "board/BoardModifyCheckpassword.jsp";
				}

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return null;
	}
}
