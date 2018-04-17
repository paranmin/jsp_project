package com.dgit.mall.handler.admin.member;

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
import com.dgit.mall.dto.type.PrivacyTerms;
import com.dgit.mall.dto.type.PushApp;
import com.dgit.mall.dto.type.PushEmail;
import com.dgit.mall.dto.type.PushSMS;
import com.dgit.mall.dto.type.ServiceTerms;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class AdminMemberRegisterHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			request.setAttribute("contentPage", "member/memberRegister.jsp");
			request.setAttribute("sub_menu", "register");
			request.setAttribute("menu", "member");
			request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

			return TEMPLATE_PAGE;
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
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
			if (name == null || name.equals("")) {
				session.setAttribute("error_msg", "이름을 입력해주세요.");
				response.sendRedirect("register.do");
				return null;
			}
			if (id == null || id.equals("")) {
				session.setAttribute("error_msg", "아이디를 입력해주세요.");
				response.sendRedirect("register.do");
				return null;
			}
			if (password == null || password.equals("") || checkPwd == null || checkPwd.equals("")) {
				session.setAttribute("error_msg", "비밀번호를 입력해주세요.");
				response.sendRedirect("register.do");
				return null;
			}
			if (!password.equals("") && !password.equals(checkPwd)) {
				session.setAttribute("error_msg", "비밀번호가 다릅니다.");
				response.sendRedirect("register.do");
				return null;
			}
			if (phone1 == null || phone1.equals("") || phone2 == null || phone2.equals("") || phone3 == null || phone3.equals("")) {
				session.setAttribute("error_msg", "휴대폰 항목을 입력해주세요.");
				response.sendRedirect("register.do");
				return null;
			}
			if (email1 == null || email1.equals("") || email2 == null || email2.equals("")) {
				session.setAttribute("error_msg", "이메일 항목을 입력해주세요.");
				response.sendRedirect("register.do");
				return null;
			}

			Member registerMember = new Member();
			registerMember.setId(id);
			registerMember.setName(name);
			registerMember.setPwd(password);
			registerMember.setBirth(String.format("%s-%s-%s", year, month, day));
			if (gender == null || gender.equalsIgnoreCase("female")) {
				registerMember.setGender(Gender.FEMALE);
			} else {
				registerMember.setGender(Gender.MALE);
			}

			String tel = String.format("%s%s%s", tel1, tel2, tel3);
			registerMember.setTel(CommonUtil.getInstance().phoneNumberHyphenAdd(tel, false));
			String phone = String.format("%s%s%s", phone1, phone2, phone3);
			registerMember.setPhone(CommonUtil.getInstance().phoneNumberHyphenAdd(phone, false));

			registerMember.setEmail(String.format("%s@%s", email1, email2));

			registerMember.setServiceAgree(ServiceTerms.Y);
			registerMember.setPrivacyAgree(PrivacyTerms.Y);
			registerMember.setPushEmail(newsmail.equalsIgnoreCase("Y") ? PushEmail.Y : PushEmail.N);
			registerMember.setPushSMS(sms.equalsIgnoreCase("Y") ? PushSMS.Y : PushSMS.N);
			registerMember.setPushApp(push.equalsIgnoreCase("Y") ? PushApp.Y : PushApp.N);
			registerMember.setRegdate(new Date());

			int res = MemberService.getInstance().registerFullMember(registerMember);
			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 등록하지 못했습니다.");
				response.sendRedirect("register.do");
				return null;
			}

			registerMember = MemberService.getInstance().selectByFindMember(registerMember);
			Address addr = new Address(registerMember.getNo(), zipcode, addr1, addr2, AddressType.HOME, new Date());
			res = AddressService.getInstance().insertByMemberNo(addr);
			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 등록하지 못했습니다.");
			} else {
				session.setAttribute("error_msg", "회원정보를 등록하였습니다.");
			}
			response.sendRedirect("list.do");
			return null;
		}
		return null;
	}

}
