<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	tfoot td{
	
    border-top: 1Px solid #EAEAEA;
    border-bottom:  1px solid #EAEAEA;
    padding: 20px;
	
	}
	.sizeImg{
	width: 90px;
	}
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="../../css/base.css" media="all" />
<link rel="stylesheet" href="../../css/orderComplete.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("tbody").each(function(i,obj){
		var optionYN = $(".option").eq(i).text();
		if(optionYN == "N"){
			 $(".option").text("");
		}
	})
	
	
	if($(".fee").text()==0){
		$(".delivery").css("display","none");
		$(".totalprice").css("display","none");
	}else if($(".fee").text()!=0){
		var total = parseInt($(".total").text());
		var fee = parseInt($(".fee").text());
		$(".totalwon").text(total+fee);
		$(".delivery").css("display","inline-block");
		$(".totalprice").css("display","inline-block");
	}
})
</script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		
		<section>
		<form action="orderComplete.do" method="post">
			<div class="orderCom">
				<h2>ORDER</h2>
				<div class="orderComTitle">
					<p>주문 상품</p>
						<table>
							<tr class="firstline">
								<th class="purchaseSub"></th>
								<th id="purchaseName">구입상품명</th>
								<th class="purchaseSub">수량</th>
								<th class="purchaseSub">가격</th>
							</tr>
							<c:if test="${ordpdlist.size() > 0}">

								<tbody>
									<c:forEach items="${ordpdlist }" var="items">
										<tr>
											<td rowspan="2">
												<div class="tb-centerImg">
													<img
														src="${pageContext.request.contextPath}/upload/${items.prdNo.mainImg }"
														class="sizeImg">
												</div>
											</td>
											<td>
												<div class="tb-centerContent">
													<p>${items.prdNo.name }</p>
												</div>
											</td>
											<td rowspan="2">
												<div class="tb-textalign">
													<p>${items.opQuantity }</p>
												</div>
											</td>
											<td rowspan="2">
												<div class="tb-textalign">
													<p>${items.opSellingPrice * items.opQuantity}</p>
												</div>
											</td>
										</tr>
										<tr>

											<td>
												<div class="tb-centerContentDetail">
													<p class="option">${items.opOption }</p>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>

							</c:if>
					
							<tfoot>
								<tr>
									<td colspan="5">
										<div class="tb-productPrice">
											<p>결제금액:<span class="total">${order.ordPrice }</span>원<span class="delivery"> + 배송비:<span class="fee">${order.deliveryFee }</span>원</span>
												<span class="totalprice">= 총 결제 금액 : <span class="totalwon"></span>원</span>
											</p>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				<c:if test="${order.type == 'BANK' }">
					<div class="payway">
						<p>결제 방법</p>
						<div class="payway-order-info">
							무통장 입금 : <span id="bank">국민은행978452<span id="bankername">이소정</span></span><br>
							(입금 확인 후 배송 됩니다.)
						</div>
					</div>
				</c:if>
				<div class="shipping">
					<p>배송지 정보</p>
					<div class="address-info">
					<c:if test="${order ne null }">
						<table class="addresstable">
							<tr>
								<th>이름</th>
								<td>${order.receiver }</td>
								<th>연락처1</th>
								<td>${order.rcPhone1 }</td>
								<th>연락처2</th>
								<td>${order.rcPhone2 }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="5">${order.address.addr1 } <span>/</span>${order.address.addr2 } </td>
							</tr>
							<tr>
								<th>주문메세지</th>
								<td colspan="5">
									${order.ordMessage }
								</td>
						</table>
					</c:if>
					</div>
				</div>
				
				<p class="order-footer">
					<label id="ordername2">${member.name }</label>님의 주문이 완료되었습니다.
					<br>
					<br>
					귀하의 주문확인 번호는 <span class="spanStyle">${order.ordNo }</span>입니다.
					<br>
					입금방법이 무통장 입금의 경우 계좌번호를 메모하세요.
					<br>
					입금 확인 후 상품을 준비하여 배송해 드리겠습니다.
					<br>
					<br>
				</p>
				
				<div class="order-btns">
				<p class="btn_dark_box"><a href="${pageContext.request.contextPath}/sshop/mypage/order.do" class="btn_dark_color">주문 확인</a></p> <!-- 메인으로 가기 or 마이페이지로 가기 -->
			</div>
			
			</div>
			</form>
		</section>
	</div>
</body>
</html>