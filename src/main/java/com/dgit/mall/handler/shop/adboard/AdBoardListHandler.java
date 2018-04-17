package com.dgit.mall.handler.shop.adboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.AdBoardDao;
import com.dgit.mall.dto.AdBoard;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdBoardListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlSession = null;
		
		request.setAttribute("contentPage", "board/BoardNotice.jsp");
		request.setAttribute("sub_menu", "list");

		sqlSession = MySqlSessionFactory.openSession();
		AdBoardDao Dao = sqlSession.getMapper(AdBoardDao.class);

		List<AdBoard> list = Dao.selectByAllAdBoard();
		request.setAttribute("list", list);


		return VIEW_FRONT_PATH + "board/BoardNotice.jsp";
	}

}
