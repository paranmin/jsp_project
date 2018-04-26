package com.dgit.mall.handler.shop.cuopon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.UserCoupon;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopCouponHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")){
			String pr = request.getParameter("price");
			int price = Integer.parseInt(pr);
			
			try (SqlSession se = MySqlSessionFactory.openSession()){
				HttpSession session = request.getSession(false);
				Member loginMember = (Member) session.getAttribute("auth");
				CouponDao dao = se.getMapper(CouponDao.class);
				List<UserCoupon> list = dao.selectByMem(loginMember.getNo());
				request.setAttribute("list", list);
				request.setAttribute("price", price);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return VIEW_FRONT_PATH+"order/coupon.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")){
			return null;
		}
		return null;
	}

}
