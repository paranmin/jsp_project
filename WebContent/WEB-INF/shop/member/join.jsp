<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 - SJ JEWELRY</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="joinContent">
			<div class="formArea">
				<h2>회원정보 입력</h2>
				<form action="join.do" method="post">
					<input type="hidden" name="serviceAgree" value="${serviceAgree}" />
					<input type="hidden" name="privacyAgree" value="${serviceAgree}" />
					<input type="hidden" name=ademail value="${ademail}" /> <input
						type="hidden" name="adsms" value="${adsms}" /> <input
						type="hidden" name="adpush" value="${adpush}" />
					<ul>
						<li class="input"><label>이름</label><input type="text" name="name" data-title="이름" 
							class="required_form" style="opacity:1" /></li>
						<li class="input"><label>아이디</label><input type="text" name="id" data-title="아이디" 
							class="required_form" /></li>
						<li class="input"><label>비밀번호</label><input type="password" name="password" data-title="비밀번호" class="required_form" /></li>
						<li class="input"><label>비밀번호 확인</label><input type="password" name="chkpassword" data-title="비밀번호 확인" class="required_form" /></li>
						<li class="input"><label>이메일</label><input type="text" name="email" data-title="이메일" 
							class="required_form" /></li>
						<li class="input last"><label>휴대폰번호</label><input type="text" name="phone" data-title="휴대폰번호" class="required_form" /></li>
						<li class="chk"><input type="checkbox" name="chkfourteen" value="Y" 
							id="chkfourteen" /> <label
							for="chkfourteen">14세 이상입니다. (필수)</label></li>
						<li class="msg">* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을
							최소화하고<br> 편리한 회원가입을 제공합니다.
						</li>
					</ul>
					<p>
						<input type="submit" value="회원가입" />
					</p>
				</form>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
<script>
$(function() {
	$("form input.required_form").on("focus", function() {
		var value = $(this).val().trim(),
			title = $(this).data("title");
		
		if (value == "") {
			$(this).prev().css("display", "none");
		}
	}).on("blur", function() {
		var value = $(this).val().trim();
		
		if (value == "") {
			$(this).prev().css("display", "block");
		}
	});
	
	$("form").on("submit", function() {
		var is_submit = true;
		if (!$("#chkfourteen").is(":checked")) {
			alert("14세 이상 회원가입이 가능합니다.");
			return false;
		}
		
		$("form input.required_form").each(function(i, obj) {
			var value = $(obj).val().trim();
			if (value == "") {
				alert($(obj).data("title") + " 항목을 입력해주세요.");
				$(obj).focus();
				is_submit = false;
				return false;
			}
		});
		
		if (is_submit) {
			return true;
		}
		
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