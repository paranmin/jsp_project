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
import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.CartService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dao.service.OrderService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Order;
import com.dgit.mall.dto.OrderProduct;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.type.AddressType;
import com.dgit.mall.dto.type.PayType;
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
				if(ctno == null || ctno.length==0){
					response.sendRedirect(request.getContextPath());
					return null;
				}
				
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
			SqlSession sql = null;
			String producttotalPr = request.getParameter("orderChargePrice"); //총상품가격
			int totalPrice = Integer.parseInt(producttotalPr);
			String delfee = request.getParameter("delfee"); //배송비 35000원 넘어가명 if로 빼야됨 =2500
			String[] productPrice = request.getParameterValues("prdeachPrice");//각상품 가격
			String[] productCount = request.getParameterValues("productCount");//각상품 갯수
			String[] optionName = request.getParameterValues("optionname");//각상품 옵션명
			String[] proNo = request.getParameterValues("proNo");//각상품 번호
			String payType = request.getParameter("selorderway");//결제 타입
			String addrNo = request.getParameter("addrNo");//배송지 번호
			String couponPrice = request.getParameter("couponusePrice");//쿠폰적용가격
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
			String userno = request.getParameter("userno");//유저쿠폰 번호
			String uesyn = request.getParameter("uesyn");//쿠폰사용 여부
			String[] cart = request.getParameterValues("chkAll");
			
			
			
			HttpSession session = request.getSession(false);
			session.removeAttribute("ctNo");
			Member loginMember = (Member) session.getAttribute("auth");
			Member member = MemberService.getInstance().selectByMemberNo(loginMember.getNo()); //멤버
			
			int addrNumber = 0;
			if(addrNo!=null&&!addrNo.equals("")){
				addrNumber =Integer.parseInt(addrNo);
			}
			if(seladdress.equals("newadr")){
				Address regiAddr = new Address();
				regiAddr.setMemNo(loginMember.getNo());
				regiAddr.setAddrName(receiver);
				regiAddr.setAddr1(basicaddr);
				regiAddr.setAddr2(detailaddr);
				regiAddr.setAddrNo(0);
				regiAddr.setAddrType(AddressType.OTHER);
				Date date = new Date();
				regiAddr.setRegdate(date);
				regiAddr.setZipcode(post);
				int address = AddressService.getInstance().insertByMemberNomaName(regiAddr);
				
				addrNumber= AddressService.getInstance().selectLastInsert();
				
			}
			
			Address adr = new Address();
			adr.setAddrNo(addrNumber);
			
			Order order = new Order();
			order.setAddress(adr);
			if(totalPrice>35000){
				order.setDeliveryFee(0);
			}else if(totalPrice<35000){
				order.setDeliveryFee(Integer.parseInt(delfee));
			}
			order.setMember(member);
			order.setOrdCouponPrice(Integer.parseInt(couponPrice)); //일단 쿠폰이랑 총가격이랑 같게 넣음..
			order.setOrdMessage(orderMsg);
			Date date = new Date();
			SimpleDateFormat sdft = new SimpleDateFormat("yyyyMMddhhmmss");
			String orderNumfirst = sdft.format(date);
			SimpleDateFormat dpft = new SimpleDateFormat("yyyyMMddhhmmss");
			String orderNumSecond = dpft.format(member.getRegdate());
			String ordernum = orderNumfirst+"-"+orderNumSecond;
			order.setOrdNo(ordernum);
			order.setOrdPrice(totalPrice);
			if(!ordphone1_1.equals("")&&!ordphone1_2.equals("")){
				order.setRcPhone1("010-"+ordphone1_1+"-"+ordphone1_2);
			}else{
				order.setRcPhone1("010-"+ordphone2_1+"-"+ordphone2_2);
			}
			order.setRcPhone2("010-"+ordphone2_1+"-"+ordphone2_2);
			order.setReceiver(receiver);
			order.setType(PayType.valueOf(payType));
			
			int result = OrderService.getInstance().insertOrder(order);
			
			OrderProduct ordpd = new OrderProduct();
				for(int b=0; b<proNo.length; b++){
					Product pd = new Product();
					pd.setPrdNo(Integer.parseInt(proNo[b]));
					ordpd.setOpSellingPrice(Integer.parseInt(productPrice[b]));//상품가격
					ordpd.setOpQuantity(Integer.parseInt(productCount[b]));//상품수량
					ordpd.setOpOption(optionName[b]);//상품옵션
					ordpd.setPrdNo(pd);//상품번호
					Order od = new Order();
					od.setOrdNo(ordernum);
					ordpd.setOrder(od);
					int rel = OrderService.getInstance().insertOrderProduct(ordpd);
				}
			try {
				sql = MySqlSessionFactory.openSession();
				CouponDao coupondao = sql.getMapper(CouponDao.class);
				if(userno==null&&!userno.equals("")){
					int res = coupondao.updateUserCoupon(Integer.parseInt(userno));
				}
				sql.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
				
				Map<String, Object> map = new HashMap<>();
				map.put("mNo", member.getNo());
				map.put("ctNo", cart);
				//int a = CartService.getInstance().deleteCartByNo(map);
				
				int cntCart = CartService.getInstance().countSelectAllCartByMember(loginMember.getNo());
				session.setAttribute("cntCart", cntCart);

			request.setAttribute("payType", payType);
			request.setAttribute("ordernum", ordernum);
			request.setAttribute("addrNo", addrNo);
			response.sendRedirect("orderComplete.do?ordernum="+ordernum);

			
			
			
			
			
			/*
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
			System.out.println(payType+"====결제타입");*/
		
			
			
		}
		return null;
	}

}
