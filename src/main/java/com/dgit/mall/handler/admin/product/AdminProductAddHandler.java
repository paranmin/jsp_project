package com.dgit.mall.handler.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Option;
import com.dgit.mall.dto.OptionDetail;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;
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
			SqlSession sqlsession = null;
			String cate = request.getParameter("cate");
			String name = request.getParameter("name");
			String sub_desc = request.getParameter("sub_desc");
			int cost = Integer.parseInt(request.getParameter("cost"));
			String discount = request.getParameter("discount");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String main = request.getParameter("mainimg");
			String[] files = request.getParameterValues("files");
			String option = request.getParameter("use_option");
			try {
				sqlsession = MySqlSessionFactory.openSession();
				ProductDao dao = sqlsession.getMapper(ProductDao.class);
				Product pro = new Product();
				pro.setCategory(cate);
				pro.setName(name);
				pro.setSubDesc(sub_desc);
				pro.setCost(cost);
				pro.setDiscountPer(discount);
				pro.setSellingPrice(price);
				pro.setStock(stock);
				pro.setMainImg(main);
				pro.setUseOption(option);
				dao.insertProduct(pro);

				int prdno = dao.selectLastInsert();

				Proimg img = new Proimg();
				for (int i = 0; i < files.length; i++) {
					if(!files[i].isEmpty()){
						img.setPrdNo(prdno);
						img.setImg(files[i]);
						dao.insertProImg(img);
					}
				}

				if (option.equals("1")) {
					Option opt = new Option();
					OptionDetail det = new OptionDetail();
					String[] opName = request.getParameterValues("op_name");
					String[] opValue = request.getParameterValues("op_desc");
					String[] opCost = request.getParameterValues("op_cost");
					String[] rspan = request.getParameterValues("span");
					int afterspan = 0;
					for (int i = 0; i < opName.length; i++) {
						opt.setPoName(opName[i]);
						opt.setPrdNo(prdno);
						dao.insertOption(opt);
						int pono = dao.selectLastInsertOption();
						int rowspan = Integer.parseInt(rspan[i]);
						for (int n = 0; n < rowspan; n++) {
							if (i > 0) {
								det.setPodCost(opCost[n + afterspan]);
								det.setPodValue(opValue[n + afterspan]);
								det.setPoNo(pono);
								dao.insertOptionDetail(det);
							} else {
								det.setPodCost(opCost[n + afterspan]);
								det.setPodValue(opValue[n + afterspan]);
								det.setPoNo(pono);
								dao.insertOptionDetail(det);
							}
						}
						afterspan += rowspan;
					}
				}
				sqlsession.commit();
				request.setAttribute("contentPage", "product/productAdd.jsp");
				request.setAttribute("sub_menu", "list");
				request.setAttribute("menu", "product");
				request.setAttribute("css", "product.css");
				return TEMPLATE_PAGE;
			} catch (Exception e) {
				e.printStackTrace();
				sqlsession.rollback();
			} finally {
				sqlsession.close();
			}
		}
		return null;
	}
}
