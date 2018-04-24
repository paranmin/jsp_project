<%@page import="java.util.List"%>
<%@page import="com.dgit.mall.dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SJ JEWELRY</title>
<style>
.prdplusdel {
	font-size: 18px;
	color: red;
	font-weight: bold;
}

td.emptycart p {
	text-align: center;
	height: 100px;
	line-height: 100px;
	font-size: 15px;
	font-weight: bold;
}


</style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cartPage.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js?a=12"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section>
			<div id="cartContent">
				<h2>CART</h2>
				<p class="goback">
					<a class="gobackpage">go back ← </a>
				</p>
				<!-- 상품상세페이지로 돌아가기 -->
				<form action="cart.do" method="post">
					<div class="cartList">
						<div class="cartTable">
							<table>
								<tr class="thColor">
									<th class="checkbok"><input type="checkbox"
										name="checkPro" checked="checked"></th>
									<th class="pic">사진</th>
									<th class="proName">제품명</th>
									<th class="count">수량</th>
									<th class="count">가격</th>
									<th class="cancel">취소</th>
								</tr>
								<c:if test="${list.size()==0 }">
									<tr class="proContent">
										<td colspan="6" class="emptyCartt">장바구니에 담긴 상품이 없습니다. 상품을 담아주세요.</td>
									</tr>
								</c:if>
								<c:if test="${list.size()>0 }">
									<c:forEach var="items" items="${list }">
										<tr class="proContent">
											<td><input type="checkbox" name="chkAll"
												value="${items.no }">
												<input type="hidden" name="buyingMem" value="${items.member.no }"></td>
											<td><img src="${pageContext.request.contextPath}/upload/${items.product.mainImg }"
												class="proImg"></td>
											<input type="hidden" name="proImg">
											<td class="proNameTable">
												<table>
													<tr>
														<td class="prdName">${items.product.name }</td>
													</tr>
													<c:if test="${items.prdOpName==null || items.prdOpName==''}">
														<tr>
															<td></td>
														</tr>
													</c:if>
													<c:if test="${items.prdOpName!=null && items.prdOpName!=''}">
														<tr>
															<td class="proNamehr">옵션:<span class="optionname">${items.prdOpName }</span></td>
														</tr>
													</c:if>
													
												</table> <input type="hidden" name="prdName"> <input
												type="hidden" name="proNamehr">
											</td>
											<td class="numcount">
												<button class="plus">+</button> <input type="text"
												class="cartnum" value="${items.prdQuantity }" name="cartnum">
												
												<button class="minus">-</button> <input type="hidden"
												name="stock" value="${items.optiondetail.podStock }">
											</td>
											<td><span class="productPrice"
												data-price="${items.prdOpPrice }">${items.prdOpPrice*items.prdQuantity }</span>원</td>
											<input type="hidden" name="productPrice" class="prdPr">
											<td>
												<button class="delete">삭제하기</button>
											</td>
										</tr>
									</c:forEach>
								
								
								<tr class="allProPrice">
									<td colspan="6" class="firstTd"><p>
											총 결제 금액:<span class="prdsPrice"></span>원+배송료 <span
												class="deliveryfee">2500</span>원 = <span class="prdplusdel"></span>원
											<input type="hidden" name="prdsPrice">
										</p></td>
									<td colspan="6" class="secondTd"><p>
											총 결제 금액:<span class="prdsPrice2"></span>원<input type="hidden"
												name="prdsPrice2">
										</p></td>
								</tr>
							</c:if>
							</table>
						</div>
						<div class="notice">35,000원 미만의 주문은 배송료를 청구합니다.</div>
						<div id="buttons">
							<button id="clean_cart">장바구니 비우기</button>
							<button id="select_del">선택삭제</button>
							<!-- <button>견적서출력</button> -->
							<button id="go_order">주문하기</button>
							<button id="go_shop">계속 쇼핑하기</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		<c:import url="../modules/footer.jsp" />
	</div>
	<script type="text/javascript">

		$("#go_shop").click(function(){
			location.href = "<%=request.getContextPath()%>/shop/showList.do";
			return false;
		})
	</script>
</body>
</html>
