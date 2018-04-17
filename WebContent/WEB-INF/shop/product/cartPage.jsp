<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	.prdplusdel{
		font-size: 18px;
		color:red;
		font-weight: bold;
	}
	td.emptycart p{
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//checked 작업
		var flag = $("input:checkbox[name='checkPro']").is(":checked");
		if(flag == true){
			$("input:checkbox[name='chkAll']").prop("checked",true);
		}
		
		$("input:checkbox[name='checkPro']").click(function(){
			var flag = $("input:checkbox[name='checkPro']").is(":checked");
			if(flag == false){
				$("input:checkbox[name='chkAll']").prop("checked",false);
			}else if(flag == true){
				$("input:checkbox[name='chkAll']").prop("checked",true);
			}
		})
		//수량 카운트 작업,가격작업
		var count = $(".cartnum").val();
		var str = parseInt($(".productPrice").text());
		$("input:hidden[name='productPrice']").val(str);
		$(".prdsPrice").text(str);
		$(".prdplusdel").text(str+2500);
		$(".plus").click(function(){
			count++;
			$(".cartnum").val(count);
			$(".productPrice").text(str*count);
			if(count>10){
				alert("상품 한개당 10개 이하로만 주문 하실 수 있습니다.");
				$(".cartnum").val(10);
				$(".productPrice").text(10*str);
				return false;
			}
			var productPrice1 = parseInt($(".productPrice").text());
			$(".prdsPrice").text(productPrice1);
			$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
			$("input:hidden[name='productPrice']").val($(".productPrice").text());
			$(".prdplusdel").text(productPrice1+2500);
			return false;
		})
		$(".minus").click(function(){
			count--;
			$(".cartnum").val(count);
			$(".productPrice").text(str*count);
			if(	$(".cartnum").val()<=1){
				$(".cartnum").val(1);
				$(".productPrice").text(1*str);
				return false;
			}
			var productPrice1 = parseInt($(".productPrice").text());
			$(".prdsPrice").text(productPrice1);
			$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
			$("input:hidden[name='productPrice']").val($(".productPrice").text());
			$(".prdplusdel").text(productPrice1+2500);
			return false;
		})
		$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
		
		//상품 삭제 (삭제버튼으로) -- 각각 삭제
		$(".delete").click(function(){
			$(this).parent().parent().remove();
		})
		//장바구니 비우기
		$("#clean_cart").click(function(){
			$(".proContent").children().remove();
			$(".allProPrice").remove();
			$(".proContent").wrap("<td colspan='6' class='emptycart' />");
			$(".emptycart").html("<p>장바구니에 담겨있는 상품이 없습니다.</p>");
		})
		//선택 삭제
		$("#select_del").click(function(){
			var flag = $("input:checkbox[name='checkPro']").is(":checked");
			if(flag == true){
				$("input:checkbox[name='chkAll']").parent().parent().remove();
			}
		})
		//상품 번호 번호(체크박스) 숫자 임의로 넣음 ->나중에 수정하기
		
		//상품 옵션 input val
		var oprionname = $(".optionname").text();
		$("input:hidden[name='proNamehr']").val(oprionname);
		
		//상품 이름
		var name = $(".prdName").text();
		$("input:hidden[name='prdName']").val(name);
		
		//상품 이미지
		$("#go_order").click(function(){
			var imgsrc =$(".proImg").attr("src");
			var src = imgsrc.split("/");
			$("input:hidden[name='proImg']").val(src[src.length-1]);
			console.log($("input:hidden[name='proImg']").val());
		})
	
		
	})
</script>
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
					<a href="#">go back ← </a>
				</p>
				<!-- 상품상세페이지로 돌아가기 -->
				<form action="cart.do" method="post">
				<div class="cartList">
					<div class="cartTable">
						<table>
							<tr class="thColor">
								<th class="checkbok"><input type="checkbox" name="checkPro"
									checked="checked"></th>
								<th class="pic">사진</th>
								<th class="proName">제품명</th>
								<th class="count">수량</th>
								<th class="count">가격</th>
								<th class="cancel">취소</th>
							</tr>
							<c:if test="${list.size()==0 }">
								<tr class="proContent">
									<td colspan="6">장바구니에 담긴 상품이 없습니다. 상품을 담아주세요.</td>
								</tr>
							</c:if>
								<c:if test="${list.size()>0 }">
									<c:forEach var="items" items="${list }">
										<tr class="proContent">
											<td><input type="checkbox" name="chkAll" value="${list.prdNo }"></td>
											<td><img src="../../images/${list.mainImg }" class="proImg"></td>
											<input type="hidden" name="proImg">
											<td class="proNameTable">
												<table>
													<tr>
														<td class="prdName">${list.name }</td>
													</tr>
													<tr>
														<td class="proNamehr">옵션:<span class="optionname">${list.ctPrdOpname }</span></td>

													</tr>
												</table> <input type="hidden" name="prdName"> <input
												type="hidden" name="proNamehr">
											</td>
											<td class="numcount">
												<button class="plus">+</button> <input type="text"
												class="cartnum" value="1" name="cartnum">
												<button class="minus">-</button>
											</td>
											<td><span class="productPrice">${list.sellingPrice }</span>원</td>
											<input type="hidden" name="productPrice">
											<td>
												<button class="delete">삭제하기</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<tr class="allProPrice">
								<td colspan="6"><p>
										총 결제 금액:<span class="prdsPrice"></span>원+배송료 2,500원 = <span
											class="prdplusdel"></span>원
											<input type="hidden" name="prdsPrice">
									</p></td>
							</tr>
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
</body>
</html>
