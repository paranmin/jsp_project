<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body> 
	<div id="container">  
		<c:import url="modules/header.jsp" />
		<c:import url="modules/leftSide.jsp" />
		<c:import url="modules/rightSide.jsp" />
		<section id="mainContent">
			<div class="header_back_img_area"></div>
			<div class="category_item">
				<section id="product_list">
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
				</section>
			</div>
		</section>
		<c:import url="modules/footer.jsp" />
	</div>
</body>
</html>