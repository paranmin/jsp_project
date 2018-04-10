<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="mypageContent">
			<h2 class="engText">MY PAGE</h2>
			<ul class="mypage_menu">
				<li><a href="mypage.do" class="engText">Mypage Home</a></li>
				<li><a href="order.do" class="engText">Order List</a></li>
				<li><a href="myinfo.do" class="engText">My info</a></li>
				<li><a href="board.do" class="engText">Board List</a></li>
			</ul>
			<div class="board">
				<h3 class="checkPw_top">Check P/W</h3>
				<div class="checkPw">
					<p class="msg">저희 쇼핑몰에서는 회원님의 소중한 개인정보를 안전하게 보호하고<br>
					개인정보 도용으로 인한 피해를 예방하기 위하여 비밀번호를 확인합니다.<br>
					비밀번호는 타인에게 노출되지 않도록 주의해주세요.</p>
					<form action="" method="post">
						<div class="formArea">
							<p><label for="id">아이디</label> dkfslfkslfksl</p>
							<p><label for="pwd">비밀번호</label> <input type="text" name="pwd" id="pwd" /></p>
						</div>
						<p class="btn">
							<a href="#" class="ok">확인</a>
							<a href="#" class="cancel">취소</a>
						</p>
					</form>
				</div>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>