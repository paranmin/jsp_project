package com.dgit.mall.handler.admin.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminProductListHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlsession = null;
		if(request.getMethod().equalsIgnoreCase("get")){
			sqlsession=MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			List<Product> listPro = dao.selectAllProduct();
			request.setAttribute("list", listPro);
			request.setAttribute("contentPage", "product/productList.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");

			return TEMPLATE_PAGE;
		}else if(request.getMethod().equalsIgnoreCase("post")){
			String cate = request.getParameter("cate");
			try{
				sqlsession=MySqlSessionFactory.openSession();
				ProductDao dao = sqlsession.getMapper(ProductDao.class);
				List<Product> listPro;
				
				if(cate.equals("All")){
					listPro = dao.selectAllProduct();
				}else{
					Product pro = new Product();
					pro.setCategory(cate);
					listPro = dao.selectCateProduct(pro);
				}
				request.setAttribute("list", listPro);
			}finally{
				sqlsession.close();
			}
			request.setAttribute("contentPage", "product/productList.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");

			return TEMPLATE_PAGE;
		}
		return null;
	}

}
