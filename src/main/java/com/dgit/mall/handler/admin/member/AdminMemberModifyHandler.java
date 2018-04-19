package com.dgit.mall.handler.admin.member;

import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AddressService;
import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.type.AddressType;
import com.dgit.mall.dto.type.Gender;
import com.dgit.mall.dto.type.PushEmail;
import com.dgit.mall.dto.type.PushSMS;
import com.dgit.mall.handler.admin.AdminCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class AdminMemberModifyHandler extends AdminCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNo = request.getParameter("no");

		HttpSession session = request.getSession(false);
		if (sNo == null || sNo.equals("")) {
			session.setAttribute("error_msg", "잘못된 호출입니다.\\n회원 번호가 없습니다.");
			response.sendRedirect("list.do");
			return null;
		}
		int no = Integer.parseInt(sNo);

		if (request.getMethod().equalsIgnoreCase("get")) {
			Member member = MemberService.getInstance().selectByMemberNo(no);
			if (member == null) {
				session.setAttribute("error_msg", "존재하지 않는 회원입니다.");
				response.sendRedirect("list.do");
				return null;
			}
			Address memAddr = AddressService.getInstance().selectHomeByMemberNo(member);
			request.setAttribute("member", member);
			request.setAttribute("memberAddr", memAddr);
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String chkPassword = request.getParameter("chkPassword");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String pushEmail = request.getParameter("push_email");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String pushSMS = request.getParameter("push_sms");
			String zipcode = request.getParameter("zipcode");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String gender = request.getParameter("gender");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");

			Enumeration<String> names = request.getParameterNames();
			while (names.hasMoreElements()) {
				String n = names.nextElement();
				String value = request.getParameter(n);
				System.out.println(String.format("[%s] = %s%n", n, value));
			}

			if (!password.equals(chkPassword)) {
				session.setAttribute("error_msg", "비밀번호가 다릅니다.");
				response.sendRedirect("modify.do?no="+sNo);
				return null;
			}

			Member modifyMember = new Member();
			modifyMember.setNo(no);
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

			if (pushEmail != null) {
				modifyMember.setPushEmail(pushEmail.equalsIgnoreCase("Y") ? PushEmail.Y : PushEmail.N);
			}
			if (pushSMS != null) {
				modifyMember.setPushSMS(pushSMS.equalsIgnoreCase("Y") ? PushSMS.Y : PushSMS.N);
			}
			int res = MemberService.getInstance().modifyMember(modifyMember);
			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 수정하지 못했습니다.");
				response.sendRedirect("modify.do?no="+sNo);
				return null;
			}

			if ((zipcode != null && !zipcode.equals("")) && (addr1 != null && !addr1.equals(""))) {
				Address addr = AddressService.getInstance().selectHomeByMemberNo(modifyMember);
				if (addr == null) {
					addr = new Address(no, zipcode, addr1, addr2, AddressType.HOME, new Date());
					res = AddressService.getInstance().insertByMemberNo(addr);
				} else {
					addr.setZipcode(zipcode);
					addr.setAddr1(addr1);
					addr.setAddr2(addr2);
					res = AddressService.getInstance().modifyByMemberNo(addr);
				}
			}

			if (res == 0) {
				session.setAttribute("error_msg", "회원정보를 수정하지 못했습니다.");
			} else {
				session.setAttribute("error_msg", "수정하였습니다.");
			}
			response.sendRedirect("modify.do?no="+sNo);
			return null;
		}

		request.setAttribute("contentPage", "member/memberModify.jsp");
		request.setAttribute("sub_menu", "list");
		request.setAttribute("menu", "member");
		request.setAttribute("css", String.format("%s?v=%s", "member.css", new Date().getTime()));

		return TEMPLATE_PAGE;
	}

}
