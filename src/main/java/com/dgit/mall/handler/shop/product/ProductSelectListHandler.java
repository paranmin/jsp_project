package com.dgit.mall.handler.shop.product;

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

public class ProductSelectListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String select = request.getParameter("main_search");
		String sort = request.getParameter("sort");
			   
		SqlSession session = null;
		try{
			session = MySqlSessionFactory.openSession();
			ProductDao dao = session.getMapper(ProductDao.class);
			
			Map<String, Object> selectMap = new HashMap<>();
			selectMap.put("name", select);
			if (sort != null && !sort.equals("")) {
				selectMap.put("sort", sort);
				if (sort.equals("high") || sort.equals("rank")) {
					selectMap.put("orderby", "desc");
				}
			}
			List<Product> selectList = dao.selectProductByPagination(selectMap);
			Product pro = new Product();
			pro.setName(select);
			int total = dao.selectNameProductCount(pro);
			
			request.setAttribute("name", select);
			request.setAttribute("list", selectList);
			request.setAttribute("sort", sort);
			request.setAttribute("total", total);   
			return VIEW_FRONT_PATH + "product/selectList.jsp";
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return null;
	}

}
