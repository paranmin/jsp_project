<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="orderContainer">
		<p class="order_title"><span class="name">[${order.member.name}]</span>님께서 <fmt:formatDate value="${order.regdate}" pattern="yyyy년 MM월 dd일"/>에 주문하신 내역입니다.</p>
		<div class="orderInfo infoArea">
			<h3>주문자정보</h3>
			<table>
				<colgroup>
				<col width="120">
				<col width="*">
				<col width="120">
				<col width="*">
				</colgroup>
				<tr>
					<th>주문번호</th>
					<td class="center">${order.ordNo}</td>
					<th>주문일자</th>
					<td class="center"><fmt:formatDate value="${order.regdate}" pattern="yyyy.MM.dd"/></td>
				</tr>
				<tr>
					<th>주문자</th>
					<td class="center">${order.member.name}</td>
					<th>주문입금현황</th>
					<td class="center">${order.type}</td>
				</tr>
				<tr>
					<th>주문메모</th>
					<td colspan="3">${order.ordMessage}</td>
				</tr>
			</table>
		</div>
		<div class="deliveryInfo infoArea">
			<h3>배송지정보</h3>
			<table>
				<colgroup>
				<col width="120">
				<col width="*">
				<col width="120">
				<col width="*">
				</colgroup>
				<tr>
					<th>배송번호</th>
					<td class="center">배송시 처리 되는 번호</td>
					<th>송장번호</th>
					<td class="center">배송 처리시 생성되는 번호</td>
				</tr>
				<tr>
					<th>수취인</th>
					<td class="center">${order.receiver}</td>
					<th>연락처</th>
					<td class="center">${order.rcPhone1 } <c:if test="${order.rcPhone2 ne null && order.rcPhone2 != ''}">(${order.rcPhone2})</c:if></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">${order.address.zipcode } : ${order.address.addr1} ${order.address.addr2}</td>
				</tr>
				<!-- tr>
					<th>배송메세지</th>
					<td colspan="3">물건 좋은~~~~~걸로 주세요~</td>
				</tr -->
			</table>
		</div>
		<div class="infoArea">
			<h3>주문상품정보</h3>
			<table>
				<colgroup>
				<col width="80">
				<col width="*">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="120">
				</colgroup>
				<tr>
					<th colspan="2">주문상품정보</th>
					<th>수량</th>
					<th>가격</th>
					<th>처리상태</th>
					<th>배송번호</th>
				</tr>
			<c:forEach var="item" items="${ordPrdList}">
				<tr>
					<td colspan="2">${item.prdNo.name } <c:if test="${item.opOption != 'N'}"><br>옵션 : ${item.opOption}</c:if></td>
					<td class="center">${item.opQuantity}</td>
					<td class="center"><fmt:formatNumber value="${item.opSellingPrice}" pattern="#,###" /> 원</td>
					<td class="center">결제완료</td>
					<td class="center">배송번호 출력</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="infoArea">
			<h3>결제정보</h3>
			<table>
				<colgroup>
				<col width="120">
				<col width="200">
				<col width="*">
				</colgroup>
				<tr>
					<th>결제방법</th>
					<th>결제금액</th>
					<th>세부내역</th>
				</tr>
				<tr>
					<td class="center">
						<c:choose>
							<c:when test="${order.type eq PayType.CARD}">카드</c:when>
							<c:when test="${order.type eq PayType.BANK}">무통장</c:when>
							<c:otherwise>계좌이체</c:otherwise>
						</c:choose>
					</td>
					<td class="center"><fmt:formatNumber value="${order.ordPrice}" pattern="#,###" /> 원 (미입금)</td>
					<td class="center">우리은행 1002044003501 (예금주:유지영) ${order.member.name }</td>
				</tr>
			</table>
		</div>
	</div>
<script>
$(function() {
	
});
</script>
</body>
</html>