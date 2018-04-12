package com.dgit.mall.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReCheckPasswordFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) sRequest;
		HttpSession session = httpRequest.getSession(false);

		String reCheckPwd = (String) session.getAttribute("reCheckPwd");
		if (reCheckPwd == null || !reCheckPwd.equalsIgnoreCase("success")) {
			HttpServletResponse httpResponse = (HttpServletResponse) sResponse;
			httpResponse.sendRedirect("checkpw.do");
		} else {
			chain.doFilter(sRequest, sResponse);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

}
