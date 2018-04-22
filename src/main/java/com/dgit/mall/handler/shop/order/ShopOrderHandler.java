package com.dgit.mall.handler.shop.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dao.OrderDao;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.dto.Product;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;


public class ShopOrderHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			SqlSession sql = null;
			try {
				sql = MySqlSessionFactory.openSession();
				CartDao dao = sql.getMapper(CartDao.class);
				HttpSession session = request.getSession(false);
				// ctNo 가 없이 order.do에 접근할 때 체크해서 cart로 보내든지 메인으로 보내든지 해야 함.
				String[] ctno = (String[]) session.getAttribute("ctNo");
				Member loginMember = (Member) session.getAttribute("auth");
				Map<String, Object> map = new HashMap<>();
				map.put("mNo", loginMember.getNo());
				map.put("ctNo", ctno);
				List<Cart> list = dao.selectByselectedCart(map);
				System.out.println(list);
				request.setAttribute("list", list);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
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
			System.out.println(loginMember);
			
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
