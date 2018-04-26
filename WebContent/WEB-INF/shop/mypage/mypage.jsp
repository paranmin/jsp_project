<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					총 주문금액 : <fmt:formatNumber value="${orderTotalPrice }" pattern="#,###" /> 원
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
				<c:if test="${recentOrder ne null && recentOrder.size() > 0}">
					<c:forEach var="order" items="${recentOrder}">
						<tr>
							<td><fmt:formatDate value="${order.ordDate}" pattern="yyyy-MM-dd"/></td>
							<td>${order.ordPrdName}</td>
							<td><fmt:formatNumber value="${order.ordPrice}" pattern="#,###" /> 원</td>
							<td><a href="#" class="btn" onclick="viewOrder('${order.orderNo}');return false;">조회</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${recentOrder eq null || recentOrder.size() == 0}">
						<tr>
							<td colspan="4">등록된 주문이 없습니다.</td>
						</tr>
				</c:if>
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
				<c:if test="${boardList ne null && boardList.size() > 0}">
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td><fmt:formatDate value="${board.brdregdate}" pattern="yyyy-MM-dd" /></td>
							<td><a href="${pageContext.request.contextPath}/shop/ReviewBoardRead.do?brdno=${board.brdNo}">${board.brdtitle}</a></td>
							<td>
								<c:choose>
									<c:when test="${board.brdcode == 'ReviewBoard'}">리뷰</c:when>
									<c:otherwise>Q&amp;A</c:otherwise>
								</c:choose>
							</td>
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
<script>
function viewOrder(orderNo) {
	var url = "<%= request.getContextPath() + "/shop/mypage/vieworder.do?no=" %>";
	window.open(url+orderNo, 'viewOrderPop', 'width=1200,height=1000,location=no,menubar=no,status=no,toolbar=no,scrollbars=yes,top=100,left=100');
}
</script>
</body>
</html>