package com.dgit.mall.handler.shop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.AddressDao;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.MySqlSessionFactory;

public class ShopShippingRemoveHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sql = null;
			String[] addrNo = request.getParameterValues("addrNo");
			try {
				sql = MySqlSessionFactory.openSession();
				AddressDao dao = sql.getMapper(AddressDao.class);
				for(int i=0; i<addrNo.length; i++){
					dao.deleteAddressByaddrNo(Integer.parseInt(addrNo[i]));
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
