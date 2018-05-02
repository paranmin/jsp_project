<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 보기 - SJ JEWELRY</title>
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
			<div class="board">
				<p class="top_msg"><span>총 게시글 : ${total}건</span> <span class="page">PAGE 1/1</span></p>
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
				<c:if test="${boardList ne null && boardList.size() > 0}">
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.brdNo}</td>
							<td>
								<c:choose>
									<c:when test="${board.brdcode == 'ReviewBoard'}">리뷰</c:when>
									<c:otherwise>Q&amp;A</c:otherwise>
								</c:choose>
							</td>
							<td><a href="${pageContext.request.contextPath}/shop/ReviewBoardRead.do?brdno=${board.brdNo}">${board.brdtitle}</a></td>
							<td><fmt:formatDate value="${board.brdregdate}" pattern="yyyy-MM-dd" /></td>
							<td>${board.brdch }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${boardList eq null || boardList.size() == 0 }">
						<tr>
							<td colspan="3">등록된 글이 없습니다.</td>
						</tr>
				</c:if>
					</tbody>
				</table>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>