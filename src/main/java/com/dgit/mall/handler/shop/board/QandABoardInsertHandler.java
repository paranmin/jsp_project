package com.dgit.mall.handler.shop.board;

import java.io.File;
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

public class QandABoardInsertHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equalsIgnoreCase("get")) {

			return VIEW_FRONT_PATH + "/board/BoardQandAForm.jsp";
			
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("i1");
			SqlSession sqlSession = null;
			String ReviewformPath = request.getRealPath("Reviewform");
			System.out.println("i2");
			File dir = new File(ReviewformPath);
			if (dir.exists() == false) {
				dir.mkdirs();
			}

			int size = 1024 * 1024 * 10;// 10M

			try {
				System.out.println("i3");
				MultipartRequest multi = new MultipartRequest(request, // upload할

						// 파일정보
						ReviewformPath, // 서버경로
						size, // 한번에 업로드할 사이즈
						"utf-8", // 한글 파일명 깨짐 방지
						new DefaultFileRenamePolicy());
				String select = multi.getParameter("selected");
				System.out.println("i4");

				int selected = 0;

				String brdcode = multi.getParameter("brdcode");
				System.out.println("i5");
				String brdwriter = multi.getParameter("brdwriter");
				System.out.println("i6");
				String brdpassword = multi.getParameter("brdpassword");
				System.out.println("i7");
				String brdtitle = multi.getParameter("brdtitle");
				System.out.println("i8");
				String brdcontent = multi.getParameter("brdcontent");
				System.out.println("i9");
				// String brduseattachment
				// =multi.getParameter("brduseattachment");
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
				sqlSession = MySqlSessionFactory.openSession();
				System.out.println("i10");
				BoardDao Dao = sqlSession.getMapper(BoardDao.class);
				System.out.println("i11");
				Date now = new Date();
				Board board = new Board(0, brdcode, brdtitle, brdwriter, brdpassword, 1, 0, null, brdcontent, 0, now,
						selected, 0);

				request.setAttribute("brdNo", 0);
				request.setAttribute("brdcode", brdcode);
				request.setAttribute("brdwriter", brdwriter);
				request.setAttribute("brdpassword", brdpassword);
				request.setAttribute("brdtitle", brdtitle);
				request.setAttribute("brdcontent", brdcontent);
				request.setAttribute("selected", selected);
				System.out.println("i12");
				// request.setAttribute("brduseattachment", brduseattachment);
				Dao.insertBoard(board);
				System.out.println("i13");
				sqlSession.commit();
				System.out.println("i14");
			
			} catch (Exception e) {
				sqlSession.rollback();
				e.printStackTrace();
				System.out.println("i15");
		
			} finally {
				System.out.println("i16");
				sqlSession.close();

			}
			System.out.println("i7");
			return "BoardQandA.do";

		}
		return null;
	}

}
