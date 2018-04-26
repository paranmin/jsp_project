package com.dgit.mall.handler.shop.cart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dao.service.CartService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopCartDeleteClickHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sql = null;
			String cartNo = request.getParameter("cartNum");
			String mno = request.getParameter("clickRemovemNo");
			int mNo = Integer.parseInt(mno);
			
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				Map<String, Object> map = new HashMap<>();
				map.put("ctNo", Integer.parseInt(cartNo));
				map.put("no", mNo);
				int res = dao.deleteByClickBtn(map);
				sql.commit();
				if (res > 0) {
					HttpSession session = request.getSession(false);
					Member loginMember = (Member) session.getAttribute("auth");
					if (loginMember != null && mNo == loginMember.getNo()) {
						session.removeAttribute("cntCart");
						int cntCart = CartService.getInstance().countSelectAllCartByMember(mNo);
						session.setAttribute("cntCart", cntCart);
					}
				}
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
