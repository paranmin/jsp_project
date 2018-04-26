package com.dgit.mall.handler.shop.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.OrderDao;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopOrderCompleteHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sql = null;
		String orderNum = request.getParameter("ordernum");
		try {
			sql = MySqlSessionFactory.openSession();
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");
			Member mem = MemberService.getInstance().selectByMemberNo(loginMember.getNo());
			OrderDao dao = sql.getMapper(OrderDao.class);
			Order ord = dao.selectOrder(orderNum);
			List<OrderProduct> ordpd = dao.selectOrderProduct(orderNum);
			System.out.println(ord);
			request.setAttribute("member", mem);
			request.setAttribute("order", ord);
			request.setAttribute("ordpdlist", ordpd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return VIEW_FRONT_PATH + "order/orderComplete.jsp";
	}

}
