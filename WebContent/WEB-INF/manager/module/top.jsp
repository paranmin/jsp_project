<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>관리자</h1>
<nav id="main_gnb">
	<ul>
		<li><a href="${pageContext.request.contextPath}/manager/site/">기본설정</a></li>
		<li><a href="${pageContext.request.contextPath}/manager/product/">상품관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manager/order/">주문관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manager/member/">회원관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manager/board/">게시판관리</a></li>
	</ul>
</nav>