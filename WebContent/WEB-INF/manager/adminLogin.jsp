<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 - SJ JEWELRY</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/manager.css" media="all" />
<c:if test="${css != null && !css.isEmpty()}">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/${css}" media="all" />
</c:if>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="loginWrapper">
		<h1>로그인</h1>
		<form action="login.do" method="post">
			<p><input type="text" name="id" placeholder="아이디" /></p>
			<p><input type="password" name="pwd" placeholder="비밀번호" /></p>
			<p><input type="submit" value="로그인" /></p>
		</form>
	</div>
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
	<%
		session.removeAttribute("error_msg");
	%>
</c:if>
</body>
</html>