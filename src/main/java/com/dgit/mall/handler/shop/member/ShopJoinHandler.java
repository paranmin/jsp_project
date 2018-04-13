package com.dgit.mall.handler.shop.member;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;
import com.dgit.mall.dto.type.PrivacyTerms;
import com.dgit.mall.dto.type.PushApp;
import com.dgit.mall.dto.type.PushEmail;
import com.dgit.mall.dto.type.PushSMS;
import com.dgit.mall.dto.type.ServiceTerms;
import com.dgit.mall.handler.shop.ShopCommandHandler;
import com.dgit.mall.util.CommonUtil;

public class ShopJoinHandler extends ShopCommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("get")) {
			return VIEW_FRONT_PATH + "member/terms.jsp";
		} else if (request.getMethod().equalsIgnoreCase("post")) {

			String serviceAgree = request.getParameter("serviceAgree");
			String privacyAgree = request.getParameter("privacyAgree");
			String ademail = request.getParameter("ademail");
			String adsms = request.getParameter("adsms");
			String adpush = request.getParameter("adpush");

			if (serviceAgree == null || !serviceAgree.equalsIgnoreCase("y") || privacyAgree == null
					|| !privacyAgree.equalsIgnoreCase("y")) {
				request.setAttribute("error_msg", "이용약관 및 개인정보 수집에 동의하지 않았습니다.");
				setTermsForJoinPage(request, serviceAgree, privacyAgree, ademail, adsms, adpush);
				return VIEW_FRONT_PATH + "member/join.jsp";
			}

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String chkpassword = request.getParameter("chkpassword");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String chkfourteen = request.getParameter("chkfourteen");

			if (chkfourteen == null || chkfourteen.equals("")) {
				request.setAttribute("error_msg", "14세 이상 회원 가입이 가능합니다.");
				setTermsForJoinPage(request, serviceAgree, privacyAgree, ademail, adsms, adpush);
				return VIEW_FRONT_PATH + "member/join.jsp";
			}

			if (password.equals("")) {
				request.setAttribute("error_msg", "비밀번호를 입력해주십시오.");
				setTermsForJoinPage(request, serviceAgree, privacyAgree, ademail, adsms, adpush);
				return VIEW_FRONT_PATH + "member/join.jsp";
			}

			if (!password.equals(chkpassword)) {
				request.setAttribute("error_msg", "비밀번호가 틀립니다.");
				setTermsForJoinPage(request, serviceAgree, privacyAgree, ademail, adsms, adpush);
				return VIEW_FRONT_PATH + "member/join.jsp";
			}

			Member joinMember = new Member();
			joinMember.setId(id);
			joinMember.setName(name);
			joinMember.setPwd(password);
			joinMember.setEmail(email);
			joinMember.setPhone(CommonUtil.getInstance().phoneNumberHyphenAdd(phone, false));

			joinMember.setServiceAgree(ServiceTerms.Y);
			joinMember.setPrivacyAgree(PrivacyTerms.Y);

			joinMember.setPushEmail(PushEmail.N);
			if (ademail != null && ademail.equalsIgnoreCase("y")) {
				joinMember.setPushEmail(PushEmail.N);
			}
			joinMember.setPushSMS(PushSMS.N);
			if (adsms != null && adsms.equalsIgnoreCase("y")) {
				joinMember.setPushSMS(PushSMS.Y);
			}
			joinMember.setPushApp(PushApp.N);
			if (adpush != null && adpush.equalsIgnoreCase("y")) {
				joinMember.setPushApp(PushApp.Y);
			}
			joinMember.setRegdate(new Date());

			int result = MemberService.getInstance().registerMember(joinMember);
			if (result == 0) {
				request.setAttribute("error_msg", "회원 가입을 하지 못했습니다.");
				setTermsForJoinPage(request, serviceAgree, privacyAgree, ademail, adsms, adpush);
				return VIEW_FRONT_PATH + "member/join.jsp";
			}
			HttpSession session = request.getSession(false);
			Member loginMember = MemberService.getInstance().selectByLogin(joinMember);
			session.setAttribute("auth", loginMember);
			response.sendRedirect(request.getContextPath() + "/shop/joincomplate.do");
		}
		return null;
	}

	private void setTermsForJoinPage(HttpServletRequest request, String serviceAgree, String privacyAgree,
			String ademail, String adsms, String adpush) {
		request.setAttribute("serviceAgree", serviceAgree);
		request.setAttribute("privacyAgree", privacyAgree);
		request.setAttribute("ademail", ademail);
		request.setAttribute("adsms", adsms);
		request.setAttribute("adpush", adpush);
	}

}
