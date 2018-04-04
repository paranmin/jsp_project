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
			<h2>Find ID/PW</h2>
			<div class="findArea">
				<form name="" action="" method="post">
				<div>
					<p class="msg">회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</p>
					<ul>
						<li><input type="radio" name="findId" id="findIdByEmail" checked /> <label for="findIdByEmail">이메일로 찾기</label></li>
						<li><input type="radio" name="findId" id="findIdByPhone" /> <label for="findIdByPhone">휴대폰 번호로 찾기</label></li>
					</ul>
					<table class="findMember">
						<tr>
							<th>이&nbsp;&nbsp;름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr class="findEmail">
							<th>이메일</th>
							<td><input type="text" name="email" /></td>
						</tr>
						<tr class="findPhone">
							<th>휴대폰 번호</th>
							<td><input type="text" name="phone" /></td>
						</tr>
					</table>
					<p class="btn">
						<a href="#" class="find">확인</a>
						<a href="#" class="login">로그인</a>
					</p>
				</div>
				</form>
			</div>
			<div class="findArea">
				<form name="" action="" method="post">
				<div>
					<p class="msg">임시 비밀번호 발급</p>
					<ul>
						<li><input type="radio" name="findPwd" id="findPwdByEmail" checked /> <label for="findPwdByEmail">이메일로 찾기</label></li>
						<li><input type="radio" name="findPwd" id="findPwdByPhone" /> <label for="findPwdByPhone">휴대폰 번호로 찾기</label></li>
					</ul>
					<table class="findMember">
						<tr>
							<th>이&nbsp;&nbsp;름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr class="findEmail">
							<th>이메일</th>
							<td><input type="text" name="email" /></td>
						</tr>
						<tr class="findPhone">
							<th>휴대폰 번호</th>
							<td><input type="text" name="phone" /></td>
						</tr>
					</table>
					<p class="btn">
						<a href="#" class="find">임시 비밀번호 발급</a>
						<a href="#" class="login">로그인</a>
					</p>
				</div>
				</form>
			</div>
		</section>

		<c:import url="../../modules/footer.jsp" />
	</div>
</body>
</html>