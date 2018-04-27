package com.dgit.mall.handler.shop.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardReviewInsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;
		sqlSession = MySqlSessionFactory.openSession();
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");

			String prdNo = request.getParameter("prdno");
			if (prdNo != null && !prdNo.equals("")) {

				int no = Integer.parseInt(prdNo);
				System.out.println(no);
				ProductDao dao = sqlSession.getMapper(ProductDao.class);
				Product pro = dao.SelectProductByno(no);
				request.setAttribute("pro", pro);
			}

			request.setAttribute("loginMember", loginMember);
			return VIEW_FRONT_PATH + "/board/Reviewform.jsp";

		} else if (request.getMethod().equalsIgnoreCase("post")) {

			String ReviewformPath = request.getSession().getServletContext().getRealPath("Reviewform");

			File dir = new File(ReviewformPath);
			if (dir.exists() == false) {
				dir.mkdirs();
			}

			int size = 1024 * 1024 * 10;// 10M

			try {
				MultipartRequest multi = new MultipartRequest(request, // upload할

						// 파일정보
						ReviewformPath, // 서버경로
						size, // 한번에 업로드할 사이즈
						"utf-8", // 한글 파일명 깨짐 방지
						new DefaultFileRenamePolicy());

				String sMemNo = multi.getParameter("memno");
				String sPrdNo = multi.getParameter("prdno");
				String brdcode = multi.getParameter("brdcode");
				String brdwriter = multi.getParameter("brdwriter");
				String brdpassword = multi.getParameter("brdpassword");
				String brdtitle = multi.getParameter("brdtitle");
				String brdcontent = multi.getParameter("brdcontent");
				String selected = multi.getParameter("selected");
				// String brduseattachment
				// =multi.getParameter("brduseattachment");

				int prdNo = 0;
				if (sPrdNo != null && !sPrdNo.equals("")) {
					prdNo = Integer.parseInt(sPrdNo);
				}
				int memNo = 0;
				if (sMemNo != null && !sMemNo.equals("")) {
					memNo = Integer.parseInt(sMemNo);
				}

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				Date now = new Date();
				SimpleDateFormat formatType = new SimpleDateFormat("yyyy-mm-dd");
				formatType.format(now);
				int lastno = Dao.selectBylastno();

				Board board = new Board(lastno, brdcode, brdtitle, brdwriter, brdpassword, lastno, 0, null,
						brdcontent, prdNo, now, 0, 0, memNo);

				Dao.insertBoard(board);
				sqlSession.commit();

			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			response.sendRedirect("ReviewBoard.do");

		}
		return null;
	}
}
