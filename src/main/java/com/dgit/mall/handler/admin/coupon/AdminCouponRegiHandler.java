package com.dgit.mall.handler.admin.coupon;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminCouponRegiHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")){
			request.setAttribute("contentPage", "coupon/registerCoupon.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "coupon");
			request.setAttribute("css", "coupon.css");
			return TEMPLATE_PAGE;
		}else if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sqlsl = null;
			String num = request.getParameter("couponNo");
			
			String cName = request.getParameter("couponName");
			
			String cp = request.getParameter("MorePrice");
			int cMorePrice = Integer.parseInt(cp);
			
			String csp = request.getParameter("salePrice");
			int cSalePrice = Integer.parseInt(csp);
			
			String day = request.getParameter("dateLimit");
			SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				sqlsl = MySqlSessionFactory.openSession();
				CouponDao dao = sqlsl.getMapper(CouponDao.class);
				Coupon coupon = new Coupon();
				coupon.setNo(num);
				coupon.setName(cName);
				coupon.setCuseMorePrice(cMorePrice);
				coupon.setCsalePrice(cSalePrice);
				coupon.setClimitDate(sdft.parse(day));
				dao.insertCoupon(coupon);
				
				sqlsl.commit();
				response.sendRedirect("list.do");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlsl.close();
			}
		}
		return null;	
	}
}
