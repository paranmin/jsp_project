<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset.productAdd{
	width:60%;
	margin:50px auto;
	padding:10px;
}
fieldset.productAdd label{
	width:150px;
	float:left;
}
fieldset.productAdd input[type='text']{
	width:400px;
}
fieldset.productAdd input#price{
	width:100px;
}
fieldset.productAdd input#cost{
	width:100px;
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
fieldset.productAdd p{
	margin:20px;
}
fieldset.productAdd button{
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
	display:none;
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
				<!-- <p class="error">제목을 입력하세요.</p> -->
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
				<input type="text" value="" readonly="readonly">
			</p>
			<p>
				<label>판매가</label>
				<input type="text" value="" id="price" readonly="readonly">원  
			</p>
			<p>
				<label>재고</label>
				<input type="text" value="" readonly="readonly">
			</p>
			<p>
				<label>상품 메인 이미지</label>
				<div class="img_main_plus">
					<input type="file" name="mainimg" value="이미지 불러오기">
					<!-- <button class="img_main_plus">추가</button> -->
				</div>
			</p>
			<p>
				<label>상품 상세 이미지</label>
				<div class="img_plus">
				<input type="file" name="files" value="이미지 불러오기">
				<button class="img_plus">추가</button>
				</div>
			</p>

			<p>
				<label>옵션 유무</label>
				<input type="radio" id="option" name="use_option" value="1" readonly="readonly">사용 
				<input type="radio" id="option" name="use_option" value="0" checked="checked" readonly="readonly">사용안함
			</p>
			<table id="proOption">
				<tr>
					<th id="opname">옵션명</th>
					<th id="opvalue">옵션값</th>
					<th id="opprice">옵션가</th>
				</tr>
				<tr class="parent" id="first">
					<td rowspan="1">
						<input type="text" name="op_name" class="op_name">
					</td>
					<td>
						<input type="text" name="op_desc" class="op_desc">
					</td>
					<td>
						<input type="text" name="op_cost" class="op_cost" value="0">
					</td>
				</tr>
			</table>		
			<p class="submit">
				<input type="submit" value="수정">
				<input type="reset" value="돌아가기">
			</p>
		</fieldset>
	</form>
</body>
</html>