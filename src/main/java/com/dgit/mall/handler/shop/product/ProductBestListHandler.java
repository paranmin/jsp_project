package com.dgit.mall.handler.shop.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductBestListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlsession = null;
		try {
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			List<Product> bestlist = new ArrayList<>();
			Map<String, Object> bestMap = new HashMap<>();
			bestMap.put("orderbytarget", "prd_selling_count");
			bestMap.put("orderby", "desc");
			bestMap.put("offset", 12);        
			bestlist = dao.selectProductByPagination(bestMap);
			req.setAttribute("best", bestlist);
		

			return VIEW_FRONT_PATH + "product/BestList.jsp";
		} finally {
			sqlsession.close();
		}
	}

}
