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

public class ShopCartUpdatePrdoductCount extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			//갯수 업데이트
			SqlSession sql = null;
			String[] cartNo = request.getParameterValues("cartNo");
			String mno = request.getParameter("memberid");
			String[] count = request.getParameterValues("countNo");
			int mNo = Integer.parseInt(mno);
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				for(int i=0; i<cartNo.length; i++){
					for(int n=0; n<count.length; n++){
						Map<String, Object> map = new HashMap<>();
						map.put("prdCount", count[i]);
						map.put("ctNo", Integer.parseInt(cartNo[i]));
						map.put("no", mNo);
						dao.updateCartPrdCount(map);
						sql.commit();
					}
					Map<String, Object> map = new HashMap<>();
					map.put("rel", "ok");
					CommonUtil.getInstance().printMessageByJSON(response, map);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
		}
		// TODO Auto-generated method stub
		return null;
	}

}
