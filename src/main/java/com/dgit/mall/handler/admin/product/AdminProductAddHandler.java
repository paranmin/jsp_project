package com.dgit.mall.handler.admin.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			String uploadPath = request.getRealPath("upload");
			System.out.println("uploadPath = "+ uploadPath);
			
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdirs();
			}
			int size = 1024*1024*10; //10Mbyte
			
			
			SqlSession sqlsession = null;
			
			try {
				MultipartRequest multi = 
						new MultipartRequest(request,//업로드할 파일정보
									uploadPath,//서버 경로
									size,//한번에 업로드할 사이즈
									"utf-8",//한글 파일명 깨짐 처리
									new DefaultFileRenamePolicy());//rename처리
				
				String cate = multi.getParameter("cate");
				String name = multi.getParameter("name");
				String sub_desc = multi.getParameter("sub_desc");
				int cost = Integer.parseInt(multi.getParameter("cost"));
				String discount = multi.getParameter("discount");
				int price = Integer.parseInt(multi.getParameter("price"));
				int stock = Integer.parseInt(multi.getParameter("stock"));
				String main = multi.getFilesystemName("mainimg");
				String originalFilename = multi.getOriginalFileName("mainimg");
				List<String> files = new ArrayList<>();
				
				Enumeration serfiles = multi.getFileNames();
				while(serfiles.hasMoreElements()) {
					String filename1 = (String) serfiles.nextElement();
					if(!filename1.equals("mainimg")){
						String detailimg = multi.getFilesystemName(filename1);
						String originaldetailimg = multi.getOriginalFileName(filename1);
						files.add(detailimg);
					}
				}
				
				String option = multi.getParameter("use_option");
				
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
				for (int i = 0; i < files.size(); i++) {
					if(!files.get(i).isEmpty()){
						img.setPrdNo(prdno);
						img.setImg(files.get(i));
						dao.insertProImg(img);
					}
				}

				if (option.equals("1")) {
					Option opt = new Option();
					OptionDetail det = new OptionDetail();
					String[] opName = multi.getParameterValues("op_name");
					String[] opValue = multi.getParameterValues("op_desc");
					String[] opCost = multi.getParameterValues("op_cost");
					String[] rspan = multi.getParameterValues("span");
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
				
				response.sendRedirect("/jsp_project/manager/product/list.do");
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
