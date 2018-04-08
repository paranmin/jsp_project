<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="/jsp_project/css/base.css" media="all" />
<link rel="stylesheet" href="/jsp_project/css/join.css" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />

		<section id="joinContent">
			<h2>Join Complete</h2>
			<div class="joinComplate">
				<h3>회원가입 완료</h3>
				<p>아무개님의 회원가입이 성공적으로 완료되었습니다.</p>
				<p>SJ JEWELRY 안에서 즐거운 쇼핑 되시길 바랍니다.</p>
			</div>
		</section>

		<c:import url="../../modules/footer.jsp" />
	</div>
</body>
</html>