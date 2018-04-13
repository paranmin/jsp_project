<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	div.table{
		width: 80%;
		margin:0 auto;
	}
	table{
		margin-top: 100px;
		border-collapse: collapse;
		margin-bottom: 50px;
	}
	tr,th,td{
		border:1px solid black;
	}
	table th.width1{
		width: 200px;
	}
	table th.width2{
		width: 500px;
	}
	table th.width3{
		width: 250px;
	}
	table th.width4{
		width: 80px;
	}
	td.text1{
		text-align: right;
	}
	td.text2{
		padding-left: 20px;
	}
	td.text3{
		text-align: center;
	}
	input.statecp{
		border:none;
		color:red;
		font-weight: bold;
	}
	button.deletecp{
		width: 75px;
	}
	p.deaddate{
		color:red;
		font-weight: bold;
	}
	div.search{
		width: 70%;
		margin:0 auto;
		overflow: hidden;
		height: 30px;
		margin-bottom: 30px;
	}
	div.search p.selectb{
		float: left;
		text-align: center;
		margin-right: 10px;
	}
	div.search p.selectb select{
		height: 25px;
		line-height: 25px;
	}
	div.search p.searchb{
		float:left;
		height: 25px;
		line-height: 25px;
		margin-right: 10px;
	}
	div.search p.searchb input{
		width:700px;
		height: 25px;
		line-height: 25px;
	}
	div.search p.submitb{
		float:left;
		height: 25px;
		line-height: 25px;
		margin-right: 10px;
	}
	div.search input.searchBtn{
		width:100px;
		height: 25px;
		line-height: 25px;
	}
	table.tablewidth{
		margin:0 auto;
	}
	div.addCoupontoMember{
		margin-top:20px;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input:checkbox[name='check']").click(function(){
			var flag = $("input:checkbox[name='check']").is(":checked");
			if(flag==false){
				$(".chkbox").prop("checked",false);
			}else if(flag==true){
				$(".chkbox").prop("checked",true);
			}
		})
		$("#nosize").each(function(i,obj){
			$(".chkbox").click(function(){
				if($(this).parent().eq(i).children().is(":checked")==false){
					$("input:checkbox[name='check']").prop("checked",false);
				}
			})			
		})
		
		$("input:checkbox[name='allchk']").click(function(){
			var flag = $("input:checkbox[name='allchk']").is(":checked");
			if(flag==false){
				$(".chkmember").prop("checked",false);
			}else if(flag==true){
				$(".chkmember").prop("checked",true);
			}
		})
					
		$(".addCoupon").click(function(){
			jQuery.ajaxSettings.traditional = true;
			var couponlist = [];
			var memberlist = [];
			$("input:checkbox[name='chkbox']").each(function(i,obj){
				if($(this).is(":checked")==true){
					couponlist.push($(obj).val());
				}
			})
			$("input:checkbox[name='chkmember']").each(function(i,obj){
				if($(this).is(":checked")==true){
					memberlist.push($(obj).val());
					console.log(memberlist);
				}
			})
			if(couponlist.length == 0  || memberlist.length == 0){
				alert("쿠폰,멤버를 선택해주세요");
				return false;
			}
			$.ajax({
				url:"insertcptomember.do",
				type"post",
				dataType:"json",
				data:{"couponlist":couponlist,"memberlist":memberlist},
				success:function(data){
					
				}
			})
		})
		
	})
</script>
</head>
<body>
	<div class="table">
		<table>
			<tr>
				<th class="width4"><input type="checkbox" name="check"></th>
				<th class="width1">쿠폰 번호</th>
				<th class="width2">쿠폰 명</th>
				<th class="width1">쿠폰 사용 가능 금액</th>
				<th class="width1">할인 금액</th>
				<th class="width3">쿠폰 사용 기한</th>
				<th class="width1">쿠폰 상태</th>
			</tr>
			<c:if test="${list.size()==0 }">
				<tr>
					<td colspan="5">쿠폰이 없습니다. 쿠폰을 등록해주세요</td>
			</c:if>
			<c:if test="${list.size() > 0 }">
				<%
						Date now = new Date();
						pageContext.setAttribute("now", now);
					%>
				<c:forEach var="items" items="${list }">
					<tr>
						<td class="text3" id="nosize"><c:if
								test="${items.climitDate>=now }">
								<input type="checkbox" name="chkbox" class="chkbox"
									value="${items.cNo }">
							</c:if></td>
						<td class="text1">${items.cNo }</td>
						<td class="text2">${items.cName }</td>
						<td class="text1">${items.cuseMorePrice }원이상</td>
						<td class="text1">${items.csalePrice }원</td>
						<td class="text3"><fmt:formatDate
								value="${items.climitDate }" pattern="yyy-MM-dd" />까지</td>
						<td class="text3"><c:if test="${items.climitDate>=now }">
									사용가능
								</c:if> <c:if test="${items.climitDate<now }">
								<p class="deaddate">기간만료</p>
							</c:if></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="search">
			<form action="regiuser.do">
			<p class="selectb">
					<select name="search">
						<option value="id"<c:if test="${where == 'id'}"> selected </c:if>>Id</option>
						<option value="name"<c:if test="${where == 'name'}"> selected </c:if>>이름</option>
						<option value="phone"<c:if test="${where == 'phone'}"> selected </c:if>>휴대폰 번호</option>
					</select>
				</p>
				<p class="searchb">
					<input type="search" name="valueSearch" value="${query}">
				</p>
				<p class="submitb">
					<input type="submit" value="검색" class="searchBtn" />
				</p>
			</form>
		</div>
		<table class="tablewidth">
			<tr>
				<th class="width4"><input type="checkbox" class="allchk" name="allchk"></th>
				<th class="width1">아이디</th>
				<th class="width1">이름</th>
				<th class="width2">휴대폰 번호</th>
			</tr>
			<c:if test="${mlist.size()==0 }">
				<tr>
					<td>회원가입한 고객이 없습니다.</td>
				</tr>			
			</c:if>
			<c:if test="${mlist.size() > 0 }">
				<c:forEach var="list" items="${mlist }">
					<tr>
						<td class="text3"><input type="checkbox" name="chkmember" value="${list.no }" class="chkmember"></td>
						<td class="text3">${list.id }</td>
						<td class="text3">${list.name }</td>
						<td class="text3">${list.phone }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="addCoupontoMember">
			<button class="addCoupon" name="addCoupontoMember">쿠폰 보내기</button>
		</div>
	</div>


</body>
</html>