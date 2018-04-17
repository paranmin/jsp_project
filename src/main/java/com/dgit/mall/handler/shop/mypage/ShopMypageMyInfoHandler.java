package com.dgit.mall.handler.shop.mypage;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.type.AddressType;
import com.dgit.mall.dto.type.Gender;
import com.dgit.mall.dto.type.PushApp;
import com.dgit.mall.dto.type.PushEmail;
import com.dgit.mall.dto.type.PushSMS;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopMypageMyInfoHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession(false);
			Member auth = (Member) session.getAttribute("auth");

			Member modifyMember = MemberService.getInstance().selectByMemberNo(auth.getNo());
			Address memberAddr = AddressService.getInstance().selectHomeByMemberNo(modifyMember);
			modifyMember.setAddr(memberAddr);

			request.setAttribute("modifyMember", modifyMember);
			return VIEW_FRONT_PATH + "mypage/myInfo.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String checkPwd = request.getParameter("checkPwd");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String gender = request.getParameter("gender");
			String zipcode = request.getParameter("zipcode");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String newsmail = request.getParameter("newsmail");
			String sms = request.getParameter("sms");
			String push = request.getParameter("push");

			HttpSession session = request.getSession(false);
			Member auth = (Member) session.getAttribute("auth");

			if (!password.equals(checkPwd)) {
				session.setAttribute("error_msg", "비밀번호가 다릅니다.");
				response.sendRedirect("myinfo.do");
				return null;
			}

			Member modifyMember = new Member();
			modifyMember.setNo(auth.getNo());
			modifyMember.setName(name);
			modifyMember.setPwd(password);
			modifyMember.setBirth(String.format("%s-%s-%s", year, month, day));
			if (gender == null || gender.equalsIgnoreCase("female")) {
				modifyMember.setGender(Gender.FEMALE);
			} else {
				modifyMember.setGender(Gender.MALE);
			}

			String tel = String.format("%s%s%s", tel1, tel2, tel3);
			modifyMember.setTel(CommonUtil.getInstance().phoneNumberHyphenAdd(tel, false));
			String phone = String.format("%s%s%s", phone1, phone2, phone3);
			modifyMember.setPhone(CommonUtil.getInstance().phoneNumberHyphenAdd(phone, false));

			modifyMember.setEmail(String.format("%s@%s", email1, email2));

			modifyMember.setPushEmail(newsmail.equalsIgnoreCase("Y") ? PushEmail.Y : PushEmail.N);
			modifyMember.setPushSMS(sms.equalsIgnoreCase("Y") ? PushSMS.Y : PushSMS.N);
			modifyMember.setPushApp(push.equalsIgnoreCase("Y") ? PushApp.Y : PushApp.N);

			int res = MemberService.getInstance().modifyMember(modifyMember);
			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 수정하지 못했습니다.");
				response.sendRedirect("myinfo.do");
				return null;
			}

			Address addr = AddressService.getInstance().selectHomeByMemberNo(modifyMember);
			if (addr == null) {
				addr = new Address(auth.getNo(), zipcode, addr1, addr2, AddressType.HOME, new Date());
				res = AddressService.getInstance().insertByMemberNo(addr);
			} else {
				addr.setZipcode(zipcode);
				addr.setAddr1(addr1);
				addr.setAddr2(addr2);
				res = AddressService.getInstance().modifyByMemberNo(addr);
			}
			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 수정하지 못했습니다.");
			} else {
				session.setAttribute("error_msg", "수정하였습니다.");
			}
			response.sendRedirect("myinfo.do");
		}
		return null;
	}

}
