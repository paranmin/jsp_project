<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	div#section{
		width: 80%;
		margin:0 auto;
	}
	div#section fieldset {
		margin-top:200px;
	}
	div#section table{
		margin-top: 50px;
	}
	div#section table tr{
		height: 50px;
		line-height: 50px;
	}
	div#section table th{
		width: 200px;
		text-align: right;
	}
	
	div#section table td input{
		height: 25px;
	}
	span.ui-spinner.ui-corner-all.ui-widget.ui-widget-content{
		width:170px;
		height: 25px;
		line-height: 25px;
	}
	input.couponName{
		width: 300px;
	}
	div.add{
		text-align: right;
	}
	div.add input{
		width: 100px;
		margin-right: 10px;
		margin-bottom: 50px;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
	  $( "#spinner" ).spinner({
	      min: 5000,
	      step: 5000,
	    });
	  
	  $( "#spinner2" ).spinner({
	      min: 1000,
	      step: 500,
	    });
	  $( "#datepicker" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      dateFormat:"yy-mm-dd"   
	    });
  });
</script>
</head>
<body>
	<form action="regi.do" method="post">
		<div id="section">
			<fieldset>
				<table>
					<tr>
						<th>쿠폰 번호</th>
						<% 
							Date i = new Date();
							SimpleDateFormat sdft = new SimpleDateFormat("yyyyMMddHHmmss");
							String couponNum = sdft.format(i);
						%>
						<td><input type="text" name="couponNo" value="<%=couponNum%>" readonly="readonly"></td>
					</tr>
					<tr>
						<th>쿠폰 이름</th>
						<td><input type="text" name="couponName" class="couponName"></td>
					</tr>
					<tr>
						<th>쿠폰 사용 가능 금액</th>
						<td><input id="spinner" name="MorePrice" value="5000">원</td>
					</tr>
					<tr>
						<th>할인 금액</th>
						<td><input id="spinner2" name="salePrice" value="1000">원</td>
					</tr>
					<tr>
						<th>쿠폰 사용 기한</th>
						<td><input type="text" id="datepicker" name="dateLimit">까지</td>
					</tr>
				</table>
				<div class="add">
					<input type="submit" value="전송"><input type="reset" value="취소">
				</div>
			</fieldset>
		</div>
	</form>

</body>
</html>