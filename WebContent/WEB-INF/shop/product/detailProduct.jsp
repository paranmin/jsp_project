<%@page import="com.dgit.mall.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="/jsp_project/css/base.css" media="all" />
<link rel="stylesheet" href="/jsp_project/css/main.css" media="all" />
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/base.js"></script>
<title>SJ JEWELRY</title>
<style>
* {
	margin: 0;
	padding: 0;
}

div.detail_left {
	width: 60%;
	margin: 65px 100px;
	text-align: center;
}

div.detail_left h2.catename {
	text-align: justify;
	font-size: 15px;
	font-family: 'Nanum Myeongjo', serif;
}

div.detail_menu {
	overflow: hidden;
	margin-bottom: 3px;
}
div.detail_menu a{
	color: black;
}
div.detail_menu ul {
	margin-top: 20px; 
	font-size : 13px;
	font-family: 'IBM Plex Serif', serif;
	width: 15%;
}

div.detail_menu li{
	width: 30%;
	float: left;
	text-align: left;
	list-style: none;
	height: 22px;
	border-right: 1px solid #ccc;
}
div.datail_board li{
	width: 20%;
	float: left;
	text-align: left;
	list-style: none;
	height: 22px;
	border-right: 1px solid #ccc;
}
div.detail_menu li:nth-child(2), div.detail_left li:nth-child(3) {
	padding-left: 3px;
}

div#detail_menu_detail li:nth-child(1) {
	border-bottom: 2px solid black;
}

div#detail_menu_review li:nth-child(2) {
	border-bottom: 2px solid black;
}

div#detail_menu_qa li:nth-child(3) {
	border-bottom: 2px solid black;
}

div.detail_product a {
	color: black;
	text-decoration: none;
}

div.detail_right {
	width: 34%;
	position: fixed;
	top: 190px;
	right: 0px;
	overflow: hidden;
}
div.detail_right input[type="text"]{
	border:none;
	width:70%;
}
div.detail_right hr{
	width:95%;
}
div.detail_right input[type="submit"]{
	width:90%;
	margin:20px;
	height:50px;
	background: #222;
	color:white;
	border:none;
}
div.detail_right table tr{
	height: 40px;
}
div.detail_right table td:nth-child(1){
	width: 100px;
}

div.detail_right table td:nth-child(2){
	width: 500px;
}

div.detail_right select{
	width:70%;
}
div.detail_right a{
	color:black;
}
p.cartgo{
	text-align: right;
	padding-right: 50px;
}
div#detail_menu_qa, div#detail_menu_review {
	margin-left:100px;
	width:93%;
}
div.detail_menu table{
	margin-top:15px;
	margin-left:100px;
	width:93%;
}
div.detail_menu table th{
	background: whitesmoke;
    height: 40px;
}
div.detail_menu table td{
	height: 40px;
}
div.detail_menu table th:nth-child(1), div.detail_menu table td:nth-child(1){
	width:5%;
	text-align: center;
}
div.detail_menu table th:nth-child(2), div.detail_menu table td:nth-child(2){
	width:70%;
	padding-left:20px;
}
div.detail_menu table th:nth-child(3), div.detail_menu table td:nth-child(3){
	width:10%;
	text-align: center;
}
div.detail_menu table th:nth-child(4), div.detail_menu table td:nth-child(4){
	width:10%;
	text-align: center;
}
div.detail_menu table th:nth-child(5), div.detail_menu table td:nth-child(5){
	width:5%;
	text-align: center;
}
div.detail_menu div.button{
	float: right;
	margin-right: 50px;
}
div.detail_menu div.button button{
	margin-top:10px;
	width: 100px;
    height: 30px;
    border: none;
}
div.detail_menu div.button button#qaBtn, div.detail_menu div.button button#reviewBtn{
	background: black;
	color:white;
	font-weight: bold;
}
#line{
	text-decoration: line-through;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%
	Product pro = (Product)request.getAttribute("pro");
%>
<script type="text/javascript">
$(function(){
	$("select").change(function(){  
		console.log("$(option:selected).val() : "+$("option:selected").val());
		if($("option:selected").val()!=null){
			var li = $("<li>");
			var $text = $(this).children("option:selected").text();
			var plusBtn = $("<button>");
			$(plusBtn).text("+");
			var $input = $("<input type='text'>");
			$($input).val("1");
			var minusBtn = $("<button>");
			$(minusBtn).text("-");
			var price = <%=pro.getSellingPrice()%>+$('option:selected').val()+"원";
			var closeBtn=$("<button>");
			$(closeBtn).text("X");
			console.log("$text : "+$text);
			console.log(price);
			console.log($('option:selected').val());
		}
	});	
});
</script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		<section id="detail_product">
			<div class="detail_left">
				<h2 class="catename">JEWELRY... ${pro.category }</h2>
				<div class="detail_menu" id="detail_menu_detail">
					<ul>
						<li><a href="#detail" id="detail">Detail</a></li>
						<li><a href="#review">Review</a></li>
						<li><a href="#qa">Q&A</a></li>
					</ul>
				</div>
				<c:forEach var="imglist" items="${img }">
					<img src="${pageContext.request.contextPath}/images/${imglist.img }">
				</c:forEach>
			</div>
			<div class="detail_right">
				<h3>${pro.name }</h3>
				<hr>
				<table>
					<tr>
						<td colspan="2">${pro.subDesc }</td>
					</tr>
					<tr>
						<td>판매가격</td>
						<c:if test="${pro.cost == pro.sellingPrice }">
							<td><b><fmt:formatNumber value="${pro.sellingPrice }" pattern="￦#,###"/></b></td>
						</c:if>
						<c:if test="${pro.cost != pro.sellingPrice }">
							<td>
								<span id="line"><fmt:formatNumber value="${pro.cost }" pattern="￦#,###"/></span>
								<b><fmt:formatNumber value="${pro.sellingPrice }" pattern="￦#,###"/></b>
								(${pro.discountPer } 할인)
							</td>
						</c:if>
					</tr>	
					<c:set value="0" var="fir"/>
					<c:forEach var="option" items="${opt }" varStatus="status">
						<c:set value="${fir+rownum[status.index]-1 }" var="end"/>
						<tr>
							<td>${option.poName }</td>
							<td>
								<select>
									<option value="null">==선택하세요==</option>
									<c:forEach var="result" items="${res }" begin="${fir}" end="${end}">
										<option value="${result.podCost}">${result.podValue} / <fmt:formatNumber value="${result.podCost}" pattern="#,###원"/></option>
									</c:forEach>
								</select>
							</td>
							<c:set value="${end+1 }" var="fir"/>
					</c:forEach>
				</table>
				<hr>
				<div id="selectedItem">
					<ul></ul>
				</div>
				<hr>
				<div id="resultPrice">
					<p></p>
				</div>
				<input type="submit" value="Add Cart"><br>
				<!-- <p class="cartgo"><a href="#">Add Cart</a><p> -->
			</div>
			<div class="datail_board">
				<div class="detail_menu" id="detail_menu_review">
					<ul>
						<li><a href="#detail">Detail</a></li>
						<li><a href="#review" id="review">Review</a></li>
						<li><a href="#qa">Q&amp;A</a></li>
					</ul>
				</div>
				<div class="detail_menu">
					<table class="review">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>이름</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
						<tr>
							<td>1</td>
							<td>예뻐요</td>
							<td>eunae</td>
							<td>2018/04/06</td>
							<td>22</td>
						</tr>
					</table>
					<div class="button">
						<button id="reviewBtn">후기작성</button>
						<button id="reviewListBtn">목록으로</button>
					</div>	
					<div>페이징</div>
				</div>
				<div class="detail_menu" id="detail_menu_qa">
					<ul>
						<li><a href="#detail">Detail</a></li>
						<li><a href="#review">Review</a></li>
						<li><a href="#qa" id="qa">Q&A</a></li>
					</ul>
				</div>
				<div class="detail_menu">
					<table class="qa">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>이름</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
						<tr>
							<td>1</td>
							<td>문의합니다</td>
							<td>eunae</td>
							<td>2018/04/06</td>
							<td>7</td>
						</tr>
					</table>
					<div class="button">
						<button id="qaBtn">문의하기</button>
						<button id="qaListBtn">목록으로</button>
					</div>
					<div>페이징</div>
				</div>
			</div>
		</section>
		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>