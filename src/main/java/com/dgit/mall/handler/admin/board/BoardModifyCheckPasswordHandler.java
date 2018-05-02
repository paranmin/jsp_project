package com.dgit.mall.handler.admin.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardModifyCheckPasswordHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {

			request.setAttribute("contentPage", "board/BoardModifyCheckpassword.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "board");
			request.setAttribute("css", "board.css");

			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			String brdwriter = request.getParameter("brdwriter");
			String brdtitle = request.getParameter("brdtitle");
			String brdcontent = request.getParameter("brdcontent");

			request.setAttribute("number", number);
			request.setAttribute("brdwriter", brdwriter);
			return TEMPLATE_PAGE;
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			String pw = request.getParameter("brdpassword");
			String brdcode = request.getParameter("brdcode");
			SqlSession sqlSession = null;

			request.setAttribute("number", number);
			try {
				sqlSession = MySqlSessionFactory.openSession();
				BoardDao BoardREAD = sqlSession.getMapper(BoardDao.class);
				Board readBoard = BoardREAD.selectCheckPass(number);
				request.setAttribute("brdcode", brdcode);
				request.setAttribute("readBoard", readBoard);
				System.out.println(readBoard);
				if (readBoard.getBrdpassword().equals(pw) == false) {
					request.setAttribute("notsamepassword", "비밀번호가 일치하지 않습니다.");
					request.setAttribute("contentPage", "board/BoardModifyCheckpassword.jsp");
					return TEMPLATE_PAGE;
				}
				response.sendRedirect("BoardModify.do?brdno="+number);
					
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

		}
		return null;
	}
}
