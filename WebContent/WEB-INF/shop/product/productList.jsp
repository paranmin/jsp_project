<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		<section id="product_list">
			<c:if test="${cate==null }">
				<p class="list_title">JEWELRY BEST</p>
			</c:if>
			<c:if test="${cate!=null }">
				<p class="list_title">${cate } BEST</p>
			</c:if>
			<div class="category_best">
				<c:forEach var="bestItem" items="${best }" begin="0" end="7">
						<div class="item">
							<img src="${pageContext.request.contextPath}/upload/${bestItem.mainImg }">
							<div class="category_best_white">
								<a href="${pageContext.request.contextPath}/shop/detailProductShow.do?no=${bestItem.prdNo }">
									<p>
										<b>${bestItem.name }</b>
										<br> ${bestItem.subDesc }
										<br><fmt:formatNumber value="${bestItem.sellingPrice }" pattern="￦#,###"/>
									</p>
								</a>
							</div>
						</div>
					
				</c:forEach>
			</div>
			<hr>
			<c:if test="${cate==null }">
				<p class="list_title">JEWELRY ITEM</p>
			</c:if>
			<c:if test="${cate!=null }">
				<p class="list_title">${cate } ITEM</p>
			</c:if>
			<div class="item_sort">
				<ul>
					<li><a href="#">NEW</a></li>
					<li><a href="#">NAME</a></li>
					<li><a href="#">LOW PRICE</a></li>
					<li><a href="#">HIGH PRICE</a></li>
					<li><a href="#">RANK</a></li>
				</ul>
				<p class="item_num">total ${list.size() } items</p>
			</div>   
			<div class="category_item">
				<c:if test="${list.size() == 0 }">  
					<p>아이템이 없습니다.</p>
				</c:if>
				<c:forEach var="prolist" items="${list }">
					<div class="item">
						<img src="${pageContext.request.contextPath}/upload/${prolist.mainImg }">
						<div class="item_white">
							<a href="${pageContext.request.contextPath}/shop/detailProductShow.do?no=${prolist.prdNo }">
								<p>
									<b>${prolist.name }</b>
									<br> ${prolist.subDesc }
									<br><fmt:formatNumber value="${prolist.sellingPrice }" pattern="￦#,###"/>
								</p>
							</a>
						</div>
					</div>    
				</c:forEach>
			</div>
			<br>
			<br>
			<br>
			<p>페이징 처리해야함</p>
			<br>
			<br>
			<br>
		</section>
		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>