<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 - SJ JEWELRY</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="../../css/base.css" media="all" />
<link rel="stylesheet" href="../../css/login.css" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />

		<section id="loginContent">
			<h2>Login or Create an Account</h2>
			<div class="memberArea">
				<div class="loginArea">
				</div>
				<div class="joinArea">
				</div>
			</div>
		</section>

		<c:import url="../../modules/footer.jsp" />
	</div>
</body>
</html>