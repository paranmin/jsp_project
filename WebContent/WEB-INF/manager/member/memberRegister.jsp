<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="container">
	<h2>회원 등록</h2>
	<form action="register.do" method="post">
		<table class="register">
			<colgroup>
				<col width="15%" />
				<col />
			</colgroup>
			<tr>
				<td><span class="required">*</span> 이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td><span class="required">*</span> 아이디</td>
				<td><input type="text" name="id" data-checkDuplId="N" /> <a href="#" class="btn" onclick="checkDuplId('input[name=id]'); return false;">중복체크</a></td>
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
				<td>&nbsp;&nbsp;생일/성별</td>
				<td>
					<select name="year">
						<option value="">선택</option>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
						String sYear = sdf.format(new Date());
						int year = Integer.parseInt(sYear);
						for (int i = year, end = year - 100; i > end; i--) {
							out.println(String.format("<option value=\"%1$s\">%1$s</option>", i));
						}
					%>
					</select> 년 
					<select name="month">
						<option value="">선택</option>
					<c:forEach var="month" begin="1" end="12" step="1">
						<option value="${month}">${month}</option>
					</c:forEach>
					</select> 월
					<select name="day">
						<option value="">선택</option>
					<c:forEach var="day" begin="1" end="31" step="1">
						<option value="${day}">${day}</option>
					</c:forEach>
					</select> 일 
					<input type="radio" name="gender" value="male" id="male" /> <label for="male">남</label> 
					<input type="radio" name="gender" value="female" id="female" checked /> <label for="female">여</label> 
					
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;우편번호</td>
				<td><input type="text" name="zipcode" class="checkZipcode" maxlength="7" size="7" readonly /> <a href="#" class="btn" onclick="daumPostcode('input[name=zipcode]', 'input[name=addr1]', 'input[name=addr2]'); return false;">우편번호</a></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;집주소</td>
				<td><input type="text" name="addr1" class="checkZipcode form_addr" readonly /></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;상세주소</td>
				<td><input type="text" name="addr2" class="checkZipcode form_addr" /></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;연락처</td>
				<td>
					<select name="tel1" class="checkTel">
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
					</select> - <input type="text" name="tel2" maxlength="4" size="4" class="checkTel"  /> - 
					<input type="text" name="tel3" maxlength="4" size="4" class="checkTel" />
				</td>
			</tr>
			<tr>
				<td><span class="required">*</span> 휴대폰</td>
				<td>
					<select name="phone1" class="checkPhone">
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
					</select> - <input type="text" name="phone2" maxlength="4" size="4" class="checkPhone" /> - 
					<input type="text" name="phone3" maxlength="4" size="4" class="checkPhone" />
				</td>
			</tr>
			<tr>
				<td><span class="required">*</span> 이메일</td>
				<td>
				<input type="text" name="email1" class="checkEmail" data-checkDupl="N" /> @ 
					<select name="email2" class="checkEmail">
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
						<option value="gmail.com">gmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="netian.com">netian.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="sayclub.com">sayclub.com</option>
					</select> <a href="#" class="btn" onclick="checkDulpEmail();return false;">중복확인</a></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;뉴스메일</td>
				<td>
					<input type="radio" name="newsmail" value="Y" id="newsok" /> <label for="newsok">받습니다.</label>
					<input type="radio" name="newsmail" value="N" id="nonews" checked /> <label for="nonews">받지 않습니다.</label>
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;SMS안내</td>
				<td>
					<input type="radio" name="sms" value="Y" id="smsok" /> <label for="smsok">받습니다.</label>
					<input type="radio" name="sms" value="N" id="nosms" checked /> <label for="nosms">받지 않습니다.</label>
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;앱Push알림</td>
				<td>
					<input type="radio" name="push" value="Y" id="pushok" /> <label for="pushok">받습니다.</label>
					<input type="radio" name="push" value="N" id="nopush" checked /> <label for="nopush">받지 않습니다.</label>
				</td>
			</tr>
		</table>
		
		<p class="btn">
			<a href="register.do" class="ok">등록</a>
			<a href="list.do" class="cancel">취소</a>
		</p>
	</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function() {
	$(".checkEmail").on("change", function() {
		$("input[name='email1']").data("checkdupl", "N");
	});
	$("p.btn a.ok").on("click", function() {
		var isCheck = true;

		if ($("input[name='name']").val().trim() == '') {
			alert("이름을 입력해주세요.");
			$("input[name='name']").val("");
			$("input[name='name']").focus();
			return false;
		}
		if ($("input[name='id']").val().trim() == '') {
			alert("아이디를 입력해주세요.");
			$("input[name='id']").val("");
			$("input[name='id']").focus();
			return false;
		}
		if ($("input[name='id']").data("checkduplid") == "N") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if ($("input[name='password']").val().trim() == '') {
			alert("비밀번호를 입력해주세요.");
			$("input[name='password']").val("");
			$("input[name='password']").focus();
			return false;
		}
		if ($("input[name='checkPwd']").val().trim() == '') {
			alert("비밀번호 확인을 입력해주세요.");
			$("input[name='checkPwd']").val("");
			$("input[name='checkPwd']").focus();
			return false;
		}
		if ($("input[name='password']").val().trim() != $("input[name='checkPwd']").val().trim()) {
			alert("비밀번호가 틀립니다.");
			$("input[name='password']").val("");
			$("input[name='password']").focus();
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
		if ($("input[name='email1']").data("checkdupl") == "N") {
			alert("이메일 중복확인을 해주세요.");
			return false;
		}
		$("form").submit();
		return false;
	});
});
</script>
