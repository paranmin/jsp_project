<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		line-height:50px;
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
</head>
<body>
	<form action="shipping.do" method="post">
		<header>
			<h1>최근 배송지</h1>
		</header>
		<section>
			<ul class="delivery">
				<li>
					<table>
						<tr>
							<td class="chkbox"><input type="checkbox" name="chk"></td>
							<td class="username">이소정</td>
							<td class="useraddress">주소주소</td>
							<td class="choiceaddr"><input type="submit" value="선택하기"></td>
						</tr>
					</table>
				</li>
			</ul>
			<div class="delBtns">
				<input type="button" value="선택삭제"><input type="reset" value="닫기">
			</div>
		</section>
	</form>

</body>
</html>