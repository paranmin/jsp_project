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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartPage.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		
		<section>
			<div id="cartContent">
				<h2>CART</h2> <p><a href="#">go back ← </a></p> <!-- 상품상세페이지로 돌아가기 -->
				<div class="cartList">
					<div class="cartTable">
						<table>
							<tr class="thColor">
								<th class="checkbok"><input type="checkbox"></th>
								<th class="pic">사진</th>
								<th class="proName">제품명</th>
								<th class="count">수량</th>
								<th class="count">적립</th>
								<th class="count">가격</th>
								<th class="cancel">취소</th>
							</tr>
							<tr class="proContent">
								<td><input type="checkbox"></td>
								<td><img src="../../images/J1.jpg" class="proImg"></td>
								<td class="proNameTable">
									<table>
										<tr>
											<td>베이직 실리콘 귀걸이</td>
										</tr>
										<tr>
											<td class="proNamehr">옵션:[EX---]</td>
										</tr>
									</table>
								</td>
								<td class="numcount">
									<button class="plus">+</button>
									<input type="text" class="cartnum" value="1">
									<button class="minus">-</button>
									<button class="numupdate">수정</button>
								</td>
								<td>
									40원
								</td>
								<td>
									1500원
								</td>
								<td>
									<button class="delete">삭제하기</button>
								</td>
							</tr>
							<tr class="allProPrice">
								<td colspan="7"><p>총 결제 금액:</p></td>
							</tr>	
						</table>
					</div>
					<div class="notice">
					35,000원 미만의 주문은 배송료를 청구합니다.
					</div>
					<div id="buttons">
						<button id="clean_cart">장바구니 비우기</button>
						<button id="select_del">선택삭제</button>
						<!-- <button>견적서출력</button> -->
						<button id="go_order">주문하기</button>
						<button id="go_shop">계속 쇼핑하기</button>
					</div>
				</div>
				
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
	

</body>
</html>
