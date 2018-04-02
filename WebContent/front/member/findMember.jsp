<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="/jsp_project/css/base.css" media="all" />
<link rel="stylesheet" href="/jsp_project/css/login.css" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../../modules/header.jsp" />
		<c:import url="../../modules/leftSide.jsp" />
		<c:import url="../../modules/rightSide.jsp" />

		<section id="loginContent">
			<h2>Login or Create an Account</h2>
			<div class="memberArea">
				<div class="loginArea">
					<fieldset>
						<legend>Member Login</legend>
						<form action="">
							<label for="">ID</label>
							<input type="text" name="loginId" />
							<label for="">Password</label>
							<input type="text" name="loginPwd" />
							<input type="submit" value="Login" />
						</form>
						<p>
							<a href="findMember.jsp">Find Id / Find Password</a>
						</p>
					</fieldset>

				</div>
				<div class="joinArea">
					<fieldset>
						<legend>Member Join</legend>
						<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
						<p>
							<input type="button" value="Register" />
						</p>
					</fieldset>
				</div>
			</div>
		</section>

		<c:import url="../../modules/footer.jsp" />
	</div>
</body>
</html>