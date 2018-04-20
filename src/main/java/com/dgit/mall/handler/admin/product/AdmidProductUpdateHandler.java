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
			int no = Integer.parseInt(request.getParameter("no"));
			String view = request.getParameter("view");
			String cate = request.getParameter("cate");
			String name = request.getParameter("name");
			String desc = request.getParameter("desc");
			int cost = Integer.parseInt(request.getParameter("cost"));
			String discount = request.getParameter("discount");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String option = request.getParameter("use_option");
			String mainImg = request.getParameter("mainimg");
			String deleteDetailImage = request.getParameter("deleteDetailImage");
			String deleteImage[] = deleteDetailImage.split(",");
			String[] files = request.getParameterValues("files");
			
			SqlSession sqlsession = null;
			try{
				sqlsession = MySqlSessionFactory.openSession();
				ProductDao dao = sqlsession.getMapper(ProductDao.class);
				Product pro = new Product();
				pro.setPrdNo(no);
				pro.setCategory(cate);
				pro.setUse(view);
				pro.setName(name);
				pro.setSubDesc(desc);
				pro.setCost(cost);
				pro.setDiscountPer(discount);
				pro.setSellingPrice(price);
				pro.setStock(stock);
				pro.setUseOption(option);
				Product selectPro = dao.SelectProductByno(no);
				if(!mainImg.isEmpty()){
					pro.setMainImg(mainImg);
				}else{
					pro.setMainImg(selectPro.getMainImg());
				}
				
				dao.updateProduct(pro);
				
				Proimg proimg = new Proimg();
				for(int i=0; i<deleteImage.length; i++){
					proimg.setPrdNo(no);
					proimg.setImg(deleteImage[i]);
					dao.deleteProimg(proimg);
				}
			
				for (int i = 0; i < files.length; i++) {
					if(!files[i].isEmpty()){
						proimg.setPrdNo(no);
						proimg.setImg(files[i]);
						dao.insertProImg(proimg);
					}	
				}
				
				if (option.equals("1")) {
					List<Option> selectOpt = dao.SelectOptionByno(no);
					
					for(int i=0; i<selectOpt.size(); i++){
						dao.deleteOptionDetail(selectOpt.get(i).getPoNo());
					}
					dao.deleteOption(no);
					
					Option opt = new Option();
					OptionDetail det = new OptionDetail();
					String[] opName = request.getParameterValues("op_name");
					String[] opValue = request.getParameterValues("op_desc");
					String[] opCost = request.getParameterValues("op_cost");
					String[] rspan = request.getParameterValues("span");
					int afterspan = 0;
					for (int i = 0; i < opName.length; i++) {
						opt.setPoName(opName[i]);
						opt.setPrdNo(no);
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
				response.sendRedirect("/jsp_project/manager/product/list.do");
				
			}finally{
				sqlsession.close();
			}			
		}
		return null;
	}

}
