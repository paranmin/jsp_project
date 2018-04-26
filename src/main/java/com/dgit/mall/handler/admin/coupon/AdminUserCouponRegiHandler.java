package com.dgit.mall.handler.admin.coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.CouponDao;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Coupon;
import com.dgit.mall.dto.Member;import com.dgit.mall.dto.UserCoupon;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminUserCouponRegiHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")){
			request.setAttribute("contentPage", "coupon/registerUserCoupon.jsp");
			request.setAttribute("sub_menu", "list");
			request.setAttribute("menu", "coupon");
			request.setAttribute("css", "coupon.css");
			
			String search = request.getParameter("search");
			String valueSearch = request.getParameter("valueSearch");
			List<Member> mlist = null;
			if(valueSearch != null && !valueSearch.equals("")){
				Map<String, String> map = new HashMap<>();
				map.put("where", search);
				map.put("query", valueSearch);
				mlist = MemberService.getInstance().selectMemberListBySearch(map);
			}else{
				mlist = MemberService.getInstance().selectMemberList();
			}
			request.setAttribute("mlist", mlist);
			try (SqlSession sql = MySqlSessionFactory.openSession();) {
				
				CouponDao dao = sql.getMapper(CouponDao.class);
				List<Coupon> list = dao.selectByAll();
				request.setAttribute("list", list);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("where", search);
			request.setAttribute("query", valueSearch);
			return TEMPLATE_PAGE;
		}else if(request.getMethod().equalsIgnoreCase("post")){
			SqlSession sql = null;
			String[] couponNo =request.getParameterValues("couponlist");
			String[] memberNo = request.getParameterValues("memberlist");
			//List<UserCoupon> uclist = null;
			try {
				sql = MySqlSessionFactory.openSession();
				CouponDao dao = sql.getMapper(CouponDao.class);
					for(int m=0; m<memberNo.length; m++){
						Member mr = new Member();
						mr.setNo(Integer.parseInt(memberNo[m]));
						for(int i=0; i<couponNo.length; i++){
							Coupon cp = new Coupon();
							cp.setNo(couponNo[i]);
							UserCoupon uc = new UserCoupon();
							uc.setmNo(mr);
							uc.setCoupon(cp);
							dao.insertMemberCoupon(uc);
							//uclist.add(uc);
						}	
					}
					/*for(UserCoupon uCoupon : uclist){
						dao.insertMemberCoupon(uCoupon);
					}*/
					sql.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sql.close();
			}
			Map<String, Object> map = new HashMap<>();
			map.put("result", "send");
			CommonUtil.getInstance().printMessageByJSON(response, map);
		}
		return null;
	}

}
