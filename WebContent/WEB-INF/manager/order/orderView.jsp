<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="container">
	<h2>주문 상세 내역</h2>
	<div class="orderContainer">
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
			<form action="viewOrder.do?no=${no}" method="post">
			<p class="orderMenu">
				선택한 상품을
				<select name="orderStatueTop">
					<option value="">상품상태</option>
					<option value="o1">입금대기</option>
					<option value="o2">결제완료</option>
					<option value="d1">상품준비중</option>
					<option value="d2">배송중</option>
					<option value="d3">배송완료</option>
					<option value="e1">구매확정</option>
				</select>
				<a href="#">일괄적용</a>
			</p>
			<table>
				<colgroup>
				<col width="40">
				<col width="80">
				<col width="*">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="120">
				</colgroup>
				<tr>
					<th><input type="checkbox" id="chkAll" /></th>
					<th colspan="2">주문상품정보</th>
					<th>수량</th>
					<th>가격</th>
					<th>처리상태</th>
					<th>배송번호</th>
				</tr>
			<c:forEach var="item" items="${ordPrdList}">
				<tr>
					<td class="center"><input type="checkbox" name="chkItem[]" /></td>
					<td colspan="2">${item.prdNo.name } <c:if test="${item.opOption != 'N'}"><br>옵션 : ${item.opOption}</c:if></td>
					<td class="center">${item.opQuantity}</td>
					<td class="center"><fmt:formatNumber value="${item.opSellingPrice}" pattern="#,###" /> 원</td>
					<td class="center">결제완료</td>
					<td class="center">배송번호 출력</td>
				</tr>
			</c:forEach>
			</table>
			<p class="orderMenu">
				선택한 상품을
				<select name="orderStatueBottom">
					<option value="">상품상태</option>
					<option value="o1">입금대기</option>
					<option value="o2">결제완료</option>
					<option value="d1">상품준비중</option>
					<option value="d2">배송중</option>
					<option value="d3">배송완료</option>
					<option value="e1">구매확정</option>
				</select>
				<a href="#">일괄적용</a>
			</p>
			</form>
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
</div>
<script>
$(function() {
	$("#chkAll").on("click", function() {
		if ($(this).is(":checked")) {
			$("input[name='chkItem[]']").prop("checked", true);
		} else {
			$("input[name='chkItem[]']").prop("checked", false);
		}
	});
	$("input[name='chkItem[]']").on("change", function() {
		var chkCount = $("input[name='chkItem[]']").length,
			checkedCount = $("input[name='chkItem[]']:checked").length;
		if ($("input[name='chkItem[]']:checked").length == 0) {
			$("#chkAll").prop("checked", false);
		}
		if (chkCount == checkedCount) {
			$("#chkAll").prop("checked", true);
		}
	});
});
</script>
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
	<%
		session.removeAttribute("error_msg");
	%>
</c:if>