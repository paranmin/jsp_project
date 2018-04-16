<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="container">
	<h2>회원 목록</h2>
	<div class="searchArea">
		<form action="list.do">
			<p>
				<select name="where">
					<option value="name"<c:if test="${where == 'name'}"> selected </c:if>>이름</option>
					<option value="id"<c:if test="${where == 'id'}"> selected </c:if>>아이디</option>
					<option value="phone"<c:if test="${where == 'phone'}"> selected </c:if>>연락처</option>
				</select>
				<input type="text" name="search_query" value="${query}" />
				<input type="submit" value="검색" class="searchBtn" />
			</p>
		</form>
	</div>
	<table class="memlist">
		<colgroup>
			<col width="5%" />
			<col />
			<col width="15%" />
			<col width="13%" />
			<col width="5%" />
			<col width="8%" />
			<col width="15%" />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>이름(ID)</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>성별</th>
			<th>탈퇴여부</th>
			<th>가입일</th>
		</tr>
	<c:if test="${memList != null || memList.size() > 0}">
		<c:forEach var="mem" items="${memList}">
			<tr>
				<td class="td-center">${mem.no}</td>
				<td>${mem.name}(${mem.id})</td>
				<td class="td-center">${mem.email}</td>
				<td class="td-center">${mem.phone}<c:if test="${mem.tel != null && mem.tel != ''}"><br>(${mem.tel})</c:if></td>
				<td class="td-center">${mem.gender}</td>
				<td class="td-center">${mem.leave}</td>
				<td class="td-center"><fmt:formatDate value="${mem.regdate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		
	</c:if>
	<c:if test="${memList == null || memList.size() == 0}">
		<tr>
			<td colspan="7">등록된 회원이 없습니다.</td>
		</tr>
	</c:if>
	</table>
</div>
<script>
$(function() {
	
});
</script>
</script>
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
	<%
		session.removeAttribute("error_msg");
	%>
</c:if>