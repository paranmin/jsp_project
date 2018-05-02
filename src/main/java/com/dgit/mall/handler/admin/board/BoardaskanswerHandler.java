package com.dgit.mall.handler.admin.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardaskanswerHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;

		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			try {
				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

				Board readBoard = BoardREAD.selectlistBoardReviewByid(number);

				request.setAttribute("readBoard", readBoard);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return VIEW_FRONT_PATH + "/board/Boardaskanswer.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String num = request.getParameter("brdno");
			System.out.println(num);
			int number = Integer.parseInt(num);
			System.out.println(number + "z");
			try {
				String brddepth = request.getParameter("brddepth");
				System.out.println(brddepth + "z");
				String brdcode = request.getParameter("brdcode");
				System.out.println(brdcode + "z");
				String brdwriter = request.getParameter("brdwriter");
				System.out.println(brdwriter + "z");
				String brdpassword = request.getParameter("brdpassword");
				System.out.println(brdpassword + "z");
				String brdtitle = request.getParameter("brdtitle");
				System.out.println(brdtitle + "z");
				String brdcontent = request.getParameter("brdcontent");
				System.out.println(brdcontent + "z");
				String brdparent = request.getParameter("brdparent");
				System.out.println(brdparent + "z");
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
					response.sendRedirect("ReviewBoard.do");
				} else if (board.getBrdcode().equals("QandABoard")) {
					response.sendRedirect("BoardQandA.do");
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
