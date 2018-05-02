<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>관리자</h1>
<nav id="main_gnb">
	<ul>
		<!-- li <c:if test="${menu == 'base'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/base/">기본설정</a></li -->
		<li <c:if test="${menu == 'product'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/product/">상품관리</a></li>
		<li <c:if test="${menu == 'order'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/order/">주문관리</a></li>
		<li <c:if test="${menu == 'member'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/member/">회원관리</a></li>
		<li <c:if test="${menu == 'board'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/board/">게시판관리</a></li>
		<li <c:if test="${menu == 'coupon'}">class="gnb_over"</c:if>><a href="${pageContext.request.contextPath}/manager/coupon/">쿠폰관리</a></li>
	</ul>
</nav>