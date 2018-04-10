<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="../../css/base.css" media="all" />
<link rel="stylesheet" href="../../css/orderPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		
		<section>
			<div id="orderContent">
			<h2>ORDER</h2> <p class="rightback"><a href="#">go back ← </a></p> <!-- 장바구니로 돌아가기 -->
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
								<p>1500원</p>
							</td>
						</tr>
						<tr class="allProPrice">
							<td colspan="5"><p>결제 금액:</p></td>
						</tr>	
					</table>
				</div>
			</div>
			<div class="orderInfo">
				<p class="customerInfo">주문자 정보</p>
				<div class="custable">
					<table>
						<tr>
							<td class="grayBox">이름</td>
							<td class="paddingInput"><input type="text" name="name" readonly="readonly"></td>
							<td class="grayBox">연락처</td>
							<td class="paddingInput">
								<input type="text" name="gongIlgong" readonly="readonly" value="010">
								-
								<input type="tel" name="middleNum">
								-
								<input type="tel" name="lastNum">
							</td>
						</tr>
						<tr>
							<td class="grayBox">E-mail</td>
							<td colspan="3" class="paddingInput"><input type="email" name="email"> @ 
								<select>
									<option>naver.com</option>
									<option>gmail.com</option>
									<option>hanmail.com</option>
								</select>
							</td>
						</tr>	
					</table>
				</div>
			<div class="addressInfo">
				<p class="adrInfo">배송지 정보</p><input type="checkbox" name="checksamecus">주문자 정보 입력
				<div class="adrtable">
					<table>
						<tr>
							<td class="grayBox">이름</td>
							<td class="paddingInput"><input type="text" name="name" readonly="readonly" class="inputheight"></td>
							<td class="grayBox">연락처1</td>
							<td class="paddingInput">
								<input type="text" name="gongIlgong" readonly="readonly" value="010" class="sizeInput" >
								-
								<input type="tel" name="middleNum" class="sizeInput">
								-
								<input type="tel" name="lastNum" class="sizeInput">
							</td>
							<td class="grayBox">연락처2</td>
							<td class="paddingInput">
								<input type="text" name="gongIlgong" readonly="readonly" value="010" class="sizeInput">
								-
								<input type="tel" name="middleNum" class="sizeInput">
								-
								<input type="tel" name="lastNum" class="sizeInput">
							</td>
						</tr>
						<tr>
							<td class="grayBox">주소</td>
							<td colspan="5" class="paddingInput">
								<p><input type="radio" name="seladdress" value="homeadr" class="radiosize"> 자택
								<input type="radio" name="seladdress" value="recentadr" class="radiosize"> 최근 배송지 <button class="adrlist">배송지 목록</button>
								<input type="radio" name="seladdress" value="newadr" class="radiosize"> 신규 배송지</p>
								<p><input type="text" name="post1" class="post1"> - <input type="text" name="post2" class="post1"> <button class="postlist">우편번호</button></p>
								<p><input type="text" name="basicadr" class="inputheight" id="inputheight2"> [기본주소]</p>
								<p><input type="text" name="detail" class="inputheight"  id="inputheight1"> [나머지주소]</p>
							</td>
						</tr>
						<tr>
							<td class="grayBox">주문메세지(100자 내외)</td>
							<td colspan="5" class="paddingInput">
								<textarea rows="4" cols="100"></textarea>
								<p class="sizeContent">0/70 bytes (* 영문/숫자 기준 70자, 한글 기준 35자까지 입력 가능합니다.)</p>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="orderpayway">
				<p class="orderway">결제방법</p>
				<div class="orderchoice">
					<select name="selorderway">
						<option value="신용카드">신용카드</option>
						<option value="계좌이체">계좌이체</option>
						<option value="무통장입금">무통장입금</option>
					</select>
				</div>
			</div>
			<div class="couponUse">
				<p class="couponP">쿠폰사용</p>
				<div class="couponinfo">
					<input type="text" name="coupon" class="inputCoupon" readonly="readonly">
					<button class="btnCoupon" onclick="window.open('coupon.jsp', '쿠폰 적용', 'width=450, height=550')">쿠폰선택</button><p class="introCoupon">보유하신 쿠폰을 적용하시면 할인 또는 추가적립 혜택을 받으실 수 있습니다.</p>
					<p class="final">총 결제금액 : <span class="finalPrice"></span></p>
				</div>
			</div>
			
			<div class="OrderReac">
				<input type="submit" value="주문하기" class="orderNow">
				<input type="reset" value="주문취소" class="orderReset">
			</div>
		</div>
			
		</div>
		
	</section>	
	</div>
	

</body>
</html>
