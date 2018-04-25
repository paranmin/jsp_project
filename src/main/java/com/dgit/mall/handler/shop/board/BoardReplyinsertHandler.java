package com.dgit.mall.handler.shop.board;

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

public class BoardReplyinsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String num = request.getParameter("brdno");
		System.out.println(num);
		int number = Integer.parseInt(num);
		System.out.println(number);
		SqlSession sqlSession = null;

		String ReviewformPath = request.getRealPath("Reviewform");

		File dir = new File(ReviewformPath);
		if (dir.exists() == false) {
			dir.mkdirs();

			int size = 1024 * 1024 * 10;// 10M

			try {
				MultipartRequest multi = new MultipartRequest(request, // upload할

						// 파일정보
						ReviewformPath, // 서버경로
						size, // 한번에 업로드할 사이즈
						"utf-8", // 한글 파일명 깨짐 방지
						new DefaultFileRenamePolicy());

				String brdcode = multi.getParameter("brdcode");
				System.out.println(brdcode);
				String brdwriter = multi.getParameter("brdwriter");
				System.out.println(brdwriter);
				String brdpassword = multi.getParameter("brdpassword");
				System.out.println(brdpassword);
				String brdtitle = multi.getParameter("brdtitle");
				System.out.println(brdtitle);
				String brdcontent = multi.getParameter("brdcontent");
				System.out.println(brdcontent);
				String brdparent = multi.getParameter("brdparent");
				System.out.println(brdparent);
				// String brduseattachment
				// =multi.getParameter("brduseattachment");

				sqlSession = MySqlSessionFactory.openSession();
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				Date now = new Date();
				SimpleDateFormat formatType = new SimpleDateFormat("yyyy-mm-dd");
				formatType.format(now);
				int lastno = Dao.selectBylastno();

				Board board = new Board(lastno, brdcode, brdtitle, brdwriter, brdpassword, lastno, 0, null, brdcontent,
						0, now, 0, 0);

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

		}
		return "ReviewBoardRead.do";

	}
}
