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
		margin-bottom: 20px;
		margin-left: 20px;
	}
	section table{
		border-collapse: collapse;
		margin-left: 22px;
		width: 600px;
	}
	section th,tr,tr,td{
		border:1px solid black;
	}
	section table th{
		font-size: 13px;
		height: 20px;
		line-height: 20px;
	}
	section table tr td{
		height:20px;
		line-height:20px;
		font-size: 12px;
	}
	span.redfinallyPrice{
		color:red;
	}
	td.lastPrice{
		text-align: right;
	}
	div.CouponBtns{
		margin-top: 50px;
		text-align: center;
	}
	div.CouponBtns input{
		margin-right: 2px;
		width: 50px;
		height: 20px;
		line-height: 20px;
		border:1px solid black;
		background-color: white;
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
		<table>
			<tr>
				<th>쿠폰 번호</th>
				<th>쿠폰 이름</th>
				<th>사용가능금액</th>
				<th>할인금액</th>
				<th>사용기간</th>
			</tr>
			<tr>
				<td>10192224</td>
				<td>회원가입 2500원 쿠폰</td>
				<td>10,000원 이상</td>
				<td>2,500원</td>
				<td>2018.05.10까지</td>
			</tr>
			<tr>
				<td colspan="5" class="lastPrice">상품 총 가격<span class="oriPrice"></span>원
				 - 쿠폰 적용 금액 <span class="couponPrice"></span>원 = <span class="redfinallyPrice">총 상품 결제 예정금액 : <span class="finallyPrice"></span>원</span>
				</td>
			</tr>
		</table>
		<div class="CouponBtns">
			<input type="submit" value="확인"><input type="reset" value="취소">
		</div>
	</section>
	

</body>
</html>