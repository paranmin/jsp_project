<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<div class="main_header">
		<h1 class="title"><a href="${pageContext.request.contextPath}/shop/main.do">SJ JEWELRY</a></h1>
		<div class="btn_search"><input type="text" name="main_search" /> <i class="fa fa-search"></i></div>
		<nav>
			<div class="main_nav">
				<ul class="nav category_nav">
					<li><a href="#">JEWELRY</a>
						<ul class="sub_nav">
							<li><a href="#">귀걸이 - Earring</a></li>
							<li><a href="#">이어커프 - Earcuff</a></li>
							<li><a href="#">목걸이 - Necklace</a></li>
							<li><a href="#">팔찌 - Bracelet</a></li>
							<li><a href="#">발찌 - Anklet</a></li>
							<li><a href="#">반지 - Ring</a></li>
							<li><a href="#">발가락지/토링 - Toe ring</a></li>
							<li><a href="#">헤어 ACC - Hair ACC</a></li>
							<li><a href="#">시계 - Watch</a></li>
							<li><a href="#">폰 ACC - Phone ACC</a></li>
							<li><a href="#">기타 - Etc</a></li>
						</ul>
					</li>
					<li><a href="#">BEST</a></li>
					<li><a href="#">SALE</a></li>
				</ul>
				<ul class="nav user_nav">
				<c:choose>
					<c:when test="${auth != null}">
						<li><a href="${pageContext.request.contextPath}/shop/logout.do">LOGOUT</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/shop/login.do">LOGIN</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="${pageContext.request.contextPath}/shop/join.do">JOIN</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/mypage/mypage.do">MYPAGE</a>
						<ul class="sub_nav">
							<li><a href="${pageContext.request.contextPath}/shop/mypage/mypage.do">마이페이지 - MY PAGE</a></li>
							<li><a href="${pageContext.request.contextPath}/shop/mypage/order.do">주문내역 - ORDER</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/shop/board/board.do">BOARD</a>
						<ul class="sub_nav">
							<li><a href="#">후기 - Review</a></li>
							<li><a href="#">질문 - Q&A</a></li>
							<li><a href="#">공지사항 - Notice</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/shop/cart/cart.do"><i class="fa fa-cart-plus"></i>(0)</a></li>
				</ul>
			</div>
			<div class="btn_menu btn_left_menu"><i class="fa fa-bars"></i></div>
			<div class="btn_menu btn_right_menu"><i class="fa fa-user"></i></div>
		</nav>
	</div>
</header>