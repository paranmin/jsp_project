<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="../../css/base.css" media="all" />
<link rel="stylesheet" href="../../css/orderComplete.css">
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />
		
		<section>
			<div class="orderCom">
				<h2>ORDER</h2>
				<div class="orderComTitle">
					<p>주문 상품</p>
					<table>
						<tr class="firstline">
							<th id="purchaseName">구입상품명</th>
							<th class="purchaseSub">수량</th>
							<th class="purchaseSub">가격</th>
							<th class="purchaseSub">적립</th>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>
</body>
</html>