<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="left_side">
	<div class="left_menu">
		<img src="/jsp_project/images/btn_close.gif" class="close_left">
		<h1>CATEGORY</h1>
		<h2>JEWELRY</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do">전체보기 - All</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=귀걸이">귀걸이 - Earring</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=이어커프">이어커프 - Earcuff</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=목걸이">목걸이 - Necklace</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=팔찌">팔찌 - Bracelet</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=발찌">발찌 - Anklet</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=반지">반지 - Ring</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=발가락지/토링 ">발가락지/토링 - Toe ring</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=헤어 ACC">헤어 ACC - Hair ACC</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=시계">시계 - Watch</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=폰 ACC">폰 ACC - Phone ACC</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/showList.do?cate=기타">기타 - Etc</a></li>
		</ul>
		<!-- 
		<h2><a href="">SILVER</a></h2>
		<h2><a href="">GOLD</a></h2> 
		-->
		<h2><a href="">BEST</a></h2>
		<h2><a href="">SALE</a></h2>
	</div>
</div>