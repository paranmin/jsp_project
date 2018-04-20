package com.dgit.mall.handler.shop.cart;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.metal.MetalMenuBarUI;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Product;
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
				if(loginMember==null){
					response.sendRedirect(request.getContextPath()+"/shop/login.do");
					return null;
				}
				Member member = new Member();
				member.setNo(loginMember.getNo());
				cart.setMNo(member);
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
			/*String[] prdNo = request.getParameterValues("chkAll");//상품번호
			String[] prdName = request.getParameterValues("prdName");//상품이름
			String[] prdOptionName = request.getParameterValues("proNamehr"); //상품 옵션
			String[] count = request.getParameterValues("cartnum");//상품 수량
			String[] price = request.getParameterValues("productPrice");//상품 가격
			String[] proImg = request.getParameterValues("proImg");//상품이미지
			System.out.println(proImg[0]);*/
			
			
			//장바구니 테이블 값 넣기
			
		/*	request.setAttribute("prdNo", prdNo);
			request.setAttribute("prdName", prdName);
			request.setAttribute("prdOptionName", prdOptionName);
			request.setAttribute("count", count);
			request.setAttribute("price", price);*/
			
			return VIEW_FRONT_PATH+"order/orderPage.jsp";
		}
		return null;
	}

}
