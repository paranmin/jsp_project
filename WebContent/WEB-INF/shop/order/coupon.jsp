<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".couponSub").click(function(){
			var result = confirm("쿠폰을 적용하시겠습니까?");
			if(result){
				window.close();
			}
		})
		
		var price1 = parseInt($(".oriPrice").text());
		console.log(price1);
		
		$(".itemNo").click(function(){
			var value = $(this).parent().next().next().next().text();
			console.log(value);
			$(".couponPrice").text(value);
			var price2 =parseInt($("couponPrice").text());
			console.log(price2);
			$(".finallyPrice").text(price1-price2);
		})
	})
</script>
</head>
<body>
	<form action="coupon.do" method="post">
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
				<c:if test="${list.size()==0 }">
				<tr>
					<td colspan="5">적용 가능한 쿠폰이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size()>0 }">
				<c:forEach var="items" items="${list }">
					<tr>
						<td><a class="itemNo">${items.cNo }</a></td>
						<td>${items.cName }</td>
						<td>${items.cuseMorePrice }</td>
						<td class="findValue">${items.csalePrice }</td>
						<td><fmt:formatDate value="${items.climitDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:if>
			
			<tr>
				<td colspan="5" class="lastPrice">상품 총 가격<span class="oriPrice">${price }</span>원
				 - 쿠폰 적용 금액 <span class="couponPrice"></span>원 = <span class="redfinallyPrice">총 상품 결제 예정금액 : <span class="finallyPrice"></span>원</span>
				</td>
			</tr>
		</table>
		<div class="CouponBtns">
			<input type="submit" value="확인" class="couponSub"><input type="reset" value="취소" class="couponCan">
		</div>
	</section>
	</form>

</body>
</html>