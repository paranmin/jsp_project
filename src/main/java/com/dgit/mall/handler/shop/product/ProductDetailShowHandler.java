package com.dgit.mall.handler.shop.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Option;
import com.dgit.mall.dto.OptionDetail;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductDetailShowHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = Integer.parseInt(req.getParameter("no"));
		SqlSession sqlsession = null;
		try{
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			
			Product pro = dao.SelectProductByno(no);
			List<Proimg> proimg = dao.SelectProimgByno(no);
			List<Option> option = dao.SelectOptionByno(no);
			ArrayList<Integer> rownum = new ArrayList<>();
			ArrayList<OptionDetail> result = new ArrayList<>();

			for (int i = 0; i < option.size(); i++) {
				int num = option.get(i).getPoNo();
				List<OptionDetail> detail = dao.SelectOpDeByno(num);
				result.addAll(detail);
				rownum.add(detail.size());
			}
			req.setAttribute("rownum", rownum); 
			req.setAttribute("res", result);			
			req.setAttribute("opt", option);
			req.setAttribute("pro", pro);
			req.setAttribute("img", proimg);
			return VIEW_FRONT_PATH + "product/detailProduct.jsp";
		}finally{
			sqlsession.close();
		}
	}
}
