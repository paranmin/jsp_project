package com.dgit.mall.handler.shop.cuopon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopCouponHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")){
			String pr = request.getParameter("price");
			int price = Integer.parseInt(pr);
			SqlSession se = null;
			try {
				se = MySqlSessionFactory.openSession();
				CouponDao dao = se.getMapper(CouponDao.class);
				List<Coupon> list = dao.selectByAll();
				request.setAttribute("list", list);
				request.setAttribute("price", price);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				se.close();
			}
			return VIEW_FRONT_PATH+"order/coupon.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")){
			return null;
		}
		return null;
	}

}
