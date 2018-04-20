package com.dgit.mall.handler.shop.cart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopCartDeleteAllHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sql = null;
			String mno = request.getParameter("clickRemovemNo");
			int mNo = Integer.parseInt(mno);
			
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				dao.deleByAll(mNo);
				Map<String, Object> map = new HashMap<>();
				map.put("result", "ok");
				CommonUtil.getInstance().printMessageByJSON(response, map);
				sql.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
		}
		return null;
	}

}
