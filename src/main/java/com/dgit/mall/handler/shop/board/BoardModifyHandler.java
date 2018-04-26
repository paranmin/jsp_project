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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			SqlSession sqlSession = null;

			try {
				request.setAttribute("contentPage", "board/BoardModify.jsp");

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
			String ReviewformPath = request.getRealPath("Reviewform");
			Date now = new Date();

			SqlSession sqlSession = null;
			int size = 1024 * 1024 * 10;// 10M

			MultipartRequest multi = new MultipartRequest(request, // upload할

					// 파일정보
					ReviewformPath, // 서버경로
					size, // 한번에 업로드할 사이즈
					"utf-8", // 한글 파일명 깨짐 방지
					new DefaultFileRenamePolicy());
			String select = multi.getParameter("selected");
			int selected = 0;
			String brdcode = multi.getParameter("brdcode");
			String brdwriter = multi.getParameter("brdwriter");
			String brdpassword = multi.getParameter("brdpassword");
			String brdtitle = multi.getParameter("brdtitle");
			String brdcontent = multi.getParameter("brdcontent");
			String num = multi.getParameter("brdNo");
			int number = Integer.parseInt(num);
			// String brduseattachment =multi.getParameter("brduseattachment");

			System.out.println(number);

			try {

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);

				Board board = new Board(number, brdcode, brdtitle, brdwriter, brdpassword, 1, 0, null, brdcontent, 0,
						now, selected, 0, 0);

				int readBoard = BoardREAD.updateBoardReview(board);

				if (select.equals("선택")) {
					selected = 0;
				} else if (select.equals("상품")) {
					selected = 1;
				} else if (select.equals("배송")) {
					selected = 2;
				} else if (select.equals("교환/반품")) {
					selected = 3;
				} else if (select.equals("입금")) {
					selected = 4;
				} else if (select.equals("재입고")) {
					selected = 5;
				} else if (select.equals("기타")) {
					selected = 6;
				}

				sqlSession.commit();
				request.setAttribute("brdno", number);
				request.setAttribute("brdcode", brdcode);
				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdtitle", brdtitle);
				request.setAttribute("brdcontent", brdcontent);
				request.setAttribute("brdcontent", brdcontent);
				request.setAttribute("selected",selected);
				// request.setAttribute("brduseattachment", brduseattachment);

				if (board.getBrdcode().equals("ReviewBoard")) {
					return "ReviewBoard.do";
				} else if (board.getBrdcode().equals("QandABoard")) {
					return "BoardQandA.do";
				} else {
					return "NoticeBoard.do";
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return null;

	}

}
