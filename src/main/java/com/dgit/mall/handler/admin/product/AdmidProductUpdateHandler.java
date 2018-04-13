package com.dgit.mall.handler.admin.product;

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
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdmidProductUpdateHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			SqlSession sqlsession = null;
			int no = Integer.parseInt(request.getParameter("no"));
			try {
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
				request.setAttribute("rownum", rownum);
				request.setAttribute("res", result);
				request.setAttribute("opt", option);
				request.setAttribute("proimg", proimg);
				request.setAttribute("pro", pro);

				request.setAttribute("contentPage", "product/productUpdate.jsp");
				request.setAttribute("sub_menu", "list");
				request.setAttribute("menu", "product");
				request.setAttribute("css", "product.css");

				return TEMPLATE_PAGE;
			} finally {
				sqlsession.close();
			}
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			int view = Integer.parseInt(request.getParameter("view"));
			String cate = request.getParameter("cate");
			String name = request.getParameter("name");
			String desc = request.getParameter("desc");
			int cost = Integer.parseInt(request.getParameter("cost"));
			String discount = request.getParameter("discount");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String useOption = request.getParameter("use_option");
			
			
			
			request.setAttribute("contentPage", "product/productUpdate.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "product");
			request.setAttribute("css", "product.css");
			return TEMPLATE_PAGE;
		}
		return null;
	}

}
