package com.dgit.mall.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class JoinAgreeCheckFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String serviceAgree = request.getParameter("serviceAgree");
		String privacyAgree = request.getParameter("privacyAgree");

		RequestDispatcher dispatcher = null;
		if (serviceAgree == null || serviceAgree.isEmpty() || privacyAgree == null || privacyAgree.isEmpty()) {
			dispatcher = request.getRequestDispatcher("/WEB-INF/shop/member/terms.jsp");
		} else {
			request.setAttribute("serviceAgree", serviceAgree);
			request.setAttribute("privacyAgree", privacyAgree);
			request.setAttribute("ademail", request.getParameter("ademail"));
			request.setAttribute("adsms", request.getParameter("adsms"));
			request.setAttribute("adpush", request.getParameter("adpush"));
			dispatcher = request.getRequestDispatcher("/WEB-INF/shop/member/join.jsp");
		}
		dispatcher.forward(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

}
