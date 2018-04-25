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
import com.dgit.mall.dao.MemberDao;
import com.dgit.mall.dao.OrderDao;
import com.dgit.mall.dao.service.MemberService;
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
				Member member = MemberService.getInstance().selectByMemberNo(loginMember.getNo());
				request.setAttribute("list", list);
				request.setAttribute("member", member);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return VIEW_FRONT_PATH + "order/orderPage.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			
			String producttotalPr = request.getParameter("orderChargePrice"); //총상품가격
			String delfee = request.getParameter("delfee"); //배송비 35000원 넘어가명 if로 빼야됨 =2500
			String[] productPrice = request.getParameterValues("prdeachPrice");//각상품 가격
			String[] productCount = request.getParameterValues("productCount");//각상품 갯수
			String[] optionName = request.getParameterValues("optionname");//각상품 옵션명
			String[] proNo = request.getParameterValues("proNo");//각상품 번호
			String[] optionYN = request.getParameterValues("optionYN");//옵션 유무
			String payType = request.getParameter("selorderway");//결제 타입
			String addrNo = request.getParameter("addrNo");//배송지 번호
			String post = request.getParameter("post1");//우편번호
			String basicaddr = request.getParameter("basicaddr");//기본주소
			String detailaddr= request.getParameter("detailaddr");//상세주소
			String receiver = request.getParameter("name");//수령자 이름
			String ordphone1_1 = request.getParameter("middleNum1");//수령자전번1-1
			String ordphone1_2 = request.getParameter("lastNum1");//수령자전번1-1
			String ordphone2_1 = request.getParameter("middleNum");//수령자전번2-1 주문자 전번과 동일
			String ordphone2_2 = request.getParameter("lastNum");//수령자전번2-1 주문자 전번과 동일
			String orderMsg = request.getParameter("orderMsg"); //주문메세지
			String seladdress = request.getParameter("seladdress");//배송지 선택
			
			
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");
			Member member = MemberService.getInstance().selectByMemberNo(loginMember.getNo()); //멤버
			System.out.println(seladdress+"==배송지 선택");
			System.out.println(member.getNo()+"==회원번호");
			System.out.println(addrNo+"===배송지 번호");
			System.out.println(post+"===우편번호");
			System.out.println(basicaddr+"===기본주소");
			System.out.println(detailaddr+"===상세주소");
			System.out.println(receiver+"===수령자");
			System.out.println(ordphone1_1+"===수령자전번1-1");
			System.out.println(ordphone1_2+"===수령자전번1-2");
			System.out.println(ordphone2_1+"===수령자전번2-1");
			System.out.println(ordphone2_2+"===수령자전번2-2");
			System.out.println(ordphone2_2+"===수령자전번2-2");
			System.out.println(orderMsg+"===주문메세지");
			System.out.println(delfee+"===택배비");
			System.out.println(payType+"====결제타입");
		
			for(int i=0; i<productPrice.length; i++){
				System.out.println(productPrice[i]+"===각 상품 가격");
			}
			for(int i=0; i<productCount.length; i++){
				System.out.println(productCount[i]+"===각 상품 수량");
			}
			for(int i=0; i<optionName.length; i++){
				System.out.println(optionName[i]+"===각상품 옵션");
			}
			for(int i=0; i<proNo.length; i++){
				System.out.println(proNo[i]+"===각상품 번호");
			}
			for(int i=0; i<optionYN.length; i++){
				System.out.println(optionYN[i]+"===각상품옵션 유무");
			}
			
			
			
			
			
			
			
			

			
			
			/*String productPr = request.getParameter("orderChargePrice");//상품가격
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
			
			*/
			
			
			
			
		}
		return null;
	}

}
