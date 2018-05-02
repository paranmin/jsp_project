package com.dgit.mall.handler.admin.board;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminBoardNoticeInsertHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;

		if (request.getMethod().equalsIgnoreCase("get")) {
			request.setAttribute("contentPage", "board/BoardNoticeform.jsp");

			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "board");
			request.setAttribute("css", "board.css");

			return TEMPLATE_PAGE;
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String ReviewformPath = request.getRealPath("Reviewform");

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

				String brdcode = multi.getParameter("brdcode");
				String brdwriter = multi.getParameter("brdwriter");
				String brdpassword = multi.getParameter("brdpassword");
				String brdtitle = multi.getParameter("brdtitle");
				String brdcontent = multi.getParameter("brdcontent");
				// String brduseattachment
				// =multi.getParameter("brduseattachment");

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				Date now = new Date();
				Board board = new Board(0, brdcode, brdtitle, brdwriter, brdpassword, 1, 0, null, brdcontent, 0, now, 0,
						0, 0);

				request.setAttribute("brdNo", 0);
				request.setAttribute("brdcode", brdcode);
				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdtitle", brdtitle);
				request.setAttribute("brdcontent", brdcontent);
				// request.setAttribute("brduseattachment", brduseattachment);

				Dao.insertBoard(board);
				sqlSession.commit();
				System.out.println(board);
			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			response.sendRedirect("list.do");
		}
		return null;
	}

}
