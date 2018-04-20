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

public class BoardModifyHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			SqlSession sqlSession = null;
			
			System.out.println(num);

			System.out.println(number);

			try {
				request.setAttribute("contentPage", "board/BoardReview.jsp");

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
			return VIEW_FRONT_PATH + "board/BoardModify.jsp";

		} else if (request.getMethod().equalsIgnoreCase("post")) {
			Date now = new Date();
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			SqlSession sqlSession = null;
			
			
			System.out.println(num);
			System.out.println(number);

			String brdwriter = request.getParameter("brdwriter");
			String brdpassword = request.getParameter("brdpassword");
			String brdtitle = request.getParameter("brdtitle");
			String brdcontent = request.getParameter("brdcontent");
			//String brduseattachment =multi.getParameter("brduseattachment");
			try {
				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

				Board board = new Board(number,"ReviewBoard",brdtitle,brdwriter, brdpassword,1,0 ,null, brdcontent,0,now,"",0);

				BoardREAD.updateBoardReview(board);
				sqlSession.commit();
				request.setAttribute("brdNo", number);
				request.setAttribute("brdcode", "ReviewBoard");
				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdtitle", brdtitle);
				request.setAttribute("brdcontent", brdcontent);
				//request.setAttribute("brduseattachment", brduseattachment);
				

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return VIEW_FRONT_PATH + "/board/BoardReview.jsp";
	}

}
