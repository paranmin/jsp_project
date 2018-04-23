package com.dgit.mall.handler.shop.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cate = req.getParameter("cate");
		SqlSession sqlsession = null;
		try {
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			List<Product> prolist = new ArrayList<>();
			List<Product> bestlist = new ArrayList<>();

			if (cate == null) {
				prolist = dao.selectAllProduct();
				bestlist = dao.selectBestAllProduct();
				req.setAttribute("list", prolist);
				req.setAttribute("best", bestlist);
			} else {
				Product product = new Product();
				product.setCategory(cate);
				prolist = dao.selectCateProduct(product);
				bestlist = dao.selectBestCateProduct(cate);
				req.setAttribute("list", prolist);
				req.setAttribute("best", bestlist);
			}

			req.setAttribute("cate", cate);
			return VIEW_FRONT_PATH + "product/productList.jsp";
		} finally {
			sqlsession.close();
		}
	}
}
