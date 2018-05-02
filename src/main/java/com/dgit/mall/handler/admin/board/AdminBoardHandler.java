package com.dgit.mall.handler.admin.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminBoardHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;
		try {
			request.setAttribute("contentPage", "board/BoardNotice.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "board");
			request.setAttribute("css", "board.css");

			sqlSession = MySqlSessionFactory.openSession();
			BoardDao Dao = sqlSession.getMapper(BoardDao.class);
			String brdcode = request.getParameter("brdcode");
			
			if (brdcode.equals("NoticeBoard")) {
				List<Board> list = Dao.selectNoticeBoardAll();
				request.setAttribute("list", list);
			} else if (brdcode.equals("QandABoard")) {
				List<Board> list = Dao.selectByAllQandABoard();
				request.setAttribute("list", list);
			} else {
				List<Board> list = Dao.selectByAllReviewBoard();
				request.setAttribute("list", list);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return TEMPLATE_PAGE;
	}

}
