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
<link rel="stylesheet" href="../../css/orderPage.css">
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />
		
		<section>
			<div id="orderContent">
			<h2>ORDER</h2> <p><a href="#">go back ← </a></p> <!-- 장바구니로 돌아가기 -->
			<div class="orderList">
				<div class="orderTitle">
					<p>주문 상품 <span>주문정보를 작성하신 후 주문하기를 눌러주세요</span></p>
				</div>
				<div class="orderTable">
					<table>
						<tr class="thColor">
							<th class="pic">사진</th>
							<th class="proName">제품명</th>
							<th class="count">수량</th>
							<th class="count">적립</th>
							<th class="count">가격</th>
						</tr>
						<tr class="proContent">
							<td><img src="../../images/J1.jpg" class="proImg"></td>
							<td class="proNameTable">
								<table>
									<tr>
										<td><p>베이직 실리콘 귀걸이</p></td>
									</tr>
									<tr>
										<td class="proNamehr"><p>옵션:[EX---]</p></td>
									</tr>
								</table>
							</td>
							<td>
								<p>1개</p>
							</td>
							<td>
								<p>40원</p>
							</td>
							<td>
								<p>1500원</p>
							</td>
						</tr>
						<tr class="allProPrice">
							<td colspan="5"><p>총 결제 금액:</p></td>
						</tr>	
					</table>
				</div>
			</div>
			
		</div>
	</section>	
	</div>
	

</body>
</html>
