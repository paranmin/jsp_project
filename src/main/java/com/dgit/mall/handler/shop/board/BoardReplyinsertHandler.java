package com.dgit.mall.handler.shop.board;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardReplyinsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String num = request.getParameter("brdno");
		System.out.println(num);
		int number = Integer.parseInt(num);
		System.out.println(number);
		SqlSession sqlSession = null;

			try {
				String brdcode = request.getParameter("brdcode");
				System.out.println(brdcode+"2");
				String brdwriter = request.getParameter("brdwriter");
				System.out.println(brdwriter+"1");
				String brdpassword = request.getParameter("brdpassword");
				System.out.println(brdpassword);
				String brdtitle = request.getParameter("brdtitle");
				System.out.println(brdtitle);
				String brdcontent = request.getParameter("brdcontent");
				System.out.println(brdcontent);
				String brdparent = request.getParameter("brdparent");
				System.out.println(brdparent);
				// String brduseattachment
				// =multi.getParameter("brduseattachment");

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				Date now = new Date();
				SimpleDateFormat formatType = new SimpleDateFormat("yyyy-mm-dd");
				formatType.format(now);
				int lastno = Dao.selectBylastno();

				Board board = new Board(lastno, brdcode, brdtitle, brdwriter, brdpassword, number, 0, null, brdcontent,
						0, now, 0, 0);
				System.out.println(board);		
				request.setAttribute("brdno", lastno);
				System.out.println(lastno);
				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdcontent", brdcontent);
				// request.setAttribute("brduseattachment", brduseattachment);

				Dao.insertBoardReply(board);
				System.out.println(board);
				sqlSession.commit();

			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		return "ReviewBoardRead.do";

	}
}
