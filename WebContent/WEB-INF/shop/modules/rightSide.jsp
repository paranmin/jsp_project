<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="right_sub_menu">
	<img src="/jsp_project/images/btn_close.gif" alt="x" class="btn_close_right">

	<div class="my_account">
		<h2>MY ACCOUNT</h2>
		<ul class="account_menu">
		<c:choose>
			<c:when test="${auth != null}">
				<li><a href="${pageContext.request.contextPath}/shop/logout.do">LOGOUT</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/shop/login.do">LOGIN</a></li>
			</c:otherwise>
		</c:choose>
			<li><a href="${pageContext.request.contextPath}/shop/cart/cart.do">CART(
			<c:choose>
					<c:when test="${cntCart > 0}"> ${cntCart}</c:when>
					<c:otherwise>0</c:otherwise>
			</c:choose>)</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/mypage/order.do">ORDER</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/mypage/mypage.do">MY PAGE</a></li>
		</ul>
	</div>

	<div class="board_menu">
		<h2>BOARD</h2>
		<ul class="account_menu">
			<li><a href="${pageContext.request.contextPath}/shop/BoardQandA.do">Q&amp;A</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/ReviewBoard.do">REVIEW</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/NoticeBoard.do">NOTICE</a></li>
		</ul>
	</div>

	<a href="https://www.instagram.com/pinkrocket_shop/"><img src="/jsp_project/images/insta.png" alt="insta" class="insta"></a>

</div>
