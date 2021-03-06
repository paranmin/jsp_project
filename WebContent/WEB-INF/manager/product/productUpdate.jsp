<%@page import="com.dgit.mall.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset.productDetail {
	width: 60%;
	margin: 50px auto;
	padding: 10px;
}

fieldset.productDetail label {
	width: 150px;
	float: left;
}

fieldset.productDetail input[type='text'] {
	width: 400px;
}

fieldset.productDetail input#price {
	text-align: right;
	width: 70px;
}

fieldset.productDetail input#cost {
	text-align: right;
	width: 70px;
}

fieldset.productDetail input#discount {
	text-align: right;
	width: 70px;
}

fieldset.productDetail input#stock {
	text-align: right;
	width: 70px;
}

p.submit {
	text-align: center;
}

p.submit input {
	margin-top: 10px;
	width: 70px;
	height: 30px;
	border: none;
}

p.submit input[type='submit'] {
	background: wheat;
}

fieldset.productDetail div {
	margin: 20px;
}

fieldset.productDetail button {
	width: 50px;
	border: none;
}

div.img_main_plus {
	margin-left: 170px;
}

div.img_plus {
	margin-left: 170px;
}

table#proOption th {
	height: 40px;
	background: gainsboro;
}

table#proOption td {
	padding: 10px;
}

table#proOption input {
	text-align: center;
}

table#proOption input.op_name {
	width: 200px;
}

table#proOption input.op_cost {
	width: 150px;
}

table#proOption input.op_stock {
	width: 150px;
}

table#proOption tr:first-child td {
	text-align: left;
	border: none;
}

table#proOption button#op_nameadd {
	width: 100px;
	height: 25px;
}

table#proOption {
	width: 100%;
	text-align: center;
	display: none;
}

table#proOption th#opname {
	width: 20%;
}

table#proOption th#opvalue {
	width: 40%;
}

table#proOption th#opprice {
	width: 20%;
}

table#proOption td {
	border-bottom: 1px solid gainsboro;
}

div.img img {
	width: 300px;
	height: 300px;
}

.img_main_plus div.img {
	position: relative;
	width: 300px;
	height: 300px;
}

.img_plus div.img {
	position: relative;
	width: 300px;
	height: 300px;
}

fieldset.productDetail button.imgdeletemain {
	border: 1px solid red;
	background: red;
	color: white;
	position: absolute;
	top: 10px;
	right: 0;
	width: 100px;
}

fieldset.productDetail button.imgdelete {
	border: 1px solid red;
	background: red;
	color: white;
	position: absolute;
	top: 10px;
	right: 0;
	width: 100px;
}

p.error {
	color: red;
	display: none;
}

td#smallfont {
	font-size: small;
}

div input[type="file"]{
	margin-left:-20px;
}
button.img_plus{
	margin-left:-6px;
}
div input[name="files"]{
	margin-left:0px;
}
</style>
<%
	Product pro = (Product) request.getAttribute("pro");
%>
<script>
	$(function() {
		$("table#proOption").css("display", "none");
		$("button.img_main_plus").click(function() {
			var $input = $("<input type='file' name='mainimg'>");
			$("div.img_main_plus").append($("<br>"));
			$("div.img_main_plus").append($input);
			return false;
		});
		var i = 1;
		$("button.img_plus").click(function() {
			var $div = $("<div>");
			var $input = $("<input type='file' name='files" + i + "'>");
			var $btn = $("<button class='img_del'>");
			$($btn).text("삭제");
			/* $("div.img_plus").append($("<br>")); */
			$($div).append($input);
			$($div).append($btn);
			$("div.img_plus").append($div);
			i++;
			return false;
		});

		$("input#option").change(function() {
			if ($("input#option:checked").val() == 1) {
				$("table#proOption").css("display", "block");
			} else {
				$("table#proOption").css("display", "none");
			}
		});

		$("button#op_nameadd").click(function() {
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
		$(document).on("click", "button.op_nameDel", function() {
			var rowspan = $(this).parent().prop("rowspan");
			for (var i = 1; i < rowspan; i++) {
				var removeT = $(this).parents("tr").next();
				removeT.remove();
			}
			var removeTarget = $(this).parents("tr");
			removeTarget.remove();
			return false;
		});
		$(document).on("click", "button.op_add", function() {
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
			$(this).parent().siblings().eq(0).prop("rowspan", ++rowspan);
			return false;
		});

		$(document).on("click", "button.op_del", function() {
			var removeTarget = $(this).parents("tr");
			var rowTdObj = removeTarget.prevAll(".parent").eq(0).find("td").eq(0);

			var rowspan = rowTdObj.attr("rowspan");
			if (rowspan > 1) {
				rowTdObj.attr("rowspan", --rowspan);
			}
			removeTarget.remove();
			return false;
		});
		var sumStock = 0;
		$("input[type='submit']").click(function() {
			var numberCheck = /^[-]?[0-9]*$/;
			$(".error").css("display", "none");

			$("table#proOption").find(".parent").each(function(i, obj) {
				var span = $(obj).children("td").eq(0).prop("rowspan");
				console.log(span);
				var $hidden = $("<input type='hidden' name='span'>");
				$($hidden).val(span);
				$("p.submit").append($hidden);
			});

			/* $("input#name").val($("input#name").val()); */

			if ($("input[name='name']").val() == "") {
				$("input[name='name']").next().css("display", "block");
				return false;
			} else if ($("input[name='cost']").val() == "") {
				$("input[name='cost']").next().css("display", "block");
				return false;
			} else if (!numberCheck.test($("input[name='cost']").val())) {
				$("input[name='cost']").next().next().css("display", "block");
				return false;
			} else if ($("input[name='price']").val() == "") {
				$("input[name='price']").next().css("display", "block");
				return false;
			} else if (!numberCheck.test($("input[name='price']").val())) {
				$("input[name='price']").next().next().css("display", "block");
				return false;
			} else if ($("input[name='stock']").val() == "") {
				$("input[name='stock']").next().css("display", "block");
				return false;
			} else if (!numberCheck.test($("input[name='stock']").val())) {
				$("input[name='stock']").next().next().css("display", "block");
				return false;
			} else if (($(".img_main_plus").find("img").length == 0) && ($("input[name='mainimg']").val() == "")) {
				$("input[name='mainimg']").next().css("display", "block");
				return false;
			} else if (($(".img_plus").find("img").length == 0) && ($("input[name='files']").val() == "")) {
				$("input[name='files']").next().next().css("display", "block");
				return false;
			}

			var count = 0;
			if ($("input[name='use_option']:checked").val() == 1) {
				$("table#proOption").find("td").each(function(i, obj) {
					var $op_name = $(this).find("input.op_name"),
						$op_desc = $(this).find("input.op_desc"),
						$op_cost = $(this).find("input.op_cost");

					if ($op_name.length == 1) {
						if ($op_name.val().trim() == "") {
							$op_name.next().css("display", "block");
							count++;
						}
					}
					if ($op_desc.length == 1) {
						if ($op_desc.val().trim() == "") {
							$op_desc.next().css("display", "block");
							count++;
						}
					}
					if ($op_cost.length == 1) {
						if ($op_cost.val().trim() == "") {
							$op_cost.next().css("display", "block");
							count++;
						} else if (!numberCheck.test($op_cost.val())) {
							$op_cost.next().next().css("display", "block");
							count++;
						}
					}

				});
			}
			if (count > 0) {
				return false;
			}
			$("form").submit();
			alert("상품이 등록되었습니다.");
			return false;
		});

		$("input[type='reset']").click(function() {
			location.href = "list.do";
			return false;
		});

		$("button.imgdeletemain").click(function() {
			var $src = $(this).prev().attr("src");
			var src = $src.split("/");
			console.log(src);
			console.log(src.length);
			console.log(src[src.length - 1]);
			$("input#deleteMainImage").val(src[src.length - 1]);
			$(this).parent().remove();
			return false;
		});

		$(document).on("click", "button.img_del", function() {
			$(this).parent().remove();
			return false;
		});

		var i = 0;
		$("button.imgdelete").click(function() {
			i++;
			var $src = $(this).prev().attr("src");
			var src = $src.split("/");
			var val = $("input#deleteDetailImage").val();
			if (i == 1) {
				$("input#deleteDetailImage").val(src[src.length - 1]);
			} else {
				$("input#deleteDetailImage").val(val + "," + src[src.length - 1]);
			}

			console.log(i);
			console.log("val : " + $("input#deleteDetailImage").val());
			$(this).parent().remove();
			return false;
		});
		$("select#discount").change(function() {
			var cost = $("input#cost").val();
			var sel = $(this).children("option:selected").text();
			var select = sel.split("%");
			var selingPrice = cost - (cost * select[0] / 100);
			$("input#price").val(selingPrice);
		});
	});
	window.onload = function() {
		if ($("input#option:checked").val() == 1) {
			$("table#proOption").css("display", "block");
		} else {
			$("table#proOption").css("display", "none");
		}
	};
</script>
</head>
<body>
	<form action="update.do" enctype="multipart/form-data" method="post">
		<fieldset class="productDetail">
			<legend>상품 정보</legend>
			<div>
				<label>게시 여부</label> <input type="radio" id="view" name="view"
					value="1" <c:if test="${pro.use=='1' }"> checked="checked" </c:if>>게시
				<input type="radio" id="view" name="view" value="0"
					<c:if test="${pro.use=='0' }"> checked="checked" </c:if>>게시
				안함
			</div>
			<div>
				<label>상품 카테고리</label> <select name="cate">
					<option value="All"
						<c:if test="${pro.category=='All' }"> selected="selected" </c:if>>All</option>
					<option value="귀걸이"
						<c:if test="${pro.category=='귀걸이' }"> selected="selected" </c:if>>귀걸이</option>
					<option value="이어커프"
						<c:if test="${pro.category=='이어커프' }"> selected="selected" </c:if>>이어커프</option>
					<option value="목걸이"
						<c:if test="${pro.category=='목걸이' }"> selected="selected" </c:if>>목걸이</option>
					<option value="팔찌"
						<c:if test="${pro.category=='팔찌' }"> selected="selected" </c:if>>팔찌</option>
					<option value="발찌"
						<c:if test="${pro.category=='발찌' }"> selected="selected" </c:if>>발찌</option>
					<option value="반지"
						<c:if test="${pro.category=='반지' }"> selected="selected" </c:if>>반지</option>
					<option value="발가락지/토링"
						<c:if test="${pro.category=='발가락지/토링' }"> selected="selected" </c:if>>발가락지/토링</option>
					<option value="헤어 ACC"
						<c:if test="${pro.category=='헤어 ACC' }"> selected="selected" </c:if>>헤어
						ACC</option>
					<option value="시계"
						<c:if test="${pro.category=='시계' }"> selected="selected" </c:if>>시계</option>
					<option value="폰 ACC"
						<c:if test="${pro.category=='폰 ACC' }"> selected="selected" </c:if>>폰
						ACC</option>
					<option value="기타"
						<c:if test="${pro.category=='기타' }"> selected="selected" </c:if>>기타</option>
				</select>
			</div>
			<div>
				<label>상품 이름</label> <input type="text" name="name"
					value="${pro.name }">
				<p class="error">*상품 이름을 입력하세요.</p>
			</div>
			<div>
				<label>상품 부가설명</label> <input type="text" name="desc"
					value="${pro.subDesc }">
			</div>
			<div>
				<label>원가</label> <input type="text" name="cost"
					value="${pro.cost }" id="cost">원
				<p class="error">*원가 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>할인</label> <select name="discount" id="discount">
					<option
						<c:if test="${pro.discountPer=='0%' }"> selected="selected" </c:if>>0%</option>
					<option
						<c:if test="${pro.discountPer=='7%' }"> selected="selected" </c:if>>7%</option>
					<option
						<c:if test="${pro.discountPer=='10%' }"> selected="selected" </c:if>>10%</option>
					<option
						<c:if test="${pro.discountPer=='20%' }"> selected="selected" </c:if>>20%</option>
					<option
						<c:if test="${pro.discountPer=='30%' }"> selected="selected" </c:if>>30%</option>
					<option
						<c:if test="${pro.discountPer=='50%' }"> selected="selected" </c:if>>50%</option>
				</select>
			</div>
			<div>
				<label>판매가</label> <input type="text" value="${pro.sellingPrice }"
					id="price" name="price">원
				<p class="error">*판매가를 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>재고</label> <input type="text" value="${pro.stock }"
					id="stock" name="stock">개
				<p class="error">*재고를 입력하세요.</p>
				<p class="error">*숫자만 입력하세요.</p>
			</div>
			<div>
				<label>상품 메인 이미지</label>
				<div class="img_main_plus">
					<div class="img">
						<img
							src="${pageContext.request.contextPath}/upload/${pro.mainImg }">
						<button class="imgdeletemain">이미지 삭제</button>
					</div>
					<br> <input type="file" name="mainimg" accept="image/*">
					<p class="error">*메인 이미지를 입력하세요.</p>
				</div>
			</div>
			<div>
				<label>상품 상세 이미지</label>
				<div class="img_plus">
					<c:forEach var="pimg" items="${proimg }">
						<div class="img">
							<img src="${pageContext.request.contextPath}/upload/${pimg.img }">
							<button class="imgdelete">이미지 삭제</button>
						</div>
					</c:forEach>
					<br> <input type="file" name="files" accept="image/*">
					<button class="img_plus">추가</button>
					<p class="error">*상세 이미지를 입력하세요.</p>
				</div>
			</div>
			<div>
				<label>옵션 유무</label>
				<input type="radio" id="option"
					name="use_option" value="1"
					<c:if test="${pro.useOption=='1' }"> checked="checked" </c:if>>사용
				<input type="radio" id="option" name="use_option" value="0"
					<c:if test="${pro.useOption=='0' }"> checked="checked" </c:if>>사용안함
			</div>
			<table id="proOption">
				<tr>
					<td colspan="4" id="smallfont"><button id="op_nameadd">+옵션명추가</button>
						*옵션가 : 플러스 옵션일 경우 숫자만 입력, 마이너스 옵션일 경우 숫자 앞에 음수(-)붙여 입력하세요.</td>
				</tr>
				<tr>
					<th id="opname">옵션명</th>
					<th id="opvalue">옵션내용</th>
					<th id="opprice">옵션가</th>
					<th id="empty"></th>
				</tr>
				<c:if test="${opt eq null || opt.size() == 0}">
					<tr class="parent" id="first">
						<td rowspan="1"><input type="text" name="op_name"
							class="op_name">
							<p class="error">*옵션명을 입력하세요.</p></td>
						<td><input type="text" name="op_desc" class="op_desc">
							<p class="error">*옵션내용을 입력하세요.</p></td>
						<td><input type="text" name="op_cost" class="op_cost">
							<p class="error">*옵션가를 입력하세요.</p>
							<p class="error">*숫자만 입력하세요.</p></td>
						<td>
							<button class="op_add">+추가</button>
						</td>
					</tr>
				</c:if>
				<c:set value="0" var="fir" />
				<c:forEach var="option" items="${opt }" varStatus="status">
					<c:set value="${fir+rownum[status.index]-1 }" var="end" />
					<tr class="parent">
						<td rowspan="${rownum[status.index] }"><input type="text"
							name="op_name" class="op_name" value="${option.poName }">
							<p class="error">*옵션명을 입력하세요.</p> <c:if test="${!status.first }">
								<button class='op_nameDel'>삭제</button>
							</c:if></td>
						<c:forEach var="result" items="${res }" begin="${fir}" end="${end}" varStatus="sta">
							<td><input type="text" name="op_desc" class="op_desc"
								value="${result.podValue}">
								<p class="error">*옵션내용을 입력하세요.</p></td>
							<td><input type="text" name="op_cost" class="op_cost"
								value="${result.podCost}">
								<p class="error">*옵션가를 입력하세요.</p>
								<p class="error">*숫자만 입력하세요.</p></td>
							<%-- <td><input type="text" name="op_stock" class="op_stock" value="${result.podStock}"></td> --%>
							<c:if test="${sta.first }">
								<td>
									<button class="op_add">+추가</button>
								</td>
							</c:if>
							<c:if test="${!sta.first }">
								<td>
									<button class="op_del">-삭제</button>
								</td>
							</c:if>
					</tr>
					<c:if test="${sta.index != end }">
						<tr>
					</c:if>
				</c:forEach>
				<c:set value="${end+1 }" var="fir" />
				</c:forEach>
			</table>
			<p class="submit">
				<input type="submit" value="수정"> <input type="reset"
					value="취소"> <input type="hidden" id="no" name="no"
					value="${pro.prdNo }"> <input type="hidden"
					id="deleteDetailImage" name="deleteDetailImage">
			</p>
		</fieldset>
	</form>
</body>
</html>