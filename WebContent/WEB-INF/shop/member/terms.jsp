<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 약관 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="joinContent">
			<h2>Create an Account</h2>
			<div class="agreeArea">
				<form action="terms.do" method="post">
					<div class="allAgree">
						<label for="all_agree"><input type="checkbox" name="all_agree" id="all_agree" value="Y" /> 전체동의</label>
					</div>
					<div class="unitAgree">
						<ul>
							<li><label for="serviceAgree" class="bold"><input type="checkbox" name="serviceAgree" id="serviceAgree" value="Y" /> 이용약관</label> <a href="#service_terms">내용보기</a></li>
							<li><label for="privacyAgree" class="bold"><input type="checkbox" name="privacyAgree" id="privacyAgree" value="Y" /> 개인정보 수집 및 이용 안내</label> <a href="#privacy_terms">내용보기</a></li>
						</ul>
						<div class="marketingArea">
							<p>
								<label for="adall" class="bold"><input type="checkbox" name="adall" id="adall" value="Y" /> 마케팅 수신동의</label>
								(<label for="ademail" class="bold"><input type="checkbox" name="ademail" id="ademail" value="Y" /> 이메일</label>&nbsp;&nbsp;&nbsp;
								<label for="adsms" class="bold"><input type="checkbox" name="adsms" id="adsms" value="Y" /> SMS</label>&nbsp;&nbsp;&nbsp;
								<label for="adpush" class="bold"><input type="checkbox" name="adpush" id="adpush" value="Y" /> 앱Push알림</label>)
							</p>
							<p>쇼핑몰에서 제공하는 신상품 소식 / 할인쿠폰을 무상으로 보내드립니다.<br>
							단, 상품 구매 정보는 수신동의 여부 관계없이 발송됩니다.<br>
							<span class="bold">제공동의를 하지 않으셔도 서비스 이용에는 문제가 없습니다.</span>
							</p>
						</div>
					</div>
					<p class="btn"><input type="submit" value="동의하고 가입하기" /></p>
				</form>
			</div>
			<div class="termsArea">
				<h3 id="service_terms">이용약관</h3>
				<textarea name="" id="" cols="170" rows="10">인터넷 쇼핑몰 『DGIT Company 사이버 몰』회원 약관</textarea>
				<h3 id="privacy_terms">개인정보 수집이용</h3>
				<table>
					<tr>
						<th>구분</th>
						<th>목적</th>
						<th>항목</th>
						<th>보유기간</th>
					</tr>
					<tr>
						<th>필수정보</th>
						<td>회원제 서비스 이용 / 본인확인</td>
						<td>이름, 아이디, 비밀번호, 이메일, 휴대폰</td>
						<td>회원 탈퇴 후 5일</td>
					</tr>
					<tr>
						<th>선택정보</th>
						<td>마케팅 활용(이벤트, 맞춤형 광고)</td>
						<td>휴대폰, 이메일, 쿠키정보</td>
						<td>회원 탈퇴 후 5일</td>
					</tr>
				</table>
				<p>귀하께서는 쇼핑몰에서 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다.<br>
				다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.</p>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
<script>
$(function() {
	$("form").on("submit", function() {
		if (!$("#serviceAgree").is(":checked")) {
			alert("이용약관을 읽고 동의해주셔야 합니다.");
			return false;
		}
		if (!$("#privacyAgree").is(":checked")) {
			alert("개인정보 수집 및 이용에 동의하셔야 됩니다.");
			return false;
		}

		return true;
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