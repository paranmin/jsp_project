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
	<table class="modify">
		<colgroup>
		<col width="150px">
		<col width="600px">
		<col width="150px">
		<col>
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
				String[] email = modifyMem.getEmail().split("@");
				pageContext.setAttribute("emailId", email[0]);
				pageContext.setAttribute("emailBody", email[1]);
			%>
			<input type="text" name="email1" value="${emailId}" class="checkEmail" /> @ <input type="text" name="email2" value="${emailBody}" class="checkEmail" />
				<select name="email_type" class="checkEmail">
					<option value="">직접입력</option>
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
					<input type="checkbox" name="push_email" id="push_email" value="Y" /> <label for="push_email">정보/이벤트 MAIL 수신에 동의합니다.</label>
				</p>
			</td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td colspan="3">
			<%
				String[] phone = modifyMem.getPhone().split("-");
				for (int i = 0; i < phone.length; i++) {
					pageContext.setAttribute("phone"+(i+1), phone[i]);
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
					<input type="checkbox" name="push_sms" id="push_sms" value="Y" /> <label for="push_sms">정보/이벤트 SMS 수신에 동의합니다.</label>
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
				String[] tel = modifyMem.getPhone().split("-");
				for (int i = 0; i < tel.length; i++) {
					pageContext.setAttribute("tel"+(i+1), tel[i]);
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
		<col width="150px">
		<col width="600px">
		<col width="150px">
		<col>
		</colgroup>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="male" id="male" /> <label for="male">남</label> 
				<input type="radio" name="gender" value="female" id="female" checked /> <label for="female">여</label>
			</td>
			<th>생년월일</th>
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
			</td>
		</tr>
	</table>
</div>
<script>
$(function() {
	
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