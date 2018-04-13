<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	div.table{
		width: 80%;
		margin:0 auto;
	}
	table{
		margin-top: 100px;
		border-collapse: collapse;
	}
	tr,th,td{
		border:1px solid black;
	}
	table th.width1{
		width: 200px;
	}
	table th.width2{
		width: 500px;
	}
	table th.width3{
		width: 250px;
	}
	td.text1{
		text-align: right;
	}
	td.text2{
		padding-left: 20px;
	}
	td.text3{
		text-align: center;
	}
</style>
</head>
<body>
	<form action="list.do" method="get">
		<div class="table">
			<table>
				<tr>
					<th class="width1">쿠폰 번호</th>
					<th class="width2">쿠폰 명</th>
					<th class="width1">쿠폰 사용 가능 금액</th>
					<th class="width1">할인 금액</th>
					<th class="width3">쿠폰 사용 기한</th>
				</tr>
				<c:if test="${list.size()==0 }">
					<tr>
						<td colspan="5">쿠폰이 없습니다. 쿠폰을 등록해주세요</td>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<c:forEach var="items" items="${list }">
						<tr>
							<td class="text1">${items.cNo }</td>
							<td class="text2">${items.cName }</td>
							<td class="text1">${items.cuseMorePrice }원 이상</td>
							<td class="text1">${items.csalePrice }원</td>
							<td class="text3"><fmt:formatDate value="${items.climitDate }" pattern="yyy-MM-dd"/>까지</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</form>

</body>
</html>