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

public class AdmidProductDetailHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SqlSession sqlsession = null;
		int no = Integer.parseInt(request.getParameter("no"));
		try{
			sqlsession = MySqlSessionFactory.openSession();
			ProductDao dao = sqlsession.getMapper(ProductDao.class);
			Product pro = dao.SelectProductByno(no);
			List<Proimg> proimg = dao.SelectProimgByno(no);
			List<Option> option = dao.SelectOptionByno(no);
			ArrayList<Integer> rownum = new ArrayList<>();
			ArrayList<OptionDetail> result = new ArrayList<>();
			
			for(int i=0; i<option.size(); i++){
				int num = option.get(i).getPoNo();
				List<OptionDetail> detail = dao.SelectOpDeByno(num);
				result.addAll(detail);
				rownum.add(detail.size());
			}
			System.out.println("last result : "+result);
			
			request.setAttribute("rownum", rownum);
			request.setAttribute("res", result);
			request.setAttribute("opt", option);
			request.setAttribute("proimg", proimg);
			request.setAttribute("pro", pro);
			
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
