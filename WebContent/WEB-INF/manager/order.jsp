<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sub_menu = request.getParameter("sub_menu");
	if (sub_menu == null || sub_menu.isEmpty()) {
		sub_menu = "list";
	}
	pageContext.setAttribute("sub_menu", sub_menu);
%>
<jsp:forward page="template.jsp">
	<jsp:param value="order/orderList.jsp" name="contentPage" />
	<jsp:param value="order" name="menu" />
	<jsp:param value="${sub_menu}" name="sub_menu" />
</jsp:forward>