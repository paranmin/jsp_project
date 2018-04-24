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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productBestList.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		<section id="best_list">
			<p class="list_title">JEWELRY BEST</p>
			<c:forEach var="bestItem" items="${best }">
						<div class="item">
							<img src="${pageContext.request.contextPath}/upload/${bestItem.mainImg }">
							<div class="category_best_white">
								<a href="${pageContext.request.contextPath}/shop/detailProductShow.do?no=${bestItem.prdNo }">
									<p>
										<b>${bestItem.name }</b>
										<br> ${bestItem.subDesc }
										<c:if test="${bestItem.discountPer != '0%'}">
										<br><span id="line"><fmt:formatNumber value="${bestItem.cost }" pattern="￦#,###"/></span>
										</c:if>
										<br><fmt:formatNumber value="${bestItem.sellingPrice }" pattern="￦#,###"/>
										<c:if test="${bestItem.discountPer != '0%'}">
										<br>(${bestItem.discountPer } 할인)
										</c:if>
									</p>
								</a>
							</div>
						</div>
				</c:forEach>
		</section>
		<p>페이징</p>
		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>