package com.dgit.mall.handler.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdmidProductDetailHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlsession = null;
		int no = Integer.parseInt(request.getParameter("no"));
		try{
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			Product pro = new Product();
			pro.setPrdNo(no);
			Product selPro = dao.SelectProductByno(pro);
			request.setAttribute("pro", selPro);
			
			request.setAttribute("contentPage", "product/productDetail.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");
			return TEMPLATE_PAGE;
		}finally{
			sqlsession.close();
		}
	}
}
