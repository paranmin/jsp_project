<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="container">
	<h2>주문 상세 내역</h2>
	<div class="orderContainer">
		<p class="order_title"><span class="name">[어쩌구]</span>님께서 2018년 04월 19일에 주문하신 내역입니다.</p>
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
					<td class="center">20181222131423-231421313</td>
					<th>주문일자</th>
					<td class="center">2018.12.22</td>
				</tr>
				<tr>
					<th>주문자</th>
					<td class="center">어쩌구</td>
					<th>주문입금현황</th>
					<td class="center">미입금</td>
				</tr>
				<tr>
					<th>주문메모</th>
					<td colspan="3"></td>
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
					<td class="center">20181222131423-231421313</td>
					<th>송장번호</th>
					<td class="center">2018.12.22</td>
				</tr>
				<tr>
					<th>수취인</th>
					<td class="center">어쩌구</td>
					<th>연락처</th>
					<td class="center">미입금</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">41241 : 대구 남구 중앙대로 3412</td>
				</tr>
				<tr>
					<th>배송메세지</th>
					<td colspan="3">물건 좋은~~~~~걸로 주세요~</td>
				</tr>
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
				<col width="120">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="120">
				</colgroup>
				<tr>
					<th><input type="checkbox" id="chkAll" /></th>
					<th colspan="2">주문상품정보</th>
					<th>상품별주문번호</th>
					<th>수량</th>
					<th>가격</th>
					<th>적립</th>
					<th>처리상태</th>
					<th>배송번호</th>
				</tr>
				<tr>
					<td class="center"><input type="checkbox" name="chkItem[]" /></td>
					<td colspan="2">슬림 도형 &amp; 볼 세트 귀걸이<br>색상 : 실버/오각형[ED-16-13]-모델착용</td>
					<td class="center">20180419182553-00700237205_[1]</td>
					<td class="center">1</td>
					<td class="center">8,000원</td>
					<td class="center">80</td>
					<td class="center">결제대기</td>
					<td class="center">3452334324</td>
				</tr>
				<tr>
					<td class="center"><input type="checkbox" name="chkItem[]" /></td>
					<td colspan="2">슬림 도형 &amp; 볼 세트 귀걸이<br>색상 : 실버/오각형[ED-16-13]-모델착용</td>
					<td class="center">20180419182553-00700237205_[1]</td>
					<td class="center">1</td>
					<td class="center">8,000원</td>
					<td class="center">80</td>
					<td class="center">결제대기</td>
					<td class="center">3452334324</td>
				</tr>
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
					<td class="center">무통장</td>
					<td class="center">24,000원 (미입금)</td>
					<td class="center">우리은행 1002044003501 (예금주:유지영) 이강대</td>
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