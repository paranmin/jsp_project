package com.dgit.mall.handler.shop.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;


public class ShopCartHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			SqlSession sql = null;
			
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				HttpSession session = request.getSession(false);
				Member loginMember = (Member) session.getAttribute("auth");
				Cart cart = new Cart();
				Member member = new Member();
				member.setNo(loginMember.getNo());
				cart.setMember(member);
				//System.out.println("[no =======================]"+loginMember.getNo());
				List<Cart> list = dao.selectAllCart(loginMember.getNo()); 
				request.setAttribute("list", list);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
			
			return VIEW_FRONT_PATH + "product/cartPage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {

			String[] ctNo = request.getParameterValues("chkAll");
			for(int i=0; i<ctNo.length; i++){
				System.out.println(ctNo[i]);
			}
			HttpSession session = request.getSession(false);
			//장바구니 테이블 값 넣기
		
			session.setAttribute("ctNo", ctNo);
			response.sendRedirect(request.getContextPath()+"/shop/order/order.do");
			return null;
		}
		return null;
	}

}
