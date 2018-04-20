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

public class ShopCartDeleteSelectHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sql = null;
			String[] cartNo = request.getParameterValues("cartNo");
			String mno = request.getParameter("clickRemovemNo");
			int mNo = Integer.parseInt(mno);
			
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				for(int i=0; i<cartNo.length; i++){
					Map<String, Object> map = new HashMap<>();
					map.put("ctNo", Integer.parseInt(cartNo[i]));
					map.put("no", mNo);
					dao.deleteByClickBtn(map);
					sql.commit();
				}
				Map<String, Object> map = new HashMap<>();
				map.put("rel", "ok");
				CommonUtil.getInstance().printMessageByJSON(response, map);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
		}
		return null;
	}

}
