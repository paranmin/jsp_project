package com.dgit.mall.handler.shop.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopShippingListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")){
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");
			
			List<Address> list = AddressService.getInstance().selectByMemberNo(loginMember);
			
			request.setAttribute("list", list);
			return VIEW_FRONT_PATH+"/order/ShippingList.jsp";
		}
		return null;
	}

}
