<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 - SJ JEWELRY</title>
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
				<p class="order_top_msg"><span class="bold">[${member.name}]</span>님이 쇼핑몰에서 주문한 내역입니다.</p>
				<table>
					<colgroup>
						<col width="10%"/>
						<col />
						<col width="8%"/>
						<col width="8%"/>
					</colgroup>
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품명</th>
							<th>주문상세</th>
							<th>배송현황</th>
						</tr>
					</thead>
					<tbody>
				<c:if test="${recentOrder ne null && recentOrder.size() > 0}">
					<c:forEach var="order" items="${recentOrder}">
						<tr>
							<td><fmt:formatDate value="${order.ordDate}" pattern="yyyy-MM-dd"/></td>
							<td>${order.ordPrdName}</td>
							<td><a href="#" class="btn" onclick="viewOrder('${order.orderNo}');return false;">조회</a></td>
							<td><a href="#">배송대기</a></td>
						</tr>
					</c:forEach>
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