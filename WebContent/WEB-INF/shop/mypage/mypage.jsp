<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
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
			<div class="infoArea">
				<div class="memberInfo">
					<p>${loginMember.name}[${loginMember.id}]님 <a href="myinfo.do">수정</a></p>
					<p>전&nbsp;&nbsp;&nbsp;화 : ${loginMember.phone}</p>
					<p>이메일 : ${loginMember.email }</p>
					<p>주&nbsp;&nbsp;&nbsp;소 : ${loginMember.addr}</p>
				</div>
				<div class="orderInfo">
					총 주문금액 : 10,010 원
				</div>
			</div>
			<div class="board">
				<h3>최근 주문 정보 <a href="order.do">전체보기</a></h3>
				<table>
					<colgroup>
						<col width="10%"/>
						<col />
						<col width="15%"/>
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>주문상세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>주문일자</td>
							<td>상품명</td>
							<td>결제금액</td>
							<td>주문상세</td>
						</tr>
						<tr>
							<td>주문일자</td>
							<td>상품명</td>
							<td>결제금액</td>
							<td>주문상세</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="board">
				<h3>최근 등록 게시글 <a href="board.do">전체보기</a></h3>
				<table>
					<colgroup>
						<col width="10%"/>
						<col />
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr>
							<th>등록일자</th>
							<th>제목</th>
							<th>게시판</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>등록일자</td>
							<td>제목</td>
							<td>게시판</td>
						</tr>
						<tr>
							<td>등록일자</td>
							<td>제목</td>
							<td>게시판</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>