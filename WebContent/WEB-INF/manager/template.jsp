<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - SJ JEWELRY</title>
<c:if test="${useAwesome != null && useAwesome == 'use'}">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/manager.css" media="all" />
<c:if test="${css != null && !css.isEmpty()}">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/${css}" media="all" />
</c:if>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<header id="header">
		<jsp:include page="module/top.jsp" flush="false" />
	</header>
	<div id="contentArea">
		<aside id="sidebar">
			<jsp:include page="module/left.jsp" flush="false" />
		</aside>
		<section id="content">
			<jsp:include page="${contentPage}" flush="false" />
		</section>
	</div>
	<footer id="footer">
		<jsp:include page="module/bottom.jsp" flush="false" />
	</footer>
</body>
</html>