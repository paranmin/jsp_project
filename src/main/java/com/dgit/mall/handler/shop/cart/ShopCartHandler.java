package com.dgit.mall.handler.shop.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			// 갯수 업데이트
			SqlSession sql = null;
			String[] cartNo = request.getParameterValues("chkAll");
			String mno = request.getParameter("buyingMem");
			String[] count = request.getParameterValues("cartnum");
			int mNo = Integer.parseInt(mno);
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				HttpSession session = request.getSession(false);
				for (int i = 0; i < cartNo.length; i++) {
					for (int n = 0; n < count.length; n++) {
						Map<String, Object> map = new HashMap<>();
						map.put("prdCount", count[i]);
						map.put("ctNo", Integer.parseInt(cartNo[i]));
						map.put("no", mNo);
						dao.updateCartPrdCount(map);
						sql.commit();
					}
					session.setAttribute("ctNo", cartNo);
					response.sendRedirect(request.getContextPath() + "/shop/order/order.do");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
		}
		return null;
	}

}
