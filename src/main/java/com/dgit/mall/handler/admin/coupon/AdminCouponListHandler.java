package com.dgit.mall.handler.admin.coupon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminCouponListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contentPage", "coupon/couponList.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "coupon");
		request.setAttribute("css", "coupon.css");
		
		SqlSession sql = null;
		
		try {
			sql = MySqlSessionFactory.openSession();
			CouponDao dao = sql.getMapper(CouponDao.class);
			List<Coupon> list = dao.selectByAll();
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.close();
		}

		return TEMPLATE_PAGE;
	}

}
