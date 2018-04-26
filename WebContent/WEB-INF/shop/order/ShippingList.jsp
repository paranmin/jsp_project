<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>배송지목록</title>
<style>
	header{
		background-image: url("../../images/couponBackground.jpg");
		height: 50px;
	}
	header h1{
		font-size: 21px;
		padding-left: 20px;
		line-height: 50px;
	}
	section ul{
		list-style: none;
		padding-left: 5px;
	}
	section li{
		height:53px;
		border-top: 1px solid #EAEAEA;
		border-bottom: 1px solid #EAEAEA;
		font-size: 13px;
	}
	section input{
		border:1px solid black;
		background-color: white;
	}
	section li table{
		width: 100%;
	}
	section li table td.username{
		width: 80px;
	}
	section li table td.useraddress{
		width: 324px;
	}
	section li table td.choiceaddr{
		width: 72px;
	}
	section div.delBtns{
		text-align: right;
	}
	section div.delBtns input{
		margin-right: 2px;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>" media="all" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".checkedDel").click(function(){
		jQuery.ajaxSettings.traditional = true;
		var addrNo = [];
		$(".routineList").each(function(i,obj){
			var flag = $("input:checkbox[name='chk']").eq(i).is(":checked");
			if(flag == true){
				var addrValue = $("input:checkbox[name='chk']").eq(i).val();
				addrNo.push(addrValue);
			}
		})
		console.log(addrNo);
		$.ajax({
			url:"ShippingRemove.do",
			type:"post",
			dataType:"json",
			data:{"addrNo":addrNo},
			success:function(data){
				if(data.rel == "ok"){
					location.href="shipping.do"
				};
			}
		})
		return false;		
	})
	$("input:reset[name='closeSubSWindow']").click(function(){
		window.close();
	})
	$("input:submit[name='selectAddr']").click(function(){
		var addrNo = $(this).parent().prev().prev().prev().prev().children().val();
		var addr = $(this).parent().prev().text();
		var addrName = $(this).parent().prev().prev().text();
		var zipcode = $(this).parent().prev().prev().prev().text();
		 var returnaddrValue = {
				"addrNo":addrNo,
				"addr":addr,
				"zipcode":zipcode
		};
		var result = confirm(addrName+"/"+addr+"을 선택하시겠습니까?");
		if(result){
			window.close();
		}
		window.opener.getReturnValueaddr(JSON.stringify(returnaddrValue));
	})
	
})
</script>
</head>
<body>
	<form action="shipping.do" method="post">
		<header>
			<h1>최근 배송지</h1>
		</header>
		<section>
			<ul class="delivery">
				<c:if test="${list.size()==0 }">
					<li>
						<table>
							<tr>
								<td>등록된 배송지가 없습니다.</td>
							</tr>
						</table>
					</li>
				</c:if>
				<c:if test="${list.size()>0 }">
					<c:forEach items="${list }" var="items">
					<li class="routineList">
						<table>
							<tr>
								<td class="chkbox"><input type="checkbox" name="chk" value="${items.addrNo }"></td>
								<td>${items.zipcode }</td>
								<td class="username">${items.addrName }</td>
								<td class="useraddress">${items.addr1 } / ${items.addr2 }</td>
								<td class="choiceaddr"><input type="submit" value="선택하기" name="selectAddr"></td>
							</tr>
						</table>
					</li>
					</c:forEach>
				</c:if>
			</ul>
			<div class="delBtns">
				<input type="submit" value="선택삭제" name="checkedDel" class="checkedDel"><input type="reset" value="닫기" name="closeSubSWindow">
			</div>
		</section>
	</form>
</body>
</html>