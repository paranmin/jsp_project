package com.dgit.mall.handler.shop.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardModifyCheckPasswordHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String num = request.getParameter("brdno");
			int number = Integer.parseInt(num);
			String brdwriter = request.getParameter("brdwriter");
			String brdtitle = request.getParameter("brdtitle");
			String brdcontent = request.getParameter("brdcontent");
			
			
			request.setAttribute("number", number);
			request.setAttribute("brdwriter", brdwriter);
			return VIEW_FRONT_PATH + "board/BoardModifyCheckpassword.jsp";
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
				if (readBoard.getBrdpassword().equals(pw)) {
					return VIEW_FRONT_PATH + "board/BoardModify.jsp";

				} else {
					int dialogButton2 = JOptionPane.YES_NO_OPTION;
					int dialogResult2  =JOptionPane.showConfirmDialog(null, "비밀번호가 틀립니다 다시 하시겠습니까 ?.", "비번확인창", dialogButton2);
					if(dialogResult2 == 0){
						return VIEW_FRONT_PATH + "board/BoardModifyCheckpassword.jsp";
					}else{
						if(readBoard.getBrdcode().equals("ReviewBoard")){
							return "ReviewBoard.do";
						}else if(readBoard.getBrdcode().equals("NoticeBoard")){
							return "NoticeBoard.do";
						}else{
							return "QandABoardRead.do";
						}
							
						
					}
					
				}

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
