<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 보기 - SJ JEWELRY</title>
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
				<p class="top_msg"><span>총 게시글 : 0건</span> <span class="page">PAGE 1/1</span></p>
				<table>
					<colgroup>
						<col width="5%"/>
						<col width="10%"/>
						<col />
						<col width="10%"/>
						<col width="5%"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>게시판</th>
							<th>제목</th>
							<th>날짜</th>
							<th>hit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2</td>
							<td>QNA</td>
							<td>이거 어떻게 되요</td>
							<td>2018-03-28</td>
							<td>5</td>
						</tr>
						<tr>
							<td>1</td>
							<td>후기</td>
							<td>이거 짱짱입니다.</td>
							<td>2018-03-08</td>
							<td>115</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>