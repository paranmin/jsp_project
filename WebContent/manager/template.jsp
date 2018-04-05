<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contentPage = request.getParameter("contentPage");
	pageContext.setAttribute("contentPage", contentPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - SJ JEWELRY</title>
<link rel="stylesheet" href="/jsp_project/css/manager.css" media="all" />
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