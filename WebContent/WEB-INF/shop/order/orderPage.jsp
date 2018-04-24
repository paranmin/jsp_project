<%@page import="com.dgit.mall.dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>주문하기 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderPage.css">
<style>
	tr.allProPrice td{
		
    border-top: 1px solid #EAEAEA;
		
	}
	div.orderpayway{
	
    margin-top:  40px;
    padding-left:  13px;
    border-top: 1px solid #EAEAEA;
    border-bottom: 1px solid #EAEAEA;
    padding: 10px 10px 13px;
    font-size:  13px;
    font-weight:  bold;
	
	}
	p.orderway{
	 margin-bottom:  20px;
		
	}
	div.orderpayway select{
	
    height: 30px;
    line-height:  30px;
	
	}
	div.couponinfo p{
	
    margin-top: 5px;
    font-size: 11px;
	
	}
	button.btnCoupon{
	
    border: none;
    width: 70px;
    height: 26px;
    margin-left: 10px;
	
	}
	div.OrderReac{
	
    margin-top:  40px;
    text-align:  center;
	
	}
	input.orderNow{
	
    border: none;
    width: 200px;
    height: 40px;
    background-color:  black;
    color: white;
	}
	
	input.orderReset{
	
    width:  200px;
    height:  40px;
    border: none;
	
	}
	p.final{
    font-size:  15px;
    font-weight:  bold;
    text-align:  right;
	
	}
	div.orderTable table{
		width: 100%;
	}
	th.count{
	width: 195px;
	}
	span.toalpriceorder{
		color:red;
		font-weight: bold;
		font-size: 17px;
	}
	span.orderChargePrice{
		color:red;
		font-weight: bold;
		font-size: 15px;
	}
	span.finalPrice{
	    font-size:  18px;
	    color: red;
	}
	img.sizeImg{
	    width:  100px;
	    /* height:  100px; */
	}
	td p.productname{
   	 font-weight:  bold;
	}
	.unusedelFee{
		display: none;
	}
	
</style>   
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script src="${pageContext.request.contextPath}/js/order.js"></script>
<script type="text/javascript">

function getReturnValue(returnValue) {
	 var p = $.parseJSON(returnValue);
	 $(".inputCoupon").val(p.key1);
	 $(".finalPrice").text(p.key2);
	 $("input:hidden[name='finalPrice']").val(p.key2);
}
$(function() {
	$('textarea[name="orderMsg"]').keyup(function() {
		// 텍스트영역의 길이를 체크
		var textLength = $(this).val().length,
			textCountLimit = parseInt($(".sizeContent").data("wordlimit"));

		// 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
		if (textLength > textCountLimit) {
			$(this).val($(this).val().substr(0, textCountLimit));
		}
		// 입력된 텍스트 길이를 #textCount 에 업데이트 해줌
		$('.sizeContent .msgCount').text(textLength);
	});
});

</script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section>
			<form action="order.do" method="post">
				<div id="orderContent">
					<h2>ORDER</h2>
					<p class="rightback">
						<a href="/jsp_project/shop/cart/cart.do">go back ← </a>
					</p>
					<!-- 장바구니로 돌아가기 -->
					<div class="orderList">
						<div class="orderTitle">
							<p>
								주문 상품 <span>주문정보를 작성하신 후 주문하기를 눌러주세요</span>
							</p>
						</div>
						<div class="orderTable">
							<table>
								<tr class="thColor">
									<th class="pic">사진</th>
									<th class="proName">제품명</th>
									<th class="count">수량</th>
									<th class="count">가격</th>
								</tr>
								<c:if test="${list.size()==0 }">
									<tr class="proContent">
										<td colspan="4">장바구니에 담긴 상품이 없습니다.상품을 담아주세요.</td>
									</tr>
								</c:if>
								<c:if test="${list.size()>0 }">
									<c:forEach items="${list }" var="items">
										<tr class="proContent">
											<td><img src="${pageContext.request.contextPath}/upload/${items.product.mainImg }" class="sizeImg">
												<input type="hidden" name="chkAll" value="${items.no }"><!-- 카트번호 -->
											</td>
											<td class="proNameTable">
												<table>
													<tr>
														<td><p class="productname">${items.product.name }</p></td>
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
												</table> <input type="hidden" name="proNo" value="${items.product.prdNo }"> <!-- 상품번호 -->
												<input type="hidden" name="optionYN"> <input
												type="hidden" name="optionValue" class="ttt">
											</td>
											<td>
												<p>
													<span class="productCount">${items.prdQuantity }</span>개
												</p> <input type="hidden" name="productCount">
											</td>

											<td>
												<p>
													<span class="productPrice" data-price="${items.prdOpPrice }">${items.prdOpPrice*items.prdQuantity }</span>원
													<input type="hidden" name="productPrice" value="${items.prdOpPrice*items.prdQuantity }">
												</p> 
											</td>
										</tr>
									</c:forEach>
									<tr class="allProPrice">
										<td colspan="5" class="usedelFee">
											<p>
												결제 금액 : <span class="orderChargePrice"></span>원+배송료 <span
													class="delfee">2500</span>원 = <span class="toalpriceorder"
													name="toalpriceorder"></span>원 <input type="hidden" name="orderChargePrice">
												<!-- 결제금액  -->
												<input type="hidden" value="2500" name="delfee">
												<!--배송비 -->
											</p>
										</td>
										<td colspan="5" class="unusedelFee">
											<p>
												결제 금액 : <span class="orderChargePrice"></span>원<input type="hidden" name="orderChargePrice">
											</p>
										</td>
									</tr>
								</c:if>

							</table>
						</div>
					</div>
					<div class="orderInfo">
						<p class="customerInfo">주문자 정보</p>
						<div class="custable">
							<table>
								<tr>
									<td class="grayBox">이름</td>
									<td class="paddingInput"><input type="text" name="name"
									
										readonly="readonly" value="${member.name }" class="username"></td>
									<td class="grayBox">연락처</td>
									<%
										//if(member.getPhone() != null && )
									%>
									<td class="paddingInput">
										<input type="text" name="gongIlgong" readonly="readonly" value="010"> - 
										<input type="tel" name="middleNum" class="middleNum" value="2222">
										- <input type="tel" name="lastNum" class="lastNum"
										value="2222"></td>
								</tr>
								<tr>
									<td class="grayBox">E-mail</td>
									<td colspan="3" class="paddingInput"><input type="email"
										name="email"> @ <select>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>hanmail.com</option>
									</select></td>
								</tr>
							</table>
						</div>
						
						<div class="addressInfo">
							<p class="adrInfo">배송지 정보</p>
							<input type="checkbox" name="checksamecus" class="checksameus">주문자
							정보 입력
							<div class="adrtable">
								<table>
									<tr>
										<td class="grayBox">이름</td>
										<td class="paddingInput"><input type="text" name="name"
											readonly="readonly" class="inputheight" id="orderusername"></td>
										<td class="grayBox">연락처1</td>
										<td class="paddingInput"><input type="text"
											name="gongIlgong" readonly="readonly" value="010"
											class="sizeInput"> - <input type="tel"
											name="middleNum" class="sizeInput"> - <input
											type="tel" name="lastNum" class="sizeInput"></td>
										<td class="grayBox">연락처2</td>
										<td class="paddingInput"><input type="text"
											name="gongIlgong" readonly="readonly" value="010"
											class="sizeInput"> - <input type="tel"
											name="middleNum" class="sizeInput" id="phoneNum1"> -
											<input type="tel" name="lastNum" class="sizeInput"
											id="phoneNum2"></td>
									</tr>
									<tr>
										<td class="grayBox">주소</td>
										<td colspan="5" class="paddingInput">
											<p>
												<input type="radio" name="seladdress" value="homeadr"
													class="radiosize"> 자택 <input type="radio"
													name="seladdress" value="recentadr" class="radiosize">
												최근 배송지
												<button class="adrlist"
													onclick="window.open('shipping.do', '배송지 목록', 'width=500, height=400');return false">배송지
													목록</button>
												<input type="radio" name="seladdress" value="newadr"
													class="radiosize"> 신규 배송지
											</p>
											<p>
												<input type="text" name="post1" class="post1">
												<button class="postlist"
													onclick="sample4_execDaumPostcode() ; return false">우편번호</button>
											</p>
											<p>
												<input type="text" name="basicadr" class="inputheight"
													id="inputheight2"> [기본주소]
											</p>
											<p>
												<input type="text" name="detail" class="inputheight"
													id="inputheight1"> [나머지주소]
											</p>
										</td>
									</tr>
									<tr>
										<td class="grayBox">주문메세지(100자 내외)</td>
										<td colspan="5" class="paddingInput"><textarea rows="4"
												cols="100" name="orderMsg"></textarea>
											<p class="sizeContent" data-wordlimit="100"><span class="msgCount">0</span>/100 자</p></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="orderpayway">
							<p class="orderway">결제방법</p>
							<div class="orderchoice">
								<select name="selorderway">
									<option value="CARD">신용카드</option>
									<option value="BANK">계좌이체</option>
									<option value="ONLINE">무통장입금</option>
								</select>
							</div>
						</div>
						<div class="couponUse">
							<p class="couponP">쿠폰사용</p>
							<div class="couponinfo">
								<input type="text" name="coupon" class="inputCoupon"
									readonly="readonly">
								<button class="btnCoupon">쿠폰선택</button>
								<p class="introCoupon">보유하신 쿠폰을 적용하시면 할인 또는 추가적립 혜택을 받으실 수
									있습니다.</p>
								<p class="final">
									총 결제금액 : <span class="finalPrice"></span>원
									<input type="hidden" name="finalPrice">
								</p>
							</div>
						</div>

						<div class="OrderReac">
							<input type="submit" value="주문하기" class="orderNow" name="orderNow"><input
								type="reset" value="주문취소" class="orderReset">
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	

</body>
</html>
