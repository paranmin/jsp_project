<%@page import="com.dgit.mall.dto.Member"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Member modifyMem = (Member) request.getAttribute("member");
%>
<div id="container">
	<h2>회원 정보 수정</h2>
	<h3>기본 정보</h3>
	<form action="modify.do" method="post">
	<input type="hidden" name="no" value="${member.no}" />
		<table class="modify">
			<colgroup>
			<col width="13%">
			<col width="38%">
			<col width="13%">
			<col width="38%">
			</colgroup>
			<tr>
				<th>아이디</th>
				<td>${member.id}</td>
				<th>이름</th>
				<td><input type="text" name="name" value="${member.name}" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="3">
					<input type="password" name="password" class="checkPwd"  />
					<input type="password" name="chkPassword" class="checkPwd"  />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">
				<%
				if (modifyMem.getEmail() != null && !modifyMem.getEmail().equals("")) {
					String[] email = modifyMem.getEmail().split("@");
					pageContext.setAttribute("emailId", email[0]);
					pageContext.setAttribute("emailBody", email[1]);
				}
				%>
				<input type="text" name="email1" value="${emailId}" class="checkEmail" data-checkdupl="Y" /> @ <input type="text" name="email2" value="${emailBody}" class="checkEmail" />
					<select name="email_type" class="checkEmail">
						<option value="input">직접입력</option>
						<option value="naver.com"<c:if test="${emailBody == 'naver.com'}"> selected </c:if>>naver.com</option>
						<option value="hotmail.com"<c:if test="${emailBody == 'hotmail.com'}"> selected </c:if>>hotmail.com</option>
						<option value="hanmail.net"<c:if test="${emailBody == 'hanmail.net'}"> selected </c:if>>hanmail.net</option>
						<option value="yahoo.co.kr"<c:if test="${emailBody == 'yahoo.co.kr'}"> selected </c:if>>yahoo.co.kr</option>
						<option value="paran.com"<c:if test="${emailBody == 'paran.com'}"> selected </c:if>>paran.com</option>
						<option value="nate.com"<c:if test="${emailBody == 'nate.com'}"> selected </c:if>>nate.com</option>
						<option value="empal.com"<c:if test="${emailBody == 'empal.com'}"> selected </c:if>>empal.com</option>
						<option value="dreamwiz.com"<c:if test="${emailBody == 'dreamwiz.com'}"> selected </c:if>>dreamwiz.com</option>
						<option value="hanafos.com"<c:if test="${emailBody == 'hanafos.com'}"> selected </c:if>>hanafos.com</option>
						<option value="korea.com"<c:if test="${emailBody == 'korea.com'}"> selected </c:if>>korea.com</option>
						<option value="chol.com"<c:if test="${emailBody == 'chol.com'}"> selected </c:if>>chol.com</option>
						<option value="gmail.com"<c:if test="${emailBody == 'gmail.com'}"> selected </c:if>>gmail.com</option>
						<option value="lycos.co.kr"<c:if test="${emailBody == 'lycos.co.kr'}"> selected </c:if>>lycos.co.kr</option>
						<option value="netian.com"<c:if test="${emailBody == 'netian.com'}"> selected </c:if>>netian.com</option>
						<option value="hanmir.com"<c:if test="${emailBody == 'hanmir.com'}"> selected </c:if>>hanmir.com</option>
						<option value="sayclub.com"<c:if test="${emailBody == 'sayclub.com'}"> selected </c:if>>sayclub.com</option>
					</select> <a href="#" class="btn" onclick="checkDulpEmail();return false;">중복확인</a>
					<p>
						<input type="checkbox" name="push_email" id="push_email" value="Y" <c:if test="${member.pushEmail == 'Y'}">checked </c:if>/> <label for="push_email">정보/이벤트 MAIL 수신에 동의합니다.</label>
					</p>
				</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td colspan="3">
				<%
				if (modifyMem.getPhone() != null && !modifyMem.getPhone().equals("")) {
					String[] phone = modifyMem.getPhone().split("-");
					for (int i = 0; i < phone.length; i++) {
						pageContext.setAttribute("phone"+(i+1), phone[i]);
					}
				}
				%>
					<select name="phone1" class="checkPhone">
						<option value="">선택</option>
						<option value="010"<c:if test="${phone1 == '010'}"> selected </c:if>>010</option>
						<option value="011"<c:if test="${phone1 == '011'}"> selected </c:if>>011</option>
						<option value="016"<c:if test="${phone1 == '016'}"> selected </c:if>>016</option>
						<option value="017"<c:if test="${phone1 == '017'}"> selected </c:if>>017</option>
						<option value="018"<c:if test="${phone1 == '018'}"> selected </c:if>>018</option>
						<option value="019"<c:if test="${phone1 == '019'}"> selected </c:if>>019</option>
						<option value="02"<c:if test="${phone1 == '02'}"> selected </c:if>>서울 (02)</option>
						<option value="031"<c:if test="${phone1 == '031'}"> selected </c:if>>경기 (031)</option>
						<option value="032"<c:if test="${phone1 == '032'}"> selected </c:if>>인천 (032)</option>
						<option value="033"<c:if test="${phone1 == '033'}"> selected </c:if>>강원 (033)</option>
						<option value="041"<c:if test="${phone1 == '041'}"> selected </c:if>>충남 (041)</option>
						<option value="042"<c:if test="${phone1 == '042'}"> selected </c:if>>대전 (042)</option>
						<option value="043"<c:if test="${phone1 == '043'}"> selected </c:if>>충북 (043)</option>
						<option value="044"<c:if test="${phone1 == '044'}"> selected </c:if>>세종 (044)</option>
						<option value="051"<c:if test="${phone1 == '051'}"> selected </c:if>>부산 (051)</option>
						<option value="052"<c:if test="${phone1 == '052'}"> selected </c:if>>울산 (052)</option>
						<option value="053"<c:if test="${phone1 == '053'}"> selected </c:if>>대구 (053)</option>
						<option value="054"<c:if test="${phone1 == '054'}"> selected </c:if>>경북 (054)</option>
						<option value="055"<c:if test="${phone1 == '055'}"> selected </c:if>>경남 (055)</option>
						<option value="061"<c:if test="${phone1 == '061'}"> selected </c:if>>전남 (061)</option>
						<option value="062"<c:if test="${phone1 == '062'}"> selected </c:if>>광주 (062)</option>
						<option value="063"<c:if test="${phone1 == '063'}"> selected </c:if>>전북 (063)</option>
						<option value="064"<c:if test="${phone1 == '064'}"> selected </c:if>>제주 (064)</option>
						<option value="0502"<c:if test="${phone1 == '0502'}"> selected </c:if>>KT (0502)</option>
						<option value="0503"<c:if test="${phone1 == '0503'}"> selected </c:if>>온세텔레콤(0503)</option>
						<option value="0504"<c:if test="${phone1 == '0504'}"> selected </c:if>>온세텔레콤(0504)</option>
						<option value="0505"<c:if test="${phone1 == '0505'}"> selected </c:if>>Dacom (0505)</option>
						<option value="0507"<c:if test="${phone1 == '0507'}"> selected </c:if>>온세텔레콤(0507)</option>
						<option value="070"<c:if test="${phone1 == '070'}"> selected </c:if>>인터넷전화 (070)</option>
						<option value="080"<c:if test="${phone1 == '080'}"> selected </c:if>>착신 과금 서비스 (080)</option>
					</select> - <input type="text" name="phone2" maxlength="4" size="4" value="${phone2}" class="checkPhone" /> - 
					<input type="text" name="phone3" maxlength="4" size="4" value="${phone3}" class="checkPhone" />
					<p>
						<input type="checkbox" name="push_sms" id="push_sms" value="Y" <c:if test="${member.pushSMS == 'Y'}">checked </c:if>/> <label for="push_sms">정보/이벤트 SMS 수신에 동의합니다.</label>
					</p>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3">
					<input type="text" name="zipcode" class="checkZipcode" maxlength="7" size="7" value="${memberAddr.zipcode}" readonly /> <a href="#" class="btn" onclick="daumPostcode('input[name=zipcode]', 'input[name=addr1]', 'input[name=addr2]'); return false;">우편번호</a><br>
					<p>
						<input type="text" name="addr1" class="checkZipcode form_addr" value="${memberAddr.addr1}" readonly /> <input type="text" name="addr2" class="checkZipcode form_addr" value="${memberAddr.addr2}" />
					</p>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
				<%
				if (modifyMem.getTel() != null && !modifyMem.getTel().equals("")) {
					String[] tel = modifyMem.getTel().split("-");
					for (int i = 0; i < tel.length; i++) {
						pageContext.setAttribute("tel"+(i+1), tel[i]);
					}
				}
				%>
					<select name="tel1" class="checkTel">
						<option value="">선택</option>
						<option value="010"<c:if test="${tel1 == '010'}"> selected </c:if>>010</option>
						<option value="011"<c:if test="${tel1 == '011'}"> selected </c:if>>011</option>
						<option value="016"<c:if test="${tel1 == '016'}"> selected </c:if>>016</option>
						<option value="017"<c:if test="${tel1 == '017'}"> selected </c:if>>017</option>
						<option value="018"<c:if test="${tel1 == '018'}"> selected </c:if>>018</option>
						<option value="019"<c:if test="${tel1 == '019'}"> selected </c:if>>019</option>
						<option value="02"<c:if test="${tel1 == '02'}"> selected </c:if>>서울 (02)</option>
						<option value="031"<c:if test="${tel1 == '031'}"> selected </c:if>>경기 (031)</option>
						<option value="032"<c:if test="${tel1 == '032'}"> selected </c:if>>인천 (032)</option>
						<option value="033"<c:if test="${tel1 == '033'}"> selected </c:if>>강원 (033)</option>
						<option value="041"<c:if test="${tel1 == '041'}"> selected </c:if>>충남 (041)</option>
						<option value="042"<c:if test="${tel1 == '042'}"> selected </c:if>>대전 (042)</option>
						<option value="043"<c:if test="${tel1 == '043'}"> selected </c:if>>충북 (043)</option>
						<option value="044"<c:if test="${tel1 == '044'}"> selected </c:if>>세종 (044)</option>
						<option value="051"<c:if test="${tel1 == '051'}"> selected </c:if>>부산 (051)</option>
						<option value="052"<c:if test="${tel1 == '052'}"> selected </c:if>>울산 (052)</option>
						<option value="053"<c:if test="${tel1 == '053'}"> selected </c:if>>대구 (053)</option>
						<option value="054"<c:if test="${tel1 == '054'}"> selected </c:if>>경북 (054)</option>
						<option value="055"<c:if test="${tel1 == '055'}"> selected </c:if>>경남 (055)</option>
						<option value="061"<c:if test="${tel1 == '061'}"> selected </c:if>>전남 (061)</option>
						<option value="062"<c:if test="${tel1 == '062'}"> selected </c:if>>광주 (062)</option>
						<option value="063"<c:if test="${tel1 == '063'}"> selected </c:if>>전북 (063)</option>
						<option value="064"<c:if test="${tel1 == '064'}"> selected </c:if>>제주 (064)</option>
						<option value="0502"<c:if test="${tel1 == '0502'}"> selected </c:if>>KT (0502)</option>
						<option value="0503"<c:if test="${tel1 == '0503'}"> selected </c:if>>온세텔레콤(0503)</option>
						<option value="0504"<c:if test="${tel1 == '0504'}"> selected </c:if>>온세텔레콤(0504)</option>
						<option value="0505"<c:if test="${tel1 == '0505'}"> selected </c:if>>Dacom (0505)</option>
						<option value="0507"<c:if test="${tel1 == '0507'}"> selected </c:if>>온세텔레콤(0507)</option>
						<option value="070"<c:if test="${tel1 == '070'}"> selected </c:if>>인터넷전화 (070)</option>
						<option value="080"<c:if test="${tel1 == '080'}"> selected </c:if>>착신 과금 서비스 (080)</option>
					</select> - <input type="text" name="tel2" maxlength="4" size="4" value="${tel2}" class="checkTel"  /> - 
					<input type="text" name="tel3" maxlength="4" size="4" value="${tel3}" class="checkTel" />
				</td>
				<th>회원가입일</th>
				<td><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</table>
		<h3>부가 정보</h3>
		<table class="modify">
			<colgroup>
			<col width="13%">
			<col width="38%">
			<col width="13%">
			<col width="38%">
			</colgroup>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="male" id="male" <c:if test="${member.gender == 'MALE'}">checked </c:if>/> <label for="male">남</label> 
					<input type="radio" name="gender" value="female" id="female" <c:if test="${member.gender == 'FEMALE' || member.gender == ''}">checked </c:if>/> <label for="female">여</label>
				</td>
				<th>생년월일</th>
				<td>
					<select name="year">
						<option value="">선택</option>
					<%
						String[] birth = new String[] {"0", "0", "0"};
						if (modifyMem.getBirth() != null && !modifyMem.getBirth().equals("")) {
							birth = modifyMem.getBirth().split("-");
							pageContext.setAttribute("birthMonth", birth[1]);
							pageContext.setAttribute("birthDay", birth[2]);
						}
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
						String sYear = sdf.format(new Date());
						int year = Integer.parseInt(sYear);
						for (int i = year, end = year - 100; i > end; i--) {
							String selected = (i == Integer.parseInt(birth[0])) ? " selected" : "";
							out.println(String.format("<option value=\"%1$s\"%2$s>%1$s</option>", i, selected));
						}
					%>
					</select> 년 
					<select name="month">
						<option value="">선택</option>
					<c:forEach var="month" begin="1" end="12" step="1">
						<option value="${month < 10 ? 0+=month : month}"<c:if test="${month == birthMonth}"> selected </c:if>>${month}</option>
					</c:forEach>
					</select> 월
					<select name="day">
						<option value="">선택</option>
					<c:forEach var="day" begin="1" end="31" step="1">
						<option value="${day < 10 ? 0+=day : day}"<c:if test="${day == birthDay}"> selected </c:if>>${day}</option>
					</c:forEach>
					</select> 일 
				</td>
			</tr>
		</table>
		<p class="btn">
			<a href="modify.do" class="ok">수정</a>
			<a href="list.do" class="cancel">취소</a>
			<a href="#" class="leave">탈퇴</a>
		</p>
	</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function() {
	$(".checkEmail").on("change", function() {
		$("input[name='email1']").data("checkdupl", "N");
	});
	$("select[name='email_type']").on("change", function() {
		if ($(this).val() == "input") {
			$("input[name='email2']").val("");
			$("input[name='email2']").focus();
		} else {
			$("input[name='email2']").val($(this).val());
		}
	});
	$("p.btn a.leave").on("click", function() {
		if (confirm("정말 탈퇴처리하시겠습니까?")) {
			var no = $("input[name='no']").val();
			$.ajax({
				url: "<%= request.getContextPath() + "/shop/leave.do" %>",
				type: "post",
				data: {"type": "admin", "no": no},
				dataType: "json",
				success: function(data) {
					alert(data.msg);
					if (data.result == 'yes') {
						location.href = "list.do";
					}
					return;
				}
			});
		}
		return false;
	});
	$("p.btn a.ok").on("click", function() {
		var isCheck = true,
			checkPwd = 0;

		if ($("input[name='name']").val().trim() == '') {
			alert("이름을 입력해주세요.");
			$("input[name='name']").val("");
			$("input[name='name']").focus();
			return false;
		}
		$("input.checkPwd").each(function(i, obj) {
			if ($(obj).val().trim() == '') {
				++checkPwd;
			}
		});
		if (checkPwd != 0 && checkPwd < 2) {
			if ($("input[name='password']").val().trim() == '') {
				alert("비밀번호를 입력해주세요.");
				$("input[name='password']").val("");
				$("input[name='password']").focus();
				return false;
			}
			if ($("input[name='chkPassword']").val().trim() == '') {
				alert("비밀번호 확인을 입력해주세요.");
				$("input[name='chkPassword']").val("");
				$("input[name='chkPassword']").focus();
				return false;
			}
		}
		if (checkPwd == 0) {
			if ($("input[name='password']").val().trim() != $("input[name='chkPassword']").val().trim()) {
				alert("비밀번호가 틀립니다.");
				$("input[name='password']").val("");
				$("input[name='password']").focus();
				return false;
			}
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
<c:if test="${error_msg != null && error_msg != ''}">
	<script>
		alert("${error_msg}");
	</script>
	<%
		session.removeAttribute("error_msg");
	%>
</c:if>