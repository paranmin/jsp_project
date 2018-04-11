<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="loginContent">
			<h2>Login or Create an Account</h2>
			<div class="memberArea">
				<div class="loginArea">
					<fieldset>
						<legend>Member Login</legend>
						<form action="login.do" method="post">
							<label for="">ID</label>
							<input type="text" name="loginId" title="회원 ID" />
							<label for="">Password</label>
							<input type="password" name="loginPwd" title="회원 비밀번호" />
							<input type="submit" value="Login" />
						</form>
						<p>
							<a href="findmember.do">Find Id / Find Password</a>
						</p>
					</fieldset>

				</div>
				<div class="joinArea">
					<fieldset>
						<legend>Member Join</legend>
						<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
						<a href="join.do"><input type="button" value="Register" /></a>
					</fieldset>
				</div>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
	<c:if test="${error_msg != null && error_msg != ''}">
		<script type="text/javascript">
			alert("${error_msg}");
		</script>
		<%
			session.removeAttribute("error_msg");
		%>
	</c:if>
<script>
$(function() {
	$("form").on("submit", function() {
		var ok = false;
		$(this).find("input[name]").each(function(i, obj) {
			ok = true;
			if ($(obj).val().trim() == "") {
				alert(obj.title + "를 입력해주세요.");
				obj.focus();
				ok = false;
				return false;
			}
		});
		if (ok) {
			return true;
		}
		return true;
	});
});
</script>
</body>
</html>