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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function(){
    $("table#proOption").css("display","none");    
	$("button.img_main_plus").click(function(){
		var $input = $("<input type='file' name='mainimg'>");
		$("div.img_main_plus").append($("<br>"));
		$("div.img_main_plus").append($input);
		return false;
	});
	$("button.img_plus").click(function(){
		var $div = $("<div>");
		var $input = $("<input type='file' name='files'>");
		var $btn = $("<button class='img_del'>");
		$($btn).text("삭제");   
		/* $("div.img_plus").append($("<br>")); */
		$($div).append($input);
		$($div).append($btn);   
		$("div.img_plus").append($div);
		return false;
	});
	
	$(document).on("click","button.img_del", function(){
 		$(this).parent().remove();
 		return false;
 	});
 	
 	$("input#option").change(function(){
 		if($("input#option:checked").val()==1){
 			$("table#proOption").css("display","block"); 
 		}else{
 			$("table#proOption").css("display","none");
 		}
 	});       
	
 	$("button#op_nameadd").click(function(){
		var $tr = $("<tr class='parent'>");
		var td1 = $("<td>");
		var td1in = $("<input type='text' name='op_name' class='op_name'>");
		var td1inbtn = $("<button class='op_nameDel'>");
		var td2 = $("<td>");
		var td2in = $("<input type='text' name='op_desc' class='op_desc'>");
		var td3 = $("<td>");
		var td3in = $("<input type='text' name='op_cost' class='op_cost' value='0'>");
		var td4 = $("<td>");
		var td4in = $("<button class='op_add'>");
		
		$(td1inbtn).text("삭제");
		$(td4in).text("+추가");
		$(td1).append(td1in);
		$(td1).append(td1inbtn);
		$(td2).append(td2in);
		$(td3).append(td3in);
		$(td4).append(td4in);
		$($tr).append(td1);
		$($tr).append(td2);
		$($tr).append(td3);
		$($tr).append(td4);
		$("table#proOption").append($tr);     
		return false;
	});
 	$(document).on("click","button.op_nameDel", function(){
 		var rowspan = $(this).parent().prop("rowspan");
 		for(var i = 1; i<rowspan; i++){
 			var removeT = $(this).parents("tr").next();
 			removeT.remove();
 		} 		
 		var removeTarget = $(this).parents("tr"); 	
 		removeTarget.remove();
 		return false;
 	});
 	$(document).on("click","button.op_add", function(){
 		var $tr = $("<tr>");
		var td2 = $("<td>");
		var td2in = $("<input type='text' name='op_desc' class='op_desc'>");
		var td3 = $("<td>");
		var td3in = $("<input type='text' name='op_cost' class='op_cost' value='0'>");
		var td4 = $("<td>");
		var td4in = $("<button type='button' class='op_del'>");
		$(td4in).text("-삭제");
		$(td2).append(td2in);
		$(td3).append(td3in);
		$(td4).append(td4in);
		$($tr).append(td2);
		$($tr).append(td3);
		$($tr).append(td4);
		$($tr).insertAfter($(this).parent().parent());
 		var rowspan = $(this).parent().siblings().eq(0).prop("rowspan");
 		$(this).parent().siblings().eq(0).prop("rowspan",++rowspan);          
 		return false;        
 	});
 	
 	$(document).on("click","button.op_del", function(){
 		var removeTarget = $(this).parents("tr"); 		
 		var rowTdObj = removeTarget.prevAll(".parent").eq(0).find("td").eq(0);
 		
		var rowspan = rowTdObj.attr("rowspan");
		if(rowspan > 1){
			rowTdObj.attr("rowspan",--rowspan);
		}
 		removeTarget.remove();
 		return false;
 	});
 	$("input[type='submit']").click(function(){
 		$("table#proOption").find(".parent").each(function(i,obj){
 			var span = $(obj).children("td").eq(0).prop("rowspan");
 			console.log(span);
 			var $hidden = $("<input type='hidden' name='span'>");
 			$($hidden).val(span);
 			$("p.submit").append($hidden);
 		});
 		$("form").submit();
 		alert("상품이 등록되었습니다.")
 		return false;
 		//$.post("add.do", $("#form").serialize());
 	});
});
</script>
</head>
<body>
	<form action="add.do" method="post" id="form">      
		<fieldset class="productAdd">
			<legend>상품 등록</legend>
			<p>
				<label>상품 카테고리</label>
				<select name="cate">
					<option>귀걸이</option>
					<option>이어커프</option>
					<option>목걸이</option>
					<option>팔찌</option>
					<option>발찌</option>
					<option>반지</option>
					<option>발가락지/토링</option>
					<option>헤어 CSS</option>
					<option>시계</option>
					<option>폰 ACC</option>
					<option>기타</option>
				</select>
			</p>
			<p>
				<label>상품 이름</label>
				<input type="text" name="name">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>상품 부가설명</label>
				<input type="text" name="sub_desc">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>원가</label>
				<input type="text" name="cost" id="cost">원
			</p>
			<p>
				<label>할인</label>
				<select name="discount">
					<option>0%</option>
					<option>7%</option>
					<option>10%</option>
					<option>20%</option>
					<option>30%</option>
					<option>50%</option>
				</select>
			</p>
			<p>
				<label>판매가</label>
				<input type="text" name="price" id="price">원
			</p>
			<p>
				<label>재고</label>
				<input type="text" name="stock">
			</p>
			<p>
				<label>상품 메인 이미지</label>
				<div class="img_main_plus">
					<input type="file" name="mainimg" value="이미지 불러오기" accept="image/*">
					<!-- <button class="img_main_plus">추가</button> -->
				</div>
			</p>
			<p>
				<label>상품 상세 이미지</label>
				<div class="img_plus">
				<input type="file" name="files" value="이미지 불러오기" accept="image/*">
				<button class="img_plus">추가</button>
				</div>
			</p>

			<p>
				<label>옵션 유무</label>
				<input type="radio" id="option" name="use_option" value="1">사용 
				<input type="radio" id="option" name="use_option" value="0" checked="checked">사용안함
			</p>
			<table id="proOption">
				<tr>
					<td><button id="op_nameadd">+옵션명추가</button></td>
				</tr>
				<tr>
					<th id="opname">옵션명</th>
					<th id="opvalue">옵션값</th>
					<th id="opprice">옵션가</th>
					<th id="empty"></th>
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
					<td>
						<button class="op_add">+추가</button>    
					</td>
				</tr>
			</table>		
			<p class="submit">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>