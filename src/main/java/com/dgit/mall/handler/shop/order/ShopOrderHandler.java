package com.dgit.mall.handler.shop.order;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.OrderDao;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;


public class ShopOrderHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
		/*	String num = request.getParameter("no");
			int cNo = Integer.getInteger(num);
			request.setAttribute("cNo", cNo);*/
			return VIEW_FRONT_PATH + "order/orderPage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String productPr = request.getParameter("orderChargePrice");//상품가격
			String delfee = request.getParameter("delfee");//배송비
			String useCpPrice = request.getParameter("finalPrice");//총가격
			String payType = request.getParameter("selorderway");//결제타입
			String message = request.getParameter("orderMsg");//주문메세지
			String optionvalue = request.getParameter("optionValue");//옵션유무
			HttpSession session = request.getSession(false);
		    Member loginMember = (Member) session.getAttribute("auth");
			
			
			//오더 테이블 넣을거
			
			String pr = request.getParameter("productPrice");
			int sellingPr = Integer.parseInt(pr); //판매가 -- 이하 모두 배열로 수정필요
			String num = request.getParameter("productCount");
			int quantity = Integer.parseInt(num);//수량
			String option = request.getParameter("optionValue");//옵션 이름
			String prd = request.getParameter("proNo");//상품번호
			int prdNo = Integer.parseInt(prd);
			Date date = new Date();
			SimpleDateFormat sdft = new SimpleDateFormat("yyyyMMddHHmmss");
			String ordNo =sdft.format(date)+"-"+prdNo; //주문번호
			//오더프로덕트테이블에 넣을꺼
			
			SqlSession sql = null;
			try {
				sql = MySqlSessionFactory.openSession();
				OrderDao dao = sql.getMapper(OrderDao.class);
				Product pro = new Product();
				pro.setPrdNo(prdNo);
				OrderProduct product = new OrderProduct();
				product.setPrdNo(pro);
				product.setOrdNo(ordNo);
				product.setOpSellingPrice(sellingPr);
				product.setOpQuantity(quantity);
				product.setOpOption(option);
				dao.insertOrderProduct(product);
				sql.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
			
			
			
			
			
			
		}
		return null;
	}

}
