<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align: center;
}
div.table{
	margin:0 auto;
	width:50%;
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>상품 리스트 보기</h1>
	<div class="table">상품 카테고리
	<select name="cate">
		<option>All</option>
		<option>귀걸이</option>
		<option>이어커프</option>
		<option>목걸이</option>
		<option>팔찌</option>
		<option>발찌</option>
		<option>반지</option>
		<option>발가락지/토링</option>
		<option>헤어 CSS</option>
		<option>시계</option>
		<option>폰 ACC</option>
		<option>기타</option>
	</select>
	<table>
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>상품 가격</th>
			<th>할인</th>
			<th>할인가</th>
		<tr>
		<tr>
			<td>20180409</td>
			<td>귀걸이</td>
			<td>반짝거리는 큐빅귀걸이</td>
			<td>10,000</td>
			<td>10%</td>
			<td>9,000</td>
		</tr>
	</table>
	</div>
</body>
</html>