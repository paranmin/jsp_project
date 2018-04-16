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
			<h2>Find ID/PW</h2>
			<div class="findArea">
				<form id="findIdForm" action="findmember.do" method="post">
				<input type="hidden" name="findType" value="id" />
				<div>
					<p class="msg">회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</p>
					<ul>
						<li><input type="radio" name="findId" id="findIdByEmail" value="email" checked /> <label for="findIdByEmail">이메일로 찾기</label></li>
						<li><input type="radio" name="findId" id="findIdByPhone" value="phone" /> <label for="findIdByPhone">휴대폰 번호로 찾기</label></li>
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
						<a href="#" class="find" data-form="findIdForm">확인</a>
						<a href="login.do" class="login">로그인</a>
					</p>
				</div>
				</form>
			</div>
			<div class="findArea">
				<form id="findPwdForm" action="findmember.do" method="post">
				<input type="hidden" name="findType" value="pwd" />
				<div>
					<p class="msg">임시 비밀번호 발급</p>
					<ul>
						<li><input type="radio" name="findPwd" id="findPwdByEmail" value="email" checked /> <label for="findPwdByEmail">이메일로 찾기</label></li>
						<li><input type="radio" name="findPwd" id="findPwdByPhone" value="phone" /> <label for="findPwdByPhone">휴대폰 번호로 찾기</label></li>
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
						<a href="#" class="find" data-form="findPwdForm">임시 비밀번호 발급</a>
						<a href="login.do" class="login">로그인</a>
					</p>
				</div>
				</form>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
<script>
$(function() {
	$("input[type='radio']").on("click", function() {
		var type = $(this).val(),
			$table = $(this).parent().parent().next();
		
		if (type == 'email') {
			$table.find(".findPhone").css("display", "none");
			$table.find(".findEmail").css("display", "table-row");
		} else {
			$table.find(".findEmail").css("display", "none");
			$table.find(".findPhone").css("display", "table-row");
		}
	});
	
	$(".find").on("click", function() {
		var $form = $("#"+$(this).data("form")),
			$radio = $form.find("input[type=radio]:checked"),
			$name = $form.find("input[name='name']"),
			$email = $form.find("input[name='email']"),
			$phone = $form.find("input[name='phone']");
		
		if ($name.val().trim() == "") {
			alert("이름을 입력해주세요.");
			$name.focus();
			return false;
		}
		if ($radio.val() == 'email') {
			if ($email.val().trim() == "") {
				alert("이메일을 입력해주세요.");
				$email.focus();
				return false;
			}
		} else if ($radio.val() == 'phone') {
			if ($phone.val().trim() == "") {
				alert("휴대폰 번호를 입력해주세요.");
				$phone.focus();
				return false;
			}
		}
		$form.submit();
		return false;
	});
});
</script>
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
</c:if>
</body>
</html>