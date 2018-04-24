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

public class ProductSaleListHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlsession = null;
		try {
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			List<Product> salelist = new ArrayList<>();
			salelist = dao.selectSaleProduct();
			request.setAttribute("sale", salelist);

			return VIEW_FRONT_PATH + "product/saleList.jsp";
		} finally {
			sqlsession.close();
		}
	}

}
