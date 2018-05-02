package com.dgit.mall.handler.admin.board;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardaskanswerHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;

		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			try {
				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);
				request.setAttribute("contentPage", "board/Boardaskanswer.jsp");

				request.setAttribute("sub_menu", "list");
				request.setAttribute("menu", "board");
				request.setAttribute("css", "board.css");

				Board readBoard = BoardREAD.selectlistBoardReviewByid(number);

				request.setAttribute("readBoard", readBoard);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return TEMPLATE_PAGE;
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String num = request.getParameter("brdno");
			System.out.println(num);
			int number = Integer.parseInt(num);
			System.out.println(number + "z");
			try {
				String brddepth = request.getParameter("brddepth");
				String brdcode = request.getParameter("brdcode");
				String brdwriter = request.getParameter("brdwriter");
				String brdpassword = request.getParameter("brdpassword");
				String brdtitle = request.getParameter("brdtitle");
				String brdcontent = request.getParameter("brdcontent");
				String brdparent = request.getParameter("brdparent");
				// String brduseattachment
				// =multi.getParameter("brduseattachment");

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				Date now = new Date();
				SimpleDateFormat formatType = new SimpleDateFormat("yyyy-mm-dd");
				formatType.format(now);
				System.out.println(now + "z");
				int lastno = Dao.selectBylastno();
				System.out.println(lastno + "z");

				int lastdep = Dao.selectBybrddepth(number);

				System.out.println(lastdep + "z");
				Board board = new Board(lastno, brdcode, brdtitle, brdwriter, brdpassword, number, lastdep, null,
						brdcontent, 0, now, 0, 0, 0);

				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdtitle", brdtitle);
				request.setAttribute("brdcontent", brdcontent);
				// request.setAttribute("brduseattachment", brduseattachment);

				System.out.println(board);
				Dao.insertBoard(board);

				sqlSession.commit();

				if (board.getBrdcode().equals("ReviewBoard")) {
					response.sendRedirect("list.do");
				} else if (board.getBrdcode().equals("QandABoard")) {
					response.sendRedirect("list.do");
				}

			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return null;
	}
}
