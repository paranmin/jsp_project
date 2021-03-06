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
		$(".deletecp").click(function(){
			var checkedCp = [];
			jQuery.ajaxSettings.traditional = true;
			$("input:checkbox[name='chkbox']").each(function(i,obj){
				if($(this).is(":checked")==true){
					checkedCp.push($(obj).val());
				}
			});
			
			$.ajax({
				url:"deleteCp.do",
				type:"post",
				dataType:"json",
				data:{"checkedCp":checkedCp},
				success:function(data){
					if(data.result=="ok"){
						location.href="list.do"
					};
					
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
					<c:forEach var="items" items="${list }">
						<tr>
							<td class="text3" id="nosize"><input type="checkbox"
								name="chkbox" class="chkbox" value="${items.coupon.no }"></td>
							<td class="text1">${items.coupon.no }</td>
							<td class="text2">${items.coupon.name }</td>
							<td class="text1">${items.coupon.cuseMorePrice }원이상</td>
							<td class="text1">${items.coupon.csalePrice }원</td>
							<td class="text3"><fmt:formatDate
									value="${items.coupon.climitDate }" pattern="yyy-MM-dd" />까지</td>
							<td class="text3">
								<%
									Date now = new Date();
											pageContext.setAttribute("now", now);
								%>
								 <c:if test="${items.coupon.climitDate>=now }">
									사용가능
								</c:if> 
								<c:if test="${items.coupon.climitDate<now }">
									<p class="deaddate">기간만료</p>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td><button class="deletecp" name="delCp">삭제</button></td>
					<td colspan="6"></td>
				</tr>
			</table>
		</div>

</body>
</html>