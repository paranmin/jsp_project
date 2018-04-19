<%@page import="com.dgit.mall.dto.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Member modifyMem = (Member) request.getAttribute("modifyMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 - SJ JEWELRY</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
							<td><input type="text" name="name" value="${modifyMember.name}" readonly /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 아이디</td>
							<td>${modifyMember.id}</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 비밀번호</td>
							<td><input type="password" name="password" id="password" class="checkPwd" /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 비밀번호 확인</td>
							<td><input type="password" name="checkPwd" id="checkPwd" class="checkPwd" /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 생일/성별</td>
							<td>
							<%
								String[] aBirth = {};
								if (modifyMem.getBirth() != null && !modifyMem.getBirth().equals("")) {
									aBirth = modifyMem.getBirth().split("-");
								}
								pageContext.setAttribute("aBirth", aBirth);
							%>
								<select name="year">
									<option value="">선택</option>
								<%
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
									String sYear = sdf.format(new Date());
									int year = Integer.parseInt(sYear);
									for (int i = year, end = year - 100; i > end; i--) {
										String selected = "";
										if (aBirth.length > 0 && aBirth[0].equals(String.valueOf(i))) {
											selected = " selected ";
										}
										out.println(String.format("<option value=\"%1$s\"%2$s>%1$s</option>", i, selected));
									}
								%>
								</select> 년 
								<select name="month">
									<option value="">선택</option>
								<c:forEach var="month" begin="1" end="12" step="1">
									<option value="${month}"<c:if test="${aBirth[1] == month}"> selected </c:if>>${month}</option>
								</c:forEach>
								</select> 월
								<select name="day">
									<option value="">선택</option>
								<c:forEach var="day" begin="1" end="31" step="1">
									<option value="${day}"<c:if test="${aBirth[2] == day}"> selected </c:if>>${day}</option>
								</c:forEach>
								</select> 일 
								<input type="radio" name="gender" value="male" id="male"<c:if test="${modifyMember.getGender() == 'MALE'}"> checked</c:if> /> <label for="male">남</label> 
								<input type="radio" name="gender" value="female" id="female"<c:if test="${modifyMember.getGender() == 'FEMALE'}"> checked</c:if> /> <label for="female">여</label> 
								
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 우편번호</td>
							<td><input type="text" name="zipcode" class="checkZipcode" value="${modifyMember.addr.zipcode }" maxlength="6" size="6" readonly /> <a href="#" class="btn" onclick="daumPostcode('input[name=zipcode]', 'input[name=addr1]', 'input[name=addr2]')">우편번호</a></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 집주소</td>
							<td><input type="text" name="addr1" class="checkZipcode form_addr" value="${modifyMember.addr.addr1 }" readonly /></td>
						</tr>
						<tr>
							<td><span class="required">*</span> 상세주소</td>
							<td><input type="text" name="addr2" class="checkZipcode form_addr" value="${modifyMember.addr.addr2 }" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;연락처</td>
							<td>
							<%
								String[] aTel = {};
								if (modifyMem.getTel() != null && !modifyMem.getTel().equals("")) {
									aTel = modifyMem.getTel().split("-");
								}
								pageContext.setAttribute("aTel", aTel);
							%>
								<select name="tel1" class="checkTel">
									<option value="">선택</option>
									<option value="010"<c:if test="${aTel[0] == '010'}"> selected </c:if>>010</option>
									<option value="011"<c:if test="${aTel[0] == '011'}"> selected </c:if>>011</option>
									<option value="016"<c:if test="${aTel[0] == '016'}"> selected </c:if>>016</option>
									<option value="017"<c:if test="${aTel[0] == '017'}"> selected </c:if>>017</option>
									<option value="018"<c:if test="${aTel[0] == '018'}"> selected </c:if>>018</option>
									<option value="019"<c:if test="${aTel[0] == '019'}"> selected </c:if>>019</option>
									<option value="02"<c:if test="${aTel[0] == '02'}"> selected </c:if>>서울 (02)</option>
									<option value="031"<c:if test="${aTel[0] == '031'}"> selected </c:if>>경기 (031)</option>
									<option value="032"<c:if test="${aTel[0] == '032'}"> selected </c:if>>인천 (032)</option>
									<option value="033"<c:if test="${aTel[0] == '033'}"> selected </c:if>>강원 (033)</option>
									<option value="041"<c:if test="${aTel[0] == '041'}"> selected </c:if>>충남 (041)</option>
									<option value="042"<c:if test="${aTel[0] == '042'}"> selected </c:if>>대전 (042)</option>
									<option value="043"<c:if test="${aTel[0] == '043'}"> selected </c:if>>충북 (043)</option>
									<option value="044"<c:if test="${aTel[0] == '044'}"> selected </c:if>>세종 (044)</option>
									<option value="051"<c:if test="${aTel[0] == '051'}"> selected </c:if>>부산 (051)</option>
									<option value="052"<c:if test="${aTel[0] == '052'}"> selected </c:if>>울산 (052)</option>
									<option value="053"<c:if test="${aTel[0] == '053'}"> selected </c:if>>대구 (053)</option>
									<option value="054"<c:if test="${aTel[0] == '054'}"> selected </c:if>>경북 (054)</option>
									<option value="055"<c:if test="${aTel[0] == '055'}"> selected </c:if>>경남 (055)</option>
									<option value="061"<c:if test="${aTel[0] == '061'}"> selected </c:if>>전남 (061)</option>
									<option value="062"<c:if test="${aTel[0] == '062'}"> selected </c:if>>광주 (062)</option>
									<option value="063"<c:if test="${aTel[0] == '063'}"> selected </c:if>>전북 (063)</option>
									<option value="064"<c:if test="${aTel[0] == '064'}"> selected </c:if>>제주 (064)</option>
									<option value="0502"<c:if test="${aTel[0] == '0502'}"> selected </c:if>>KT (0502)</option>
									<option value="0503"<c:if test="${aTel[0] == '0503'}"> selected </c:if>>온세텔레콤(0503)</option>
									<option value="0504"<c:if test="${aTel[0] == '0504'}"> selected </c:if>>온세텔레콤(0504)</option>
									<option value="0505"<c:if test="${aTel[0] == '0505'}"> selected </c:if>>Dacom (0505)</option>
									<option value="0507"<c:if test="${aTel[0] == '0507'}"> selected </c:if>>온세텔레콤(0507)</option>
									<option value="070"<c:if test="${aTel[0] == '070'}"> selected </c:if>>인터넷전화 (070)</option>
									<option value="080"<c:if test="${aTel[0] == '080'}"> selected </c:if>>착신 과금 서비스 (080)</option>
								</select> - <input type="text" name="tel2" maxlength="4" size="4" class="checkTel" value="${aTel[1]}" /> - 
								<input type="text" name="tel3" maxlength="4" size="4" class="checkTel" value="${aTel[2]}" />
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 휴대폰</td>
							<td>
							<%
								String[] aPhone = {};
								if (modifyMem.getPhone() != null && !modifyMem.getPhone().equals("")) {
									aPhone = modifyMem.getPhone().split("-");
								}
								pageContext.setAttribute("aPhone", aPhone);
							%>
								<select name="phone1" class="checkPhone">
									<option value="">선택</option>
									<option value="010"<c:if test="${aPhone[0] == '010'}"> selected </c:if>>010</option>
									<option value="011"<c:if test="${aPhone[0] == '011'}"> selected </c:if>>011</option>
									<option value="016"<c:if test="${aPhone[0] == '016'}"> selected </c:if>>016</option>
									<option value="017"<c:if test="${aPhone[0] == '017'}"> selected </c:if>>017</option>
									<option value="018"<c:if test="${aPhone[0] == '018'}"> selected </c:if>>018</option>
									<option value="019"<c:if test="${aPhone[0] == '019'}"> selected </c:if>>019</option>
									<option value="02"<c:if test="${aPhone[0] == '02'}"> selected </c:if>>서울 (02)</option>
									<option value="031"<c:if test="${aPhone[0] == '031'}"> selected </c:if>>경기 (031)</option>
									<option value="032"<c:if test="${aPhone[0] == '032'}"> selected </c:if>>인천 (032)</option>
									<option value="033"<c:if test="${aPhone[0] == '033'}"> selected </c:if>>강원 (033)</option>
									<option value="041"<c:if test="${aPhone[0] == '041'}"> selected </c:if>>충남 (041)</option>
									<option value="042"<c:if test="${aPhone[0] == '042'}"> selected </c:if>>대전 (042)</option>
									<option value="043"<c:if test="${aPhone[0] == '043'}"> selected </c:if>>충북 (043)</option>
									<option value="044"<c:if test="${aPhone[0] == '044'}"> selected </c:if>>세종 (044)</option>
									<option value="051"<c:if test="${aPhone[0] == '051'}"> selected </c:if>>부산 (051)</option>
									<option value="052"<c:if test="${aPhone[0] == '052'}"> selected </c:if>>울산 (052)</option>
									<option value="053"<c:if test="${aPhone[0] == '053'}"> selected </c:if>>대구 (053)</option>
									<option value="054"<c:if test="${aPhone[0] == '054'}"> selected </c:if>>경북 (054)</option>
									<option value="055"<c:if test="${aPhone[0] == '055'}"> selected </c:if>>경남 (055)</option>
									<option value="061"<c:if test="${aPhone[0] == '061'}"> selected </c:if>>전남 (061)</option>
									<option value="062"<c:if test="${aPhone[0] == '062'}"> selected </c:if>>광주 (062)</option>
									<option value="063"<c:if test="${aPhone[0] == '063'}"> selected </c:if>>전북 (063)</option>
									<option value="064"<c:if test="${aPhone[0] == '064'}"> selected </c:if>>제주 (064)</option>
									<option value="0502"<c:if test="${aPhone[0] == '0502'}"> selected </c:if>>KT (0502)</option>
									<option value="0503"<c:if test="${aPhone[0] == '0503'}"> selected </c:if>>온세텔레콤(0503)</option>
									<option value="0504"<c:if test="${aPhone[0] == '0504'}"> selected </c:if>>온세텔레콤(0504)</option>
									<option value="0505"<c:if test="${aPhone[0] == '0505'}"> selected </c:if>>Dacom (0505)</option>
									<option value="0507"<c:if test="${aPhone[0] == '0507'}"> selected </c:if>>온세텔레콤(0507)</option>
									<option value="070"<c:if test="${aPhone[0] == '070'}"> selected </c:if>>인터넷전화 (070)</option>
									<option value="080"<c:if test="${aPhone[0] == '080'}"> selected </c:if>>착신 과금 서비스 (080)</option>
								</select> - <input type="text" name="phone2" maxlength="4" size="4" class="checkPhone" value="${aPhone[1]}" /> - 
								<input type="text" name="phone3" maxlength="4" size="4" class="checkPhone" value="${aPhone[2]}" />
							</td>
						</tr>
						<tr>
							<td><span class="required">*</span> 이메일</td>
							<td>
							<%
								String[] aEmail = {};
								if (modifyMem.getEmail() != null && !modifyMem.getEmail().equals("")) {
									aEmail = modifyMem.getEmail().split("@");
								}
								pageContext.setAttribute("aEmail", aEmail);
							%>
							<input type="text" name="email1" value="${aEmail[0]}" class="checkEmail" data-checkDupl="Y" /> @ 
								<select name="email2" class="checkEmail">
									<option value="">선택</option>
									<option value="naver.com"<c:if test="${aEmail[1] == 'naver.com'}"> selected </c:if>>naver.com</option>
									<option value="hotmail.com"<c:if test="${aEmail[1] == 'hotmail.com'}"> selected </c:if>>hotmail.com</option>
									<option value="hanmail.net"<c:if test="${aEmail[1] == 'hanmail.net'}"> selected </c:if>>hanmail.net</option>
									<option value="yahoo.co.kr"<c:if test="${aEmail[1] == 'yahoo.co.kr'}"> selected </c:if>>yahoo.co.kr</option>
									<option value="paran.com"<c:if test="${aEmail[1] == 'paran.com'}"> selected </c:if>>paran.com</option>
									<option value="nate.com"<c:if test="${aEmail[1] == 'nate.com'}"> selected </c:if>>nate.com</option>
									<option value="empal.com"<c:if test="${aEmail[1] == 'empal.com'}"> selected </c:if>>empal.com</option>
									<option value="dreamwiz.com"<c:if test="${aEmail[1] == 'dreamwiz.com'}"> selected </c:if>>dreamwiz.com</option>
									<option value="hanafos.com"<c:if test="${aEmail[1] == 'hanafos.com'}"> selected </c:if>>hanafos.com</option>
									<option value="korea.com"<c:if test="${aEmail[1] == 'korea.com'}"> selected </c:if>>korea.com</option>
									<option value="chol.com"<c:if test="${aEmail[1] == 'chol.com'}"> selected </c:if>>chol.com</option>
									<option value="gmail.com"<c:if test="${aEmail[1] == 'gmail.com' || aEmail[1] == ''}"> selected </c:if>>gmail.com</option>
									<option value="lycos.co.kr"<c:if test="${aEmail[1] == 'lycos.co.kr'}"> selected </c:if>>lycos.co.kr</option>
									<option value="netian.com"<c:if test="${aEmail[1] == 'netian.com'}"> selected </c:if>>netian.com</option>
									<option value="hanmir.com"<c:if test="${aEmail[1] == 'hanmir.com'}"> selected </c:if>>hanmir.com</option>
									<option value="sayclub.com"<c:if test="${aEmail[1] == 'sayclub.com'}"> selected </c:if>>sayclub.com</option>
								</select> <a href="#" class="btn" onclick="checkDulpEmail();return false;">중복확인</a></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;뉴스메일</td>
							<td>
								<input type="radio" name="newsmail" value="Y" id="newsok"<c:if test="${modifyMember.getPushEmail() == 'Y'}"> checked</c:if> /> <label for="newsok">받습니다.</label>
								<input type="radio" name="newsmail" value="N" id="nonews"<c:if test="${modifyMember.getPushEmail() == 'N'}"> checked</c:if> /> <label for="nonews">받지 않습니다.</label>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;SMS안내</td>
							<td>
								<input type="radio" name="sms" value="Y" id="smsok"<c:if test="${modifyMember.getPushSMS() == 'Y'}"> checked</c:if> /> <label for="smsok">받습니다.</label>
								<input type="radio" name="sms" value="N" id="nosms"<c:if test="${modifyMember.getPushSMS() == 'N'}"> checked</c:if> /> <label for="nosms">받지 않습니다.</label>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;앱Push알림</td>
							<td>
								<input type="radio" name="push" value="Y" id="pushok"<c:if test="${modifyMember.getPushApp() == 'Y'}"> checked</c:if> /> <label for="pushok">받습니다.</label>
								<input type="radio" name="push" value="N" id="nopush"<c:if test="${modifyMember.getPushApp() == 'N'}"> checked</c:if> /> <label for="nopush">받지 않습니다.</label>
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
<script>
$(function() {
	$(".checkEmail").on("change", function() {
		$("input[name='email1']").data("checkdupl", "N");
	});
	$("p.btn a.ok").on("click", function() {
		var isCheck = true,
			isPwd = 0,
			isZipcode = 0,
			isTel = 0;
		$("form").find(".checkEmail").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				isCheck = false;
				return;
			}
		});
		if (!isCheck) {
			alert("이메일 항목을 입력해주세요.");
			return false;
		}
		$("form").find(".checkPhone").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				isCheck = false;
				return;
			}
		});
		if (!isCheck) {
			alert("휴대폰 항목을 입력해주세요.");
			return false;
		}
		$("form").find(".checkTel").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				++isTel;
			}
		});
		if (isTel > 0 && isTel < 3) {
			alert("정상적인 연락처만 입력가능 합니다.\n\n연락처를 정확하게 입력하세요.");
			return false;
		}
		$("form").find(".checkZipcode").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				++isZipcode;
			}
		});
		if (isZipcode !=0 && isZipcode == 2) {
			alert("우편번호는 검색을 통해서만 입력가능 합니다.\n\n다시 검색해주세요.");
			return false;
		}
		$("form").find(".checkPwd").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				++isPwd;
			}
		});
		if (isPwd != 2) {
			if ($("input[name='password']").val().trim() == '' || $("input[name='password']").val().length < 4 || $("input[name='password']").val().length > 16) {
				alert("비밀번호는 4~16자로 입력해 주세요.");
				$("input[name='password']").val("");
				$("input[name='password']").focus();
				return false;
			}
			if ($("input[name='checkPwd']").val().trim() == '') {
				alert("비밀번호 확인을 입력해 주세요.");
				$("input[name='checkPwd']").val("");
				$("input[name='checkPwd']").focus();
				return false;
			}
			if ($("input[name='password']").val().trim() != $("input[name='checkPwd']").val().trim()) {
				alert("비밀번호가 틀립니다.\n다시 입력해주세요.");
				return false;
			}
		}
		if ($("input[name='email1']").data("checkdupl") == "N") {
			alert("이메일 중복확인을 하셔야 정보 수정이 가능합니다.");
			return false;
		}
		$("form").submit();
		return false;
	});
	$("p.btn a.cancel").on("click", function() {
		if (confirm("정말 회원 탈퇴를 하시겠습니까?")) {
			$.ajax({
				url: "<%= request.getContextPath() + "/shop/leave.do" %>",
				type: "post",
				data: {"type": "shop"},
				dataType: "json",
				success: function(data) {
					alert(data.msg);
					if (data.result == 'yes') {
						location.href = "<%= request.getContextPath() %>";
					}
					return;
				}
			});
		}
		return false;
	});
});
</script>
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
	<%
		session.removeAttribute("error_msg");
	%>
</c:if>
</body>
</html>