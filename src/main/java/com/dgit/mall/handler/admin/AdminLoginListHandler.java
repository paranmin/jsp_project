package com.dgit.mall.handler.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dgit.mall.dao.service.AdminService;
import com.dgit.mall.dto.Admin;

public class AdminLoginListHandler extends AdminCommandHandler {

	private HttpSession session;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			session = request.getSession();
			if (id == null || id.equals("") || pwd == null || pwd.equals("")) {
				return viewAdminLogin(request, "아이디 또는 비밀번호를 입력해주세요.");
			}

			Admin admin = AdminService.getInstance().selectByLogin(new Admin(id, pwd));
			if (admin == null) {
				return viewAdminLogin(request, "다시 입력해주세요.");
			}

			session.setAttribute("adminAuth", admin);
			response.sendRedirect(request.getContextPath() + "/manager/order/");
			return null;
		}

		return viewAdminLogin(request, "");
	}

	private String viewAdminLogin(HttpServletRequest request, String msg) {
		if (!msg.equals("")) {
			session.setAttribute("error_msg", msg);
		}
		request.setAttribute("css", String.format("%s?v=%s", "login.css", new Date().getTime()));
		return "/WEB-INF/manager/adminLogin.jsp";
	}
}
