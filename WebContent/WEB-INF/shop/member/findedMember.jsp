<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 결과 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="loginContent">
			<h2>Find ID/PW</h2>
			<div class="findPopArea">
				<div>찾으시는 비밀번호는 가입시 등록하신 이메일로 보내드립니다.</div>
				<div class="msgArea">
				<p>
					찾으시는 회원의 아이디는 [<span class="bold">ㅁㅁㅁ</span>]입니다.
				</p>
				<p>
					<a href="#" class="btn">확인</a>
				</p>
				</div>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>