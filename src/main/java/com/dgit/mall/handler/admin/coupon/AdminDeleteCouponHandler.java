package com.dgit.mall.handler.admin.coupon;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminDeleteCouponHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("post")) {
			SqlSession sql = null;
			String[] num = request.getParameterValues("checkedCp");
			try {
				sql = MySqlSessionFactory.openSession();
				CouponDao dao = sql.getMapper(CouponDao.class);
				for (int i = 0; i < num.length; i++) {
					dao.deleteCoupon(num[i]);
					sql.commit();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sql.close();
			}
			Map<String, Object> map = new HashMap<>();
			map.put("result", "ok");
			CommonUtil.getInstance().printMessageByJSON(response, map);
		}
		return null;
	}
}
