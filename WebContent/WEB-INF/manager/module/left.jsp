<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${menu == 'product'}">
		<ul>
			<li><a href="add.do">상품등록</a></li>
			<li><a href="list.do">상품목록</a></li>
			
		</ul>
	</c:when>
	<c:when test="${menu == 'order'}">
		<ul>
			<li><a href="list.do">주문목록</a></li>
		</ul>
	</c:when>
	<c:when test="${menu == 'member'}">
		<ul>
			<li><a href="list.do">회원목록</a></li>
			<li><a href="register.do">회원등록</a></li>
		</ul>
	</c:when>
	<c:when test="${menu == 'board'}">
		<ul>
			<li><a href="list.do">게시판 목록</a></li>
			<li><a href="adminBoard.do?brdcode=NoticeBoard">글 목록</a></li>
			<li><a href="BoardNoticeForm.do">공지 글 작성</a></li>
		</ul>
	</c:when>
	<c:when test="${menu == 'coupon'}">
		<ul>
			<li><a href="list.do">쿠폰 목록</a></li>
			<li><a href="regi.do">쿠폰 등록</a></li>
			<li><a href="regiuser.do">회원 쿠폰 제공 등록</a></li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul>
			<li><a href="#">기본설정</a></li>
		</ul>
	</c:otherwise>
</c:choose>
