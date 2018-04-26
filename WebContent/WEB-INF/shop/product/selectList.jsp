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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectList.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<% String sortname = (String)request.getAttribute("sort");%> 
<script type="text/javascript">
$(function(){
	var sort = "<%=sortname%>"
	$("div.item_sort").find("li").css("font-weight", "normal");
	if(sort == 'new'){
		$("div.item_sort").find("li").eq(0).css("font-weight","bold");
	}else if(sort == 'name'){
		$("div.item_sort").find("li").eq(1).css("font-weight","bold");
	}else if(sort == 'low'){
		$("div.item_sort").find("li").eq(2).css("font-weight","bold");
	}else if(sort == 'high'){
		$("div.item_sort").find("li").eq(3).css("font-weight","bold");
	}else if(sort == 'rank'){
		$("div.item_sort").find("li").eq(4).css("font-weight","bold");    
	}
});
</script>  
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		<section id="select_list">
			<p class="list_title">SELECT ITEM</p>
			<div class="item_sort">
				<ul>
					<li><a href="showSelectList.do?sort=new&main_search=${name }">NEW</a></li>
					<li><a href="showSelectList.do?sort=name&main_search=${name }">NAME</a></li>
					<li><a href="showSelectList.do?sort=low&main_search=${name }">LOW PRICE</a></li>
					<li><a href="showSelectList.do?sort=high&main_search=${name }">HIGH PRICE</a></li>
					<li><a href="showSelectList.do?sort=rank&main_search=${name }">RANK</a></li>    
				</ul>
				<p class="item_num">total ${total} items</p>   
			</div>   
			<div class="select_item">
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
			<div class="pagingArea">
			<c:if test="${paging != null}">
				${paging}
			</c:if>
			</div>
		</section>
		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>