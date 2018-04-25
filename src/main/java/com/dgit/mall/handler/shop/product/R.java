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

public class R extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse response) throws Exception {
		String cate = req.getParameter("cate");
		String sort = req.getParameter("sort");

		int sortNum = 0;
		SqlSession sqlsession = null;
		try {
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			List<Product> prolist = new ArrayList<>();
			List<Product> bestlist = new ArrayList<>();

			if (cate == null || cate.equals("all")) {
				Map<String, Object> newMap = new HashMap<>();

				if (sort == null) {

				} else if (sort.equals("new")) {
					newMap.put("orderbytarget", "prd_no");
					newMap.put("orderby", "desc");
					sortNum = 1;
				} else if (sort.equals("name")) {
					newMap.put("orderbytarget", "prd_name");
					newMap.put("orderby", "asc");
					sortNum = 2;
				} else if (sort.equals("lowPrice")) {
					newMap.put("orderbytarget", "prd_selling_price");
					newMap.put("orderby", "asc");
					sortNum = 3;
				} else if (sort.equals("highPrice")) {
					newMap.put("orderbytarget", "prd_selling_price");
					newMap.put("orderby", "desc");
					sortNum = 4;
				} else if (sort.equals("rank")) {
					newMap.put("orderbytarget", "prd_selling_count");
					newMap.put("orderby", "desc");
					sortNum = 5;
				}

				newMap.put("offset", 12);
				prolist = dao.selectProductByPagination(newMap);

				Map<String, Object> bestMap = new HashMap<>();
				bestMap.put("orderbytarget", "prd_selling_count");
				bestMap.put("orderby", "desc");
				bestMap.put("offset", 4);
				bestlist = dao.selectProductByPagination(bestMap);

				cate = "all";
				req.setAttribute("list", prolist);
				req.setAttribute("best", bestlist);
			} else {
				Map<String, Object> newMap = new HashMap<>();

				if (sort == null) {

				} else if (sort.equals("new")) {
					newMap.put("orderbytarget", "prd_no");
					newMap.put("orderby", "desc");
					sortNum = 1;
				} else if (sort.equals("name")) {
					newMap.put("orderbytarget", "prd_name");
					newMap.put("orderby", "asc");
					sortNum = 2;
				} else if (sort.equals("lowPrice")) {
					newMap.put("orderbytarget", "prd_selling_price");
					newMap.put("orderby", "asc");
					sortNum = 3;
				} else if (sort.equals("highPrice")) {
					newMap.put("orderbytarget", "prd_selling_price");
					newMap.put("orderby", "desc");
					sortNum = 4;
				} else if (sort.equals("rank")) {
					newMap.put("orderbytarget", "prd_selling_count");
					newMap.put("orderby", "desc");
					sortNum = 5;
				}
				newMap.put("offset", 12);
				newMap.put("category", cate);
				prolist = dao.selectProductByPagination(newMap);

				Map<String, Object> bestMap = new HashMap<>();
				bestMap.put("offset", 4);
				bestMap.put("category", cate);
				bestlist = dao.selectProductByPagination(bestMap);

				req.setAttribute("list", prolist);
				req.setAttribute("best", bestlist);
			}
			req.setAttribute("sortNum", sortNum);
			req.setAttribute("cate", cate);
			return VIEW_FRONT_PATH + "product/productList.jsp";
		} finally {
			sqlsession.close();

			return null;
		}
	}
}
