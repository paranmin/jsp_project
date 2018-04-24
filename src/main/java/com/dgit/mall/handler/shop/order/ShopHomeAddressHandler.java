package com.dgit.mall.handler.shop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopHomeAddressHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		Member loginMember = (Member) session.getAttribute("auth");
		Address address = AddressService.getInstance().selectHomeByMemberNo(loginMember);
		System.out.println(address);
		Map<String, Object> map = new HashMap<>();
		map.put("rel", "ok");
		map.put("result", address);
		CommonUtil.getInstance().printMessageByJSON(response, map);
		return null;
	}

}
