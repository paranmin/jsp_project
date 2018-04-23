package com.dgit.mall.handler.shop.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.Option;
import com.dgit.mall.dto.OptionDetail;
import com.dgit.mall.dto.Product;
import com.dgit.mall.dto.Proimg;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.MySqlSessionFactory;

public class ProductDetailShowHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			int no = Integer.parseInt(request.getParameter("no"));
			SqlSession sqlsession = null;
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
				request.setAttribute("pro", pro);
				request.setAttribute("img", proimg);
				return VIEW_FRONT_PATH + "product/detailProduct.jsp";
			} finally {
				sqlsession.close();
			}
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			HttpSession session = request.getSession(false);
			Member loginMember = (Member) session.getAttribute("auth");
			if (loginMember == null) {
				response.sendRedirect(request.getContextPath() + "/shop/login.do");
				return null;
			}

			int prdNo = Integer.parseInt(request.getParameter("chkAll"));// 상품번호
			String[] optionPrice = request.getParameterValues("opPrice"); // 상품 옵션적용가
			String[] num = request.getParameterValues("cartnum");// 상품 수량
			List<Integer> count = new ArrayList<>();

			for (int i = 0; i < num.length; i++) {
				count.add(i, Integer.parseInt(num[i]));
			}

			String[] opname = request.getParameterValues("optionName");// 상품 옵션이름
			SqlSession sqlsession = null;

			try {
				sqlsession = MySqlSessionFactory.openSession();
				CartDao dao = sqlsession.getMapper(CartDao.class);
				Cart cart = new Cart();
				Product pro = new Product(prdNo);
				cart.setProduct(pro);
				cart.setMember(loginMember);

				for (int i = 0; i < optionPrice.length; i++) {
					cart.setPrdOpName(opname[i]);
					cart.setPrdQuantity(count.get(i));
					cart.setPrdOpPrice(Integer.parseInt(optionPrice[i]));
					dao.insertCart(cart);
				}
				sqlsession.commit();

				/* sendRedirect 땐 request 안 먹힘
				request.setAttribute("opName", opname);
				request.setAttribute("opPrice", optionPrice);
				request.setAttribute("count", count);
				request.setAttribute("prdno", prdNo);*/

				response.sendRedirect(request.getContextPath() + "/shop/cart/cart.do");
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