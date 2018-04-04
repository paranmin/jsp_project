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
<link rel="stylesheet" href="css/base.css" media="all" />
<link rel="stylesheet" href="css/main.css" media="all" />
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/base.js"></script>
</head>
<body>
	<div id="container">  
		<c:import url="modules/header.jsp" />
		<c:import url="modules/leftSide.jsp" />
		<c:import url="modules/rightSide.jsp" />
		<section id="mainContent">
			<div class="header_back_img_area"></div>
			메인 본문
		</section>
		<c:import url="modules/footer.jsp" />
	</div>
</body>
</html>