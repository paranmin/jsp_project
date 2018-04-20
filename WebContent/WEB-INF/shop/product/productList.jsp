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
<link rel="stylesheet" href="/jsp_project/css/base.css" media="all" />
<link rel="stylesheet" href="/jsp_project/css/main.css" media="all" />
<script src="/jsp_project/js/jquery-1.12.4.min.js"></script>
<script src="/jsp_project/js/base.js"></script>
<style>
section#product_list {
	text-align: center;
}

p.list_title {
	font-family: 'Playfair Display', serif;
	font-size: 30px;
	padding: 20px 0;
}

div.category_best {
	overflow: hidden;
}

div.category_item {
	overflow: hidden;
}

div.item:nth-child(1), div.item:nth-child(5), div.item:nth-child(9), div.item:nth-child(13){
	margin-left: 12%;
}

div.item {
	width: 356px;
	height: 430px;
	float: left;
	margin: 2px;
	background: #ccc;
	position: relative;
}

div.item img {
	width: 356px;
	height:100%;
	position: absolute;
	left: 0;
	bottom: 0;
}

div.category_best_white, div.item_white {
	background: rgba(255, 255, 255, 0.5);
	width: 356px;
	height: 430px;
	position: absolute;
	left: 0;
	top: 0;
}

div.category_best_white p, div.item_white p {
	text-align: center;
	padding-top: 200px;
}

hr {
	background: #ccc;
	margin-top: 50px;
}
p.item_num{
	text-align: justify;
	line-height: 40px;
}
div.item_sort{
	font-family: 'IBM Plex Serif', serif;
	overflow: hidden;
	margin-left:250px;
}
div.item_sort ul{
	float: right;
	width: 400px;
	margin-right:240px;
	margin-bottom: 5px;
}
div.item_sort li{
	list-style: none;
	float:left;
	width:19%;
	height:40px;
}
div.item_sort li:nth-child(1), div.item_sort li:nth-child(2), div.item_sort li:nth-child(5){
	line-height:40px;
}

div.item_sort li:nth-child(1),div.item_sort li:nth-child(2),
div.item_sort li:nth-child(3),div.item_sort li:nth-child(4){
	border-right:1px solid #ccc;
}

a{
	color:black;
}
div.item_white{
	display: none;
}
div.category_best_white{
	display: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("div.item_white").css("display","none");    
		$("div.category_best_white").css("display","none");  
		$("div.item").mouseover(function(){
			$(this).children("div").css("display","block"); 
		});
		$("div.item").mouseout(function(){
			$(this).children("div").css("display","none");     
		});
	});
</script>
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
							<img src="${pageContext.request.contextPath}/images/${bestItem.mainImg }">
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
				<!-- <div class="item">
					<img src="../../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../../images/J2.jpg">
					<div class="category_best_white"></div>
				</div> -->
			</div>
			<hr>
			<c:if test="${cate==null }">
				<p class="list_title">JEWELRY BEST</p>
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
						<img src="${pageContext.request.contextPath}/images/${prolist.mainImg }">
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