package com.dgit.mall.handler.admin.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardDelHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			String brdwriter = request.getParameter("brdwriter");
			String brdtitle = request.getParameter("brdtitle");
			String brdcontent = request.getParameter("brdcontent");

			request.setAttribute("contentPage", "board/BoardDel.jsp");

			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "board");
			request.setAttribute("css", "board.css");

			request.setAttribute("number", number);
			request.setAttribute("brdwriter", brdwriter);
			return TEMPLATE_PAGE;
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
				if (readBoard.getBrdpassword().equals(pw)) {
					if (readBoard.getBrdcode().equals("ReviewBoard")) {
						BoardREAD.deleteReview(number);
						sqlSession.commit();
						return "ReviewBoard.do";
					} else if (readBoard.getBrdcode().equals("NoticeBoard")) {
						BoardREAD.deleteReview(number);
						sqlSession.commit();
						return "NoticeBoard.do";
					} else {
						BoardREAD.deleteReview(number);
						sqlSession.commit();
						return "QandABoardRead.do";
					}
				} else if (readBoard.getBrdpassword().equals(pw) == false) {
					request.setAttribute("notsamepassword", "비밀번호가 일치하지 않습니다.");
					request.setAttribute("contentPage", "board/boardList.jsp");

					request.setAttribute("sub_menu", "list");
					request.setAttribute("menu", "board");
					request.setAttribute("css", "board.css");
					return TEMPLATE_PAGE;
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