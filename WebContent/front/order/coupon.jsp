<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>쿠폰 적용</title>
<style>
@charset "UTF-8";

	* {
		margin: 0;
		padding: 0;
	}
	
	body {
		font-family: 'Nanum Myeongjo', serif;
	}
	
	ul {
		list-style: none;
	}
	
	a {
		text-decoration: none;
	}
	header{
		background-color: black;
		color:white;
		background-image: url("../../images/couponBackground.jpg");
	}
	header h1{
		padding-left: 20px;
		height: 50px;
		line-height: 50px;
	}
	section{
		margin-top: 20px;
	}
	section h4{
		font-size: 13px;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
</head>
<body>
	<header>
		<h1>쿠폰 적용</h1>
	</header>
	<section>
		<h4>보유 쿠폰 내역</h4>
	</section>
	

</body>
</html>