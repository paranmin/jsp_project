<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - SJ JEWELRY</title>
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
button.selectBtn{
	border: none;
	width: 50px;
    height: 20px;
}
a{
	color:black;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1>상품 리스트 보기</h1>
	<form action="list.do" method="post" id="cate">
		상품 카테고리
		<select name="cate">
			<option value="All" <c:if test="${cate=='All' }"> selected="selected" </c:if>>All</option>
			<option value="귀걸이" <c:if test="${cate=='귀걸이' }"> selected="selected" </c:if>>귀걸이</option>
			<option value="이어커프" <c:if test="${cate=='이어커프' }"> selected="selected" </c:if>>이어커프</option>
			<option value="목걸이" <c:if test="${cate=='목걸이' }"> selected="selected" </c:if>>목걸이</option>
			<option value="팔찌" <c:if test="${cate=='팔찌' }"> selected="selected" </c:if>>팔찌</option>
			<option value="발찌" <c:if test="${cate=='발찌' }"> selected="selected" </c:if>>발찌</option>
			<option value="반지" <c:if test="${cate=='반지' }"> selected="selected" </c:if>>반지</option>
			<option value="발가락지/토링" <c:if test="${cate=='발가락지/토링' }"> selected="selected" </c:if>>발가락지/토링</option>
			<option value="헤어 ACC" <c:if test="${cate=='헤어 ACC' }"> selected="selected" </c:if>>헤어 ACC</option>
			<option value="시계" <c:if test="${cate=='시계' }"> selected="selected" </c:if>>시계</option>
			<option value="폰 ACC" <c:if test="${cate=='폰 ACC' }"> selected="selected" </c:if>>폰 ACC</option>
			<option value="기타" <c:if test="${cate=='기타' }"> selected="selected" </c:if>>기타</option>
		</select>
		상품명
		<input type="text" name="selectName" <c:if test="${name!=null }"> value="${name}" </c:if>>   
		<button class="selectBtn">검색</button>
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
					<td><a href="update.do?no=${item.prdNo }">${item.name }</a></td>
					<td>${item.cost }</td>
					<td>${item.discountPer }</td>
					<td>${item.sellingPrice }</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
</body>
</html>