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
							<th class="purchaseSub"> </th>
							<th id="purchaseName">구입상품명</th>
							<th class="purchaseSub">수량</th>
							<th class="purchaseSub">가격</th>
							<th class="purchaseSub">적립</th>
						</tr>
						<tbody>
						<tr>
							<td>
								<div class="tb-centerImg">
									
								</div>
							</td>
							<td>
								<div class="tb-centerContent">
									<p><a href="#">베이직 스틸 큐빅 귀걸이</a></p>
								</div>
							</td>
							<td>
								<div class="tb-textalign">
								<p>1개</p>
								</div>
							</td>
							<td>
								<div class="tb-textalign">
								<p>5,000원</p>
								</div>
							</td>
							<td>
								<div class="tb-textalign">
								<p>50</p>
								</div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="4">
								<div class="tb-centerContentDetail">
									<p>색상어쩌구 저쩌구</p>
								</div>
							</td>
						</tr>
						</tbody>
						<tfoot>
						<tr>
							<td colspan="5">
								<div class="tb-productPrice">
									<p>결제금액:</p>
								</div>
							</td>
						</tr>
						</tfoot>
					</table>
				</div>
				<div class="payway">
					<p>결제 방법</p>
					<div class="payway-order-info">
						무통장 입금 : <span id="bank">국민은행978452<span id="bankername">이소정</span></span><br>
						(입금 확인 후 배송 됩니다.)
					</div>
				</div>
				<div class="shipping">
					<p>배송지 정보</p>
					<div class="address-info">
						<table class="addresstable">
							<tr>
								<th>이름</th>
								<td>이소정</td>
								<th>연락처1</th>
								<td>0000</td>
								<th>연락처2</th>
								<td>0000</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="5">ㅇㅁㄹㅇㄴㅁㄴㄹㅇㄹㅇㄴㅁㄹ</td>
							</tr>
							<tr>
								<th>주문메세지</th>
								<td colspan="5">
									주문메세지 넣는칸
								</td>
						</table>
					</div>
				</div>
				<p class="order-footer">
					<label id="ordername2">이소정</label>님의 주문이 완료되었습니다.
					<br>
					<br>
					귀하의 주문확인 번호는 <span class="spanStyle">20180404171157</span>입니다.
					<br>
					귀하의 제품 구입에 따른 적립금 <span class="spanStyle">40</span>원은 배송과 함께 바로 적립이 됩니다.
					<br>
					입금방법이 무통장 입금의 경우 계좌번호를 메모하세요.
					<br>
					입금 확인 후 상품을 준비하여 배송해 드리겠습니다.
					<br>
					<br>
				</p>
				<div class="order-btns">
				<p class="btn_dark_box"><a href="#" class="btn_dark_color">주문 확인</a></p> <!-- 메인으로 가기 or 마이페이지로 가기 -->
			</div>
			</div>
			
		</section>
	</div>
</body>
</html>