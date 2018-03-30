<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ JEWELRY</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="../css/base.css" media="all" />
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

img {
	width: 356px;
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
}
div.item_sort{
	font-family: 'IBM Plex Serif', serif;
	overflow: hidden;
}
div.item_sort ul{
	float: right;
	width:600px;
}
div.item_sort li{
	list-style: none;
	float:left;
	width:20%;
}
a{
	color:black;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<section id="product_list">
			<p class="list_title">JEWERLY BEST</p>
			<div class="category_best">
				<a href="#">
					<div class="item">
						<img src="../images/J1.jpg">
						<div class="category_best_white">
							<p>
								상품명<br> 가격
							</p>
						</div>
					</div>
				</a>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
			</div>
			<hr>
			<p class="list_title">JEWERLY ITEM</p>
			<p class="item_num">total 100items</p>
			<div class="item_sort">
				<ul>
					<li><a href="#">NEW</a></li>
					<li><a href="#">NAME</a></li>
					<li><a href="#">LOW PRICE</a></li>
					<li><a href="#">HIGH PRICE</a></li>
					<li><a href="#">RANKING</a></li>
				</ul>
			</div>
			<div class="category_item">
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="item_white"></div>
				</div>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="item_white"></div>
				</div>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="item_white"></div>
				</div>
				<div class="item">
					<img src="../images/J1.jpg">
					<div class="item_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
				<div class="item">
					<img src="../images/J2.jpg">
					<div class="category_best_white"></div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<p>페이징 처리해야함</p>
			<br>
			<br>
			<br>
		</section>
	</div>
</body>
</html>