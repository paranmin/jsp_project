package com.dgit.mall.handler.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminProductAddHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			request.setAttribute("contentPage", "product/productAdd.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");

			return TEMPLATE_PAGE;
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String cate = request.getParameter("cate");
			String name = request.getParameter("name");
			String sub_desc = request.getParameter("sub_desc");
			int cost = Integer.parseInt(request.getParameter("cost"));
			String discount = request.getParameter("discount");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String main = request.getParameter("mainimg");
			String files = request.getParameter("files");
			String option = request.getParameter("option");

			Product pro = new Product();
			pro.setCategory(cate);
			pro.setName(name);
			pro.setSubDesc(sub_desc);
			pro.setCost(cost);
			pro.setDiscountPer(discount);
			pro.setSellingPrice(price);
			pro.setStock(stock);
			pro.setMainImg(main);
			pro.setContent(files);
			pro.setUseOption(option);

			int res = ProductService.getInstance().insertProduct(pro);
			request.setAttribute("contentPage", "product/productList.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");

			return TEMPLATE_PAGE;
		}
		return null;
	}
}
