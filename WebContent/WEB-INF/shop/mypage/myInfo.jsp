<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />

		<section id="mypageContent">
			<h2 class="engText">Modify</h2>
			<div class="board">
				<form action="myinfo.do" method="post">
					<table class="modify">
						<colgroup>
							<col width="10%" />
							<col />
						</colgroup>
						<tr>
							<td><span class="required">*</span> 이름</td>
							<td><input type="text" name="name" value="" readonly /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 아이디</td>
							<td>adfafafadfa</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 비밀번호</td>
							<td><input type="password" name="password" id="password" /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 비밀번호 확인</td>
							<td><input type="password" name="checkPwd" id="checkPwd" /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 생일/성별</td>
							<td>
								<select name="year">
									<option value=""></option>
								</select> 년 
								<select name="month">
									<option value=""></option>
								</select> 월
								<select name="day">
									<option value=""></option>
								</select> 일 
								<input type="radio" name="gender" id="male" /> <label for="male">남</label> 
								<input type="radio" name="gender" id="female" /> <label for="female">여</label> 
								
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 우편번호</td>
							<td><input type="text" name="zipcode" maxlength="6" size="6" readonly /> <a href="#" class="btn">우편번호</a></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 집주소</td>
							<td><input type="text" name="addr1" class="form_addr" readonly /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 상세주소</td>
							<td><input type="text" name="addr2" class="form_addr" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;연락처</td>
							<td>
								<select name="tel1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="02">서울 (02)</option>
									<option value="031">경기 (031)</option>
									<option value="032">인천 (032)</option>
									<option value="033">강원 (033)</option>
									<option value="041">충남 (041)</option>
									<option value="042">대전 (042)</option>
									<option value="043">충북 (043)</option>
									<option value="044">세종 (044)</option>
									<option value="051">부산 (051)</option>
									<option value="052">울산 (052)</option>
									<option value="053">대구 (053)</option>
									<option value="054">경북 (054)</option>
									<option value="055">경남 (055)</option>
									<option value="061">전남 (061)</option>
									<option value="062">광주 (062)</option>
									<option value="063">전북 (063)</option>
									<option value="064">제주 (064)</option>
									<option value="0502">KT (0502)</option>
									<option value="0503">온세텔레콤(0503)</option>
									<option value="0504">온세텔레콤(0504)</option>
									<option value="0505">Dacom (0505)</option>
									<option value="0507">온세텔레콤(0507)</option>
									<option value="070">인터넷전화 (070)</option>
									<option value="080">착신 과금 서비스 (080)</option>
								</select> - <input type="text" name="tel2" maxlength="4" size="4" /> - 
								<input type="text" name="tel3" maxlength="4" size="4" />
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 휴대폰</td>
							<td>
								<select name="phone1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="02">서울 (02)</option>
									<option value="031">경기 (031)</option>
									<option value="032">인천 (032)</option>
									<option value="033">강원 (033)</option>
									<option value="041">충남 (041)</option>
									<option value="042">대전 (042)</option>
									<option value="043">충북 (043)</option>
									<option value="044">세종 (044)</option>
									<option value="051">부산 (051)</option>
									<option value="052">울산 (052)</option>
									<option value="053">대구 (053)</option>
									<option value="054">경북 (054)</option>
									<option value="055">경남 (055)</option>
									<option value="061">전남 (061)</option>
									<option value="062">광주 (062)</option>
									<option value="063">전북 (063)</option>
									<option value="064">제주 (064)</option>
									<option value="0502">KT (0502)</option>
									<option value="0503">온세텔레콤(0503)</option>
									<option value="0504">온세텔레콤(0504)</option>
									<option value="0505">Dacom (0505)</option>
									<option value="0507">온세텔레콤(0507)</option>
									<option value="070">인터넷전화 (070)</option>
									<option value="080">착신 과금 서비스 (080)</option>
								</select> - <input type="text" name="phone2" maxlength="4" size="4" /> - 
								<input type="text" name="phone3" maxlength="4" size="4" />
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 이메일</td>
							<td><input type="text" name="email1" /> @ 
								<select name="email2">
									<option value="">선택</option>
									<option value="naver.com">naver.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="empal.com">empal.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="korea.com">korea.com</option>
									<option value="chol.com">chol.com</option>
									<option value="gmail.com" selected="selected">gmail.com</option>
									<option value="lycos.co.kr">lycos.co.kr</option>
									<option value="netian.com">netian.com</option>
									<option value="hanmir.com">hanmir.com</option>
									<option value="sayclub.com">sayclub.com</option>
									<option value="direct">직접입력</option>
								</select> <a href="#" class="btn">중복확인</a></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;뉴스메일</td>
							<td>
								<input type="radio" name="newsmail" id="newsok" /> <label for="newsok">받습니다.</label>
								<input type="radio" name="newsmail" id="nonews" /> <label for="nonews">받지 않습니다.</label>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;SMS안내</td>
							<td>
								<input type="radio" name="sms" id="smsok" /> <label for="smsok">받습니다.</label>
								<input type="radio" name="sms" id="nosms" /> <label for="nosms">받지 않습니다.</label>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;앱Push알림</td>
							<td>
								<input type="radio" name="push" id="pushok" /> <label for="pushok">받습니다.</label>
								<input type="radio" name="push" id="nopush" /> <label for="nopush">받지 않습니다.</label>
							</td>
						</tr>
					</table>
					
					<p class="btn">
						<a href="#" class="ok">정보수정</a>
						<a href="#" class="cancel">회원탈퇴</a>
					</p>
				</form>
			</div>
		</section>

		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>