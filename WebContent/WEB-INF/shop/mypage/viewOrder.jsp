<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<p class="order_title"><span class="name">[어쩌구]</span>님께서 2018년 04월 19일에 주문하신 내역입니다.</p>
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
					<td class="center">20181222131423-231421313</td>
					<th>주문일자</th>
					<td class="center">2018.12.22</td>
				</tr>
				<tr>
					<th>주문자</th>
					<td class="center">어쩌구</td>
					<th>주문입금현황</th>
					<td class="center">미입금</td>
				</tr>
				<tr>
					<th>주문메모</th>
					<td colspan="3"></td>
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
					<td class="center">20181222131423-231421313</td>
					<th>송장번호</th>
					<td class="center">2018.12.22</td>
				</tr>
				<tr>
					<th>수취인</th>
					<td class="center">어쩌구</td>
					<th>연락처</th>
					<td class="center">미입금</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">41241 : 대구 남구 중앙대로 3412</td>
				</tr>
				<tr>
					<th>배송메세지</th>
					<td colspan="3">물건 좋은~~~~~걸로 주세요~</td>
				</tr>
			</table>
		</div>
		<div class="infoArea">
			<h3>주문상품정보</h3>
			<table>
				<colgroup>
				<col width="80">
				<col width="*">
				<col width="120">
				<col width="50">
				<col width="80">
				<col width="50">
				<col width="50">
				<col width="80">
				</colgroup>
				<tr>
					<th colspan="2">주문상품정보</th>
					<th>상품별주문번호</th>
					<th>수량</th>
					<th>가격</th>
					<th>적립</th>
					<th>처리상태</th>
					<th>배송번호</th>
				</tr>
				<tr>
					<td colspan="2">슬림 도형 &amp; 볼 세트 귀걸이<br>색상 : 실버/오각형[ED-16-13]-모델착용</td>
					<td class="center">20180419182553-00700237205_[1]</td>
					<td class="center">1</td>
					<td class="center">8,000원</td>
					<td class="center">80</td>
					<td class="center">결제대기</td>
					<td class="center">3452334324</td>
				</tr>
			</table>
		</div>
		<div class="infoArea">
			<h3>결제정보</h3>
			<table>
				<colgroup>
				<col width="120">
				<col width="120">
				<col width="*">
				</colgroup>
				<tr>
					<th>결제방법</th>
					<th>결제금액</th>
					<th>세부내역</th>
				</tr>
				<tr>
					<th class="center">무통장</th>
					<th class="center">24,000원 (미입금)</th>
					<td class="center">우리은행 1002044003501 (예금주:유지영) 이강대</td>
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