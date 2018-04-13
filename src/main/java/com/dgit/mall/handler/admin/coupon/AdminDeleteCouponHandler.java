package com.dgit.mall.handler.admin.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgit.mall.handler.admin.AdminCommandHandler;

public class AdminDeleteCouponHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			String[] num = request.getParameterValues("checkedCp");
			for(int i=0; i<num.length; i++){
				try {
					
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
		return null;
	}

}
