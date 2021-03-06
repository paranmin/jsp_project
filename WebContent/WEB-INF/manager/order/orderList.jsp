<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui/jquery-ui.min.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui/jquery-ui.theme.css" media="all" />
<div id="container">
	<h2>주문 목록</h2>
	<div class="searchArea">
		<form action="list.do">
			<table>
				<colgroup>
					<col width="140">
					<col width="*">
				</colgroup>
				<tr>
					<th>검색어</th>
					<td>
						<select name="where">
							<option value="all">통합검색</option>
							<option value="orderNo"<c:if test="${where == 'orderNo'}"> selected="selected" </c:if>>주문번호</option>
							<option value="orderName"<c:if test="${where == 'orderName'}"> selected="selected" </c:if>>주문자명</option>
							<option value="orderPhone"<c:if test="${where == 'orderPhone'}"> selected="selected" </c:if>>주문자 휴대폰 번호</option>
							<option value="orderEmail"<c:if test="${where == 'orderEmail'}"> selected="selected" </c:if>>주문자 이메일</option>
							<option value="receiverName"<c:if test="${where == 'receiverName'}"> selected="selected" </c:if>>수령자명</option>
							<option value="receiverPhone"<c:if test="${where == 'receiverPhone'}"> selected="selected" </c:if>>수령자 휴대폰 번호</option>
							<option value="id"<c:if test="${where == 'id'}"> selected="selected" </c:if>>아이디</option>
						</select>
						<input type="text" name="query" value="${query }"/>
					</td>
				</tr>
				<!-- tr>
					<th>기간검색</th>
					<td>
						<select name="targetDate">
							<option value="orderDT">주문일</option>
							<option value="paymentDT">결제확인일</option>
						</select>
						<input type="text" name="startDate" id="startDate" /> <label for="startDate"><i class="far fa-calendar-alt"></i></label> ~ <input type="text" name="endDate" id="endDate" /> <label for="endDate"><i class="far fa-calendar-alt"></i></label>
					</td>
				</tr -->
			</table>
			<p><input type="submit" value="검색" /></p>
		</form>
	</div>
	<table class="orderlist">
		<colgroup>
			<col width="30">
			<col width="110">
			<col width="150">
			<col width="120">
			<col width="*">
			<col width="90">
			<col width="90">
			<col width="90">
			<col width="90">
			<col width="90">
			<col width="90">
		</colgroup>
		<tr>
			<th><input type="checkbox" id="chkAllOrder" /></th>
			<th>주문일시</th>
			<th>주문번호</th>
			<th>주문자</th>
			<th>주문상품</th>
			<th>총 상품금액</th>
			<th>총 배송비</th>
			<th>총 주문금액</th>
			<th>결제방법</th>
			<th>결제상태</th>
			<th>처리상태</th>
		</tr>
	<c:if test="${orderList ne null && orderList.size() > 0}">
		<c:forEach var="order" items="${orderList}">
			<tr>
				<td class="td-center"><input type="checkbox" name="chkOrder[]" /></td>
				<td class="td-center"><fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd"/></td>
				<td class="td-center"><a href="viewOrder.do?no=${order.ordNo}">${order.ordNo}</a></td>
				<td class="td-center">${order.member.name }<br>(${order.member.id})</td>
				<td>${orderProduct.get(order.ordNo)}</td>
				<td class="td-center"><fmt:formatNumber value="${order.ordPrice}" pattern="#,###"/> 원</td>
				<td class="td-center"><fmt:formatNumber value="${order.deliveryFee}" pattern="#,###"/> 원</td>
				<td class="td-center"><fmt:formatNumber value="${order.ordPrice + order.deliveryFee}" pattern="#,###"/> 원</td>
				<td class="td-center">${order.type}</td>
				<td class="td-center">미결제</td>
				<td class="td-center">미배송</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${orderList eq null || orderList.size() == 0}">
		<tr>
			<td colspan="11" class="td-center">등록된 주문이 없습니다.</td>
		</tr>
	</c:if>
	</table>
	<c:if test="${paging ne null || paging != ''}">
	<div class="pagingArea">
		${paging}
	</div>
	</c:if>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script>
$(function() {
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});
	$("input[name='startDate']").datepicker({format: 'yy-mm-dd'});
	$("input[name='endDate']").datepicker({format: 'yy-mm-dd'});
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