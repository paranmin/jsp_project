<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - SJ JEWELRY</title>
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
	text-align:right;
	width:100px;
}
fieldset.productAdd input#stock{
	text-align:right;
	width:100px;
}
fieldset.productAdd input#cost{
	text-align:right;
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
/* fieldset.productAdd p{
	margin:20px;
} */
fieldset.productAdd div{
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
table#proOption input.op_stock{
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
	width:30%;    
}
table#proOption th#opprice{
	width:15%;    
}
table#proOption th#opstock{
	width:15%;    
}
table#proOption td{
	border-bottom:1px solid gainsboro;      
}
p.error{
	color:red;
	display:none;
}
td#smallfont{
	font-size: small;
}
</style>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function(){
    $("table#proOption").css("display","none");    
    $(".error").css("display", "none");
	$("button.img_main_plus").click(function(){
		var $input = $("<input type='file' multiple='multiple' name='mainimg'>");
		$("div.img_main_plus").append($("<br>"));
		$("div.img_main_plus").append($input);
		return false;
	});
	var i = 1;
	$("button.img_plus").click(function(){
		var $div = $("<div>");
		var $input = $("<input type='file' name='files"+i+"'>");
		var $btn = $("<button class='img_del'>");
		$($btn).text("삭제");   
		/* $("div.img_plus").append($("<br>")); */
		$($div).append($input);
		$($div).append($btn);   
		$("div.img_plus").append($div);
		i++;
		return false;
	});
	
	$(document).on("click","button.img_del", function(){
 		$(this).parent().remove();
 		return false;
 	});
 	
 	$("input[type='radio']").change(function(){
 		if($("input[type='radio']:checked").val()==1){
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
		var td1error = $("<p class='error'>");
		var td2 = $("<td>");
		var td2in = $("<input type='text' name='op_desc' class='op_desc'>");
		var td2error = $("<p class='error'>");
		var td3 = $("<td>");
		var td3in = $("<input type='text' name='op_cost' class='op_cost'>");
		var td3error = $("<p class='error'>");
		var td3error2 = $("<p class='error'>");
		var td4 = $("<td>");
		var td4in = $("<input type='text' name='op_stock' class='op_stock'>");
		var td4error = $("<p class='error'>");
		var td4error2 = $("<p class='error'>");
		var td5 = $("<td>");
		var td5in = $("<button class='op_add'>");
		
		$(td1inbtn).text("삭제");
		$(td1error).text("*옵션명을 입력하세요.");
		$(td2error).text("*옵션내용을 입력하세요.");
		$(td3error).text("*옵션가를 입력하세요.");
		$(td3error2).text("*숫자만 입력하세요.");
		$(td4error).text("*옵션재고를 입력하세요.");
		$(td4error2).text("*숫자만 입력하세요.");
		$(td5in).text("+추가");
		$(td1).append(td1in);
		$(td1).append(td1error);
		$(td1).append(td1inbtn);
		$(td2).append(td2in);
		$(td2).append(td2error);
		$(td3).append(td3in);
		$(td3).append(td3error);
		$(td3).append(td3error2);
		$(td4).append(td4in);
		$(td4).append(td4error);
		$(td4).append(td4error2);
		$(td5).append(td5in);
		$($tr).append(td1);
		$($tr).append(td2);
		$($tr).append(td3);
		$($tr).append(td4);
		$($tr).append(td5);
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
		var td2error = $("<p class='error'>");
		var td3 = $("<td>");
		var td3in = $("<input type='text' name='op_cost' class='op_cost'>");
		var td3error = $("<p class='error'>");
		var td3error2 = $("<p class='error'>");
		var td4 = $("<td>");
		var td4in = $("<input type='text' name='op_stock' class='op_stock'>");
		var td4error = $("<p class='error'>");
		var td4error2 = $("<p class='error'>");
		var td5 = $("<td>");
		var td5in = $("<button type='button' class='op_del'>");
		$(td5in).text("-삭제");
		$(td2error).text("*옵션내용을 입력하세요.");
		$(td3error).text("*옵션가를 입력하세요.");
		$(td3error2).text("*숫자만 입력하세요.");
		$(td4error).text("*옵션재고를 입력하세요.");
		$(td4error2).text("*숫자만 입력하세요.");
		$(td2).append(td2in);
		$(td2).append(td2error);
		$(td3).append(td3in);
		$(td3).append(td3error);
		$(td3).append(td3error2);
		$(td4).append(td4in);
		$(td4).append(td4error);
		$(td4).append(td4error2);
		$(td5).append(td5in);
		$($tr).append(td2);
		$($tr).append(td3);
		$($tr).append(td4);
		$($tr).append(td5);
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
 	
 	var sumStock=0;
 	$("input[type='submit']").click(function(){
 		var numberCheck = /^[-]?[0-9]*$/;
 		$(".error").css("display", "none");
 		
 		$("table#proOption").find(".parent").each(function(i,obj){
 			var span = $(obj).children("td").eq(0).prop("rowspan");
 			var $hidden = $("<input type='hidden' name='span'>");
 			$($hidden).val(span);
 			$("p.submit").append($hidden);
 		});
 		
 		if($("input#name").val()==""){
			$("input#name").next().css("display","block");
			return false;
		}else if($("input#cost").val()==""){
			$("input#cost").next().css("display","block");
			return false;
		}else if(!numberCheck.test($("input#cost").val())){
			$("input#cost").next().next().css("display","block");
			return false;
		}else if($("input#price").val()==""){
			$("input#price").next().css("display","block");
			return false;
		}else if(!numberCheck.test($("input#price").val())){
			$("input#price").next().next().css("display","block");
			return false;
		}else if($("input#stock").val()==""){
			$("input#stock").next().css("display","block");
			return false;
		}else if(!numberCheck.test($("input#stock").val())){
			$("input#stock").next().next().css("display","block");
			return false;
		}else if($("input[name='mainimg']").val()==""){
			$("input[name='mainimg']").next().css("display","block");
			return false;
		}else if($("input[name='files']").val()==""){
			$("input[name='files']").next().next().css("display","block");
			return false;
		}
 		
 		var count = 0;
 		if($("input[type='radio']:checked").val()==1){
 			$("table#proOption").find("td").each(function(i,obj){
 				if($(this).find("input.op_name")!=null){
 					if($(this).find("input.op_name").val()==""){
 		 	 			$(this).find("input.op_name").next().css("display","block");
 		 				count++;
 					}
 				}else if($(this).find("input.op_desc")!=null){
 					if($(this).find("input.op_desc").val()==""){
		 				$(this).find("input.op_desc").next().css("display","block");
		 				count++;
 					}
 				}else if($(this).find("input.op_cost")!=null){
 					if($(this).find("input.op_cost").val()==""){
	 					$(this).find("input.op_cost").next().css("display","block");
		 				count++;
 					}else if(!numberCheck.test($(this).find("input.op_cost").val())){
 		 				$(this).find("input.op_cost").next().next().css("display","block");
 		 				count++;
 		 			}
 				}else if($(this).find("input.op_stock")!=null){
 					if($(this).find("input.op_stock").val()==""){
 		 				$(this).find("input.op_stock").next().css("display","block");
 		 				count++; 
 		 			}else if(!numberCheck.test($(this).find("input.op_stock").val())){    
 		 				$(this).find("input.op_stock").next().next().css("display","block");
 		 				count++; 	
 		 			}
 				}
 			}
 	 	});
 			
			sumStock=0;
 	 		$("input.op_stock").each(function(i,obj){
 	 			var eq4 = Number($(obj).val());
 	 			sumStock += eq4;   
 	 		});
 	 		if(sumStock != $("input#stock").val()){
 	 			alert("재고를 확인해주세요.");
 	 			return false;
 			} 	
 	 		
 	 		if(count > 0){
				return false;
			}else{
				$("form").submit();
	 		 	alert("상품이 등록되었습니다.");
	 		 	return false;
			}
 		}
 		
 		$("form").submit();
	 	alert("상품이 등록되었습니다.");
	 	return false;
 	});
 	
 	$("select#discount").change(function(){
 		var cost = $("input#cost").val();
 		var sel = $(this).children("option:selected").text();
 		var select = sel.split("%");
 		var selingPrice = cost-(cost*select[0]/100);
 		$("input#price").val(selingPrice);
 	});
});
</script>
</head>
<body>
	<form action="add.do" enctype="multipart/form-data" method="post" id="form">
		<fieldset class="productAdd">
			<legend>상품 등록</legend>
			<div>
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
			</div>
			<div>
				<label>상품 이름</label>
				<input type="text" name="name" id="name">
				<p class="error">*상품 이름을 입력하세요.</p>    
			</div>
			<div>
				<label>상품 부가설명</label>
				<input type="text" name="sub_desc">
			</div>
			<div>
				<label>원가</label>
				<input type="text" name="cost" id="cost">원
				<p class="error">*원가 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>할인</label>
				<select name="discount" id="discount">
					<option>0%</option>
					<option>7%</option>
					<option>10%</option>
					<option>20%</option>
					<option>30%</option>
					<option>50%</option>
				</select>
			</div>
			<div>
				<label>판매가</label>
				<input type="text" name="price" id="price">원
				<p class="error">*판매가를 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>재고</label>
				<input type="text" name="stock" id="stock">개
				<p class="error">*재고를 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>상품 메인 이미지</label>
				<div class="img_main_plus">
					<input type="file" name="mainimg" accept="image/*">
					<p class="error">*메인 이미지를 입력하세요.</p>
				</div>
			</div>
			<div>
				<label>상품 상세 이미지</label>
				<div class="img_plus">
				<input type="file" name="files" accept="image/*">
				<button class="img_plus">추가</button>
				<p class="error">*상세 이미지를 입력하세요.</p>
				</div>
			</div>

			<div>
				<label>옵션 유무</label>
				<input type="radio" name="use_option" value="1">사용 
				<input type="radio" name="use_option" value="0" checked="checked">사용안함
			</div>
			<table id="proOption">
				<tr>
					<td colspan="5" id="smallfont"><button id="op_nameadd">+옵션명추가</button>
						*옵션가 : 플러스 옵션일 경우 숫자만 입력, 마이너스 옵션일 경우 숫자 앞에 음수(-)붙여 입력하세요.
					</td>
				</tr>
				<tr>
					<th id="opname">옵션명</th>
					<th id="opvalue">옵션내용</th>
					<th id="opprice">옵션가</th>
					<th id="opstock">재고</th>
					<th id="empty"></th>
				</tr>
				<tr class="parent" id="first">
					<td rowspan="1">
						<input type="text" name="op_name" class="op_name">
						<p class="error">*옵션명을 입력하세요.</p>
					</td>
					<td>
						<input type="text" name="op_desc" class="op_desc">
						<p class="error">*옵션내용을 입력하세요.</p>
					</td>
					<td>
						<input type="text" name="op_cost" class="op_cost">
						<p class="error">*옵션가를 입력하세요.</p>
						<p class="error">*숫자만 입력하세요.</p>
					</td>
					<td>
						<input type="text" name="op_stock" class="op_stock">
						<p class="error">*옵션재고를 입력하세요.</p>
						<p class="error">*숫자만 입력하세요.</p>
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