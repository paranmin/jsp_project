<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align: center;
	margin-top:20px;
}
form#cate{
	margin:0 auto;   
	width:80%;
}
table{
	margin:10px auto;
	width:80%;
	text-align: center;
}
table td:nth-child(1){
	width:10%;
}
table td:nth-child(2){
	width:10%;
}
table td:nth-child(3){
	text-align: left;
	padding-left: 20px;
	width:50%;
}
table td:nth-child(4){
	width:10%;
}
table td:nth-child(5){
	width:10%;
}
table td:nth-child(6){
	width:10%;
}
table th{
	background: gainsboro;
}
button#selectBtn{
	border: none;
	width: 50px;
    height: 20px;
}
a{
	color:black;
	text-decoration: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function(){
	$("button#selectBtn").click(function(){
		$.post("list.do", $("#form").serialize());
	});
});
</script>
</head>
<body>
	<h1>상품 리스트 보기</h1>
	<form action="list.do" method="post" id="cate">
		상품 카테고리
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
		<button id="selectBtn">검색</button>
	</form>
	<table>
		<tr>	
			<th>분류</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>상품 가격</th>
			<th>할인</th>
			<th>할인가</th>
		<tr>
		<c:if test="${list.size() == 0 }">
			<tr>
				<td colspan="6">
					등록된 상품이 없습니다.
				</td>
			</tr>
		</c:if>	
		<c:if test="${list.size() > 0 }">
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.category }</td>
					<td>${item.prdNo }</td>
					<td><a href="read.do?no=${item.prdNo }">${item.name }</a></td>
					<td>${item.cost }</td>
					<td>${item.discountPer }</td>
					<td>${item.sellingPrice }</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
</body>
</html>