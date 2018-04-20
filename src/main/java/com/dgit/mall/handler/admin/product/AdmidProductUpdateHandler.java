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
				/*request.setAttribute("css", "product.css");*/

				return TEMPLATE_PAGE;
				
			} finally {
				sqlsession.close();
			}
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String uploadPath = request.getRealPath("upload");
			System.out.println("uploadPath = "+ uploadPath);
			
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdirs();
			}
			int size = 1024*1024*10; //10Mbyte
			
			
			SqlSession sqlsession = null;
			try{
				MultipartRequest multi = 
						new MultipartRequest(request,//업로드할 파일정보
									uploadPath,//서버 경로
									size,//한번에 업로드할 사이즈
									"utf-8",//한글 파일명 깨짐 처리
									new DefaultFileRenamePolicy());//rename처리
				
				int no = Integer.parseInt(multi.getParameter("no"));
				String view = multi.getParameter("view");
				String cate = multi.getParameter("cate");
				String name = multi.getParameter("name");
				String desc = multi.getParameter("desc");
				int cost = Integer.parseInt(multi.getParameter("cost"));
				String discount = multi.getParameter("discount");
				int price = Integer.parseInt(multi.getParameter("price"));
				int stock = Integer.parseInt(multi.getParameter("stock"));
				String option = multi.getParameter("use_option");
				String mainImg = multi.getFilesystemName("mainimg");
				String originalFilename = multi.getOriginalFileName("mainimg");
				String deleteDetailImage = multi.getParameter("deleteDetailImage");
				String deleteImage[] = deleteDetailImage.split(",");
				/*String[] files = multi.getParameterValues("files");*/
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
				
				System.out.println(mainImg);
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
			
				/*for (int i = 0; i < files.length; i++) {
					if(!files[i].isEmpty()){
						proimg.setPrdNo(no);
						proimg.setImg(files[i]);
						dao.insertProImg(proimg);
					}	
				}*/
				
				Proimg img = new Proimg();
				for (int i = 0; i < files.size(); i++) {
					if(!files.get(i).isEmpty()){
						img.setPrdNo(no);
						img.setImg(files.get(i));
						dao.insertProImg(img);
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
				
			}catch(Exception e){
				e.printStackTrace();
				sqlsession.rollback();
			}finally{
				sqlsession.close();
			}			
		}
		return null;
	}

}
