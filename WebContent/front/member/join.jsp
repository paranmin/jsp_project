<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="/jsp_project/css/base.css" media="all" />
<link rel="stylesheet" href="/jsp_project/css/join.css" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />

		<section id="joinContent">
			<div class="formArea">
				<h2>회원정보 입력</h2>
				<form action="" method="post">
					<ul>
						<li class="input"><input type="text" name="name" value="이름" /></li>
						<li class="input"><input type="text" name="id" value="아이디" /></li>
						<li class="input"><input type="text" name="password" value="비밀번호" /></li>
						<li class="input"><input type="text" name="chkpassword" value="비밀번호 확인" /></li>
						<li class="input"><input type="text" name="email" value="이메일" /></li>
						<li class="input last"><input type="text" name="phone" value="휴대폰번호" /></li>
						<li class="chk"><input type="checkbox" name="chkfourteen" id="chkfourteen" /> <label for="chkfourteen">14세 이상입니다. (필수)</label></li>
						<li class="msg">* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을 최소화하고<br>
						편리한 회원가입을 제공합니다.</li>
					</ul>
					<p><input type="submit" value="회원가입" /></p>
				</form>
			</div>
		</section>

		<c:import url="../../modules/footer.jsp" />
	</div>
</body>
</html>