<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset.productDetail{
	width:60%;
	margin:50px auto;
	padding:10px;
}
fieldset.productDetail label{
	width:150px;
	float:left;
}
fieldset.productDetail input[type='text']{
	width:400px;
}
fieldset.productDetail input#price{
	text-align:right;
	width:70px;
}
fieldset.productDetail input#cost{
	text-align:right;
	width:70px;
}
fieldset.productDetail input#discount{
	text-align:right;
	width:70px;
}
fieldset.productDetail input#stock{
	text-align:right;
	width:70px;
}
p.submit{
	text-align:center;
}
p.submit input{
	margin-top:10px;
	width:70px;
	height: 30px;
	border: none;
}
p.submit input[type='submit']{
	background: wheat;
}
fieldset.productDetail p{
	margin:20px;
}
fieldset.productDetail button{
	width:50px;
	border:none;
}
div.img_main_plus{
	margin-left:170px;
}
div.img_plus{
	margin-left:170px;
}
table#proOption th{
	height: 40px;
	background: gainsboro;
}
table#proOption td{
	padding:10px;
}
table#proOption input{
	text-align: center;
}
table#proOption input.op_name{
	width:200px;
}
table#proOption input.op_cost{
	width:150px;
}
table#proOption tr:first-child td{
	text-align: left;
	border:none;
}
table#proOption button#op_nameadd{
	width:100px;  
	height: 25px;  
}
table#proOption{
	width:100%;
	text-align: center;
}
table#proOption th#opname{
	width:20%;
}
table#proOption th#opvalue{
	width:40%;    
}
table#proOption th#opprice{
	width:20%;    
}
table#proOption td{
	border-bottom:1px solid gainsboro;      
}
</style>    
</head>
<body>
	<form action="update.do" method="post">      
		<fieldset class="productDetail">
			<legend>상품 정보</legend>
			<p>
				<label>상품 카테고리</label>
				<input type="text" value="${pro.category }" readonly="readonly">
			</p>
			<p>
				<label>상품 이름</label>
				<input type="text" name="name" value="${pro.name }" readonly="readonly">
			</p>
			<p>
				<label>상품 부가설명</label>
				<input type="text" value="${pro.subDesc }" readonly="readonly">
			</p>
			<p>
				<label>원가</label>
				<input type="text" name="cost" value="${pro.cost }" id="cost" readonly="readonly">원
			</p>
			<p>
				<label>할인</label>
				<input type="text" value="${pro.discountPer }" id="discount" readonly="readonly">
			</p>
			<p>
				<label>판매가</label>
				<input type="text" value="${pro.sellingPrice }" id="price" readonly="readonly">원  
			</p>
			<p>
				<label>재고</label>
				<input type="text" value="${pro.stock }" id="stock" readonly="readonly">개   
			</p>
			<p>
				<label>상품 메인 이미지</label>
				<div class="img_main_plus">
					<img src="${pro.mainImg }">
				</div>
			</p>
			<p>
				<label>상품 상세 이미지</label>
				<div class="img_plus">
					<c:forEach var="pimg" items="${proimg }">
						<img src="${pimg.img }">
					</c:forEach>
				</div>
			</p>
			<p>
				<label>옵션 유무</label>
				<c:if test="${pro.useOption=='1'}">
					<p>사용</p>
				</c:if>
				<c:if test="${pro.useOption=='0'}">
					<p>사용안함</p>
				</c:if>
			</p>
			<c:if test="${pro.useOption=='1'}">
				<table id="proOption">
					<tr>
						<th id="opname">옵션명</th>
						<th id="opvalue">옵션값</th>
						<th id="opprice">옵션가</th>
					</tr>
					<c:set value="0" var="first"/>
					<c:forEach var="option" items="${opt }" varStatus="status">
					<c:set value="${rownum[status.index]-1 }" var="end"/>
						<tr class="parent">
							<td rowspan="${rownum[status.index] }">         
								${option.poName }
							</td>
							<td>
								${res[0].podValue }
							</td>
							<td>
								${res[0].podCost }
							</td>
						</tr>
						<tr>
							<td>
								${res[1].podValue }
							</td>
							<td>
								${res[1].podCost }
							</td>
						</tr>
					</c:forEach>
				</table>		
			</c:if>
			<p class="submit">
				<input type="submit" value="수정">
				<input type="reset" value="돌아가기">
			</p>
		</fieldset>
	</form>
</body>
</html>