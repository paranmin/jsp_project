<%@page import="com.dgit.mall.dto.Option"%>
<%@page import="java.util.List"%>
<%@page import="com.dgit.mall.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Product pro = (Product) request.getAttribute("pro");
	List<Option> opt = (List<Option>) request.getAttribute("opt");
	int optSize = opt.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ JEWELRY</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/productDetail.css"
	media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>
<script type="text/javascript">
	$(function() {
		$(".brdReview>a").click(function() {
			$(this).next("td").toggleClass("hide");

		});
		var size =
<%=optSize%>
	;
		var productCost =
<%=pro.getSellingPrice()%>
	for (var i = 0; i < size; i++) {
			checkSelect(i);
		}

		function checkSelect(i) {
			$("select#select" + i)
					.change(
							function() {
								if ($(this).children("option:selected").val() != "==선택하세요==") {
									var target = $(this).parents("tr").next()
											.find("select");
									if (target != null) {
										target.removeAttr("disabled");
										target.val("==선택하세요==");
									}
									target = target.parents("tr").next().find(
											"select");
									if (target != null) {
										target.attr("disabled", "disabled");
										target.val("==선택하세요==");
									}
								} else if ($(this).children("option:selected")
										.val() == "==선택하세요==") {
									var target = $(this).parents("tr").next()
											.find("select");
									if (target != null) {
										target.val("==선택하세요==");
										target.attr("disabled", "disabled");
									}
									target = target.parents("tr").next().find(
											"select");
									if (target != null) {
										target.val("==선택하세요==");
										target.attr("disabled", "disabled");
									}
								}
							});
		}

		$("select#select" + (size - 1)).change(function() {
			if ($(this).children("option:selected").val() != "==선택하세요==") {
				createValue();
				/* appendLi(); */
				calPrice();
				for (var i = 0; i < size; i++) {
					$("select#select" + i).val("==선택하세요==");
					$("select#select" + (i + 1)).attr("disabled", "disabled");
				}
			}
		});

		var value = new Array();
		var value2 = new Array();
		var str = "";
		var ocost = 0;
		var flag = 0;

		function createValue() {
			var duplicate = 0;

			$("option:selected").each(function(j, obj) {
				value[j] = $(obj).val();
				value2[j] = $(obj).attr("data-cost");
			});
			str = "";
			ocost = 0;
			if (value.indexOf("==선택하세요==") == -1) {
				for (var i = 0; i < value.length; i++) {
					if (i == value.length - 1) {
						str += value[i];
					} else {
						str += value[i] + "/";
					}
					ocost += Number(value2[i]);
				}
				if (ocost == 0) {
					ocost = "";
				} else if (ocost > 0) {
					ocost = " (+" + ocost + "원)";
				} else if (ocost < 0) {
					ocost = " (" + ocost + "원)";
				}
			}

			if (flag == 0) {
				appendLi();
				flag++;
			} else {
				$("div#selectedItem li").each(function(i, obj) {
					var $target = $(this).text().split("(");
					var target = $target[0].trim();
					console.log("str : " + str);
					if (target == str) {
						duplicate++;
					}
				});
				console.log(duplicate);
				if (duplicate > 0) {
					alert("이미 추가된 상품입니다.");
				} else {
					appendLi();
				}
			}
		}

		var Sumcost = 0;
		function appendLi() {
			var li = $("<li>");
			var $text = str + ocost;
			var plusBtn = $("<button class='plusNum'>");
			$(plusBtn).text("+");
			var $input = $("<input type='text' class='productNum' name='cartnum'>");
			$($input).val("1");
			var minusBtn = $("<button class='minusNum'>");
			$(minusBtn).text("-");
			var span = $("<span>");

			var cost = new Array();
			/* var podNo = new Array(); */
			Sumcost = 0;
			$('option:selected').each(function(i, obj) {
				cost[i] = Number($(obj).attr("data-cost"));
				/* podNo[i]= Number($(obj).attr("data-podno")); */
				Sumcost += cost[i];
			});

			var price = productCost + Sumcost + "원";

			var closeBtn = $("<button class='closeli'>");
			$(closeBtn).text("×");
			$(li).text($text);
			$(span).text(price);
			$(li).append(plusBtn);
			$(li).append($input);
			$(li).append(minusBtn);
			$(li).append(span);
			$(li).append(closeBtn);
			var hidden = $("<input type='hidden' name='opPrice'>");
			var hidden2 = $("<input type='hidden' name='optionName'>");
			$(hidden).val(productCost + Sumcost);
			var $text = $(li).text();
			var text = $text.split(")");
			$(hidden2).val(text[0] + ")");
			$(li).append(hidden);
			$(li).append(hidden2);

			/* var hidden3 = $("<input type='hidden' name='podNo'>");
			$(hidden3).val(podNo);
			$(li).append(hidden3);   */
			$("div#selectedItem").children("ul").append(li);
		}

		$(document).on("click", "button.plusNum", function() {
			var $num = $(this).next().val();
			var num = Number($num);
			$(this).next().val(num + 1);
			var stock = Number($(this).next().val()); //갯수
			var target = $(this).next().next().next().next().next().val();

			$(this).next().next().next().text((stock * target) + "원");

			calPrice();
			return false;
		})

		$(document).on("click", "button.minusNum", function() {
			var $num = $(this).prev().val();
			var num = Number($num);
			if (num > 1) {
				$(this).prev().val(num - 1);
			}
			var stock = Number($(this).prev().val()); //갯수
			var target = $(this).next().next().next().val();

			$(this).next().text((stock * target) + "원");

			calPrice();
			return false;
		})

		$(document).on("click", "button.closeli", function() {
			$(this).parent().remove();
			calPrice();
			var next = $("div#selectedItem li");
			if (next.length == 0) {
				$("div#resultPrice").css("display", "none");
			}
			return false;
		})

		var sum = 0;
		function calPrice() {
			$("div#resultPrice").css("display", "block");
			sum = 0;
			var price = new Array();
			$("div#selectedItem li").each(function(i, obj) {
				var target = $(this).find("span").text();
				price = target.split("원");
				sum += Number(price[0]);
			});
			$("div#resultPrice").find("span").text(sum);
		}

		$(window).scroll(function() {
			var left = $("div.detail_left").outerHeight();
			var right = $("div.detail_right").outerHeight()
			if ($(this).scrollTop() >= (left - right)) {
				$("div.detail_right").css("display", "none");
			} else {
				$("div.detail_right").css("display", "block");
			}
		});

		$("input[type='submit']").click(function() {
			if ($("#selectedItem").find("li").length == 0) {
				alert("옵션을 선택해주세요");
				return false;
			}
			$("form").submit();
			return false;
		});
	});
</script>
<style type="text/css">
.brdReview a {
	cursor: pointer;
}

.brdhide {
	display: none;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="../modules/header.jsp" />
		<c:import url="../modules/leftSide.jsp" />
		<c:import url="../modules/rightSide.jsp" />
		<form action="detailProductShow.do" method="post">
			<input type="hidden" name="chkAll" value="${pro.prdNo }">
			<section id="detail_product">
				<div class="detail_left">
					<h2 class="catename">JEWELRY... ${pro.category }</h2>
					<div class="detail_menu" id="detail_menu_detail">
						<ul>
							<li><a href="#detail" id="detail">Detail</a></li>
							<li><a href="#review">Review</a></li>
							<li><a href="#qa">Q&amp;A</a></li>
						</ul>
					</div>
					<c:forEach var="imglist" items="${img }">
						<img
							src="${pageContext.request.contextPath}/upload/${imglist.img }">
					</c:forEach>
				</div>
				<div class="detail_right">
					<h3>${pro.name }</h3>
					<hr>
					<table>
						<tr>
							<td colspan="2">${pro.subDesc }</td>
						</tr>
						<tr>
							<td>판매가격</td>
							<c:if test="${pro.cost == pro.sellingPrice }">
								<td><b><fmt:formatNumber value="${pro.sellingPrice }"
											pattern="￦#,###" /></b></td>
							</c:if>
							<c:if test="${pro.cost != pro.sellingPrice }">
								<td><span id="line"><fmt:formatNumber
											value="${pro.cost }" pattern="￦#,###" /></span> <b><fmt:formatNumber
											value="${pro.sellingPrice }" pattern="￦#,###" /></b>
									(${pro.discountPer } 할인)</td>
							</c:if>
						</tr>
						<c:set value="0" var="fir" />
						<c:forEach var="option" items="${opt }" varStatus="status">
							<c:set value="${fir+rownum[status.index]-1 }" var="end" />
							<tr>
								<td>${option.poName }</td>
								<td><select id="select${status.index }"
									<c:if test="${!status.first }"> disabled="disabled" </c:if>>
										<option>==선택하세요==</option>
										<c:forEach var="result" items="${res }" begin="${fir}"
											end="${end}">
											<option value="${result.podValue}"
												data-cost="${result.podCost}" data-podno="${result.podNo}">${result.podValue}
												<c:if test="${result.podCost !=0}">
										 / <fmt:formatNumber value="${result.podCost}"
														pattern="#,###원" />
												</c:if>
											</option>
										</c:forEach>
								</select></td>
							</tr>
							<c:set value="${end+1 }" var="fir" />
						</c:forEach>
					</table>
					<hr>
					<c:if test="${pro.useOption == 0 }">
						<div id="selectedItem">
							<ul>
								<li>${pro.name }
									<button class="plusNum">+</button> <input type="text"
									class="productNum" name="cartnum" value="1">
									<button class="minusNum">-</button> <span>${pro.sellingPrice }원</span>
									<input type="hidden" name="optionName"> <input
									type="hidden" name="opPrice" value="${pro.sellingPrice }">
								</li>
							</ul>
						</div>
						<hr>
						<div id="resultPrice" style="display: block">
							<p>
								총 상품 금액 <span>${pro.sellingPrice }</span>원
							</p>
						</div>
					</c:if>
					<c:if test="${pro.useOption == 1 }">
						<div id="selectedItem">
							<ul></ul>
						</div>
						<hr>
						<div id="resultPrice">
							<p>
								총 상품 금액 <span></span>원
							</p>
						</div>
					</c:if>
					<input type="submit" value="Add Cart"><br>
				</div>
				<div class="datail_board">
					<div class="detail_menu" id="detail_menu_review">

						<ul>
							<li><a href="#detail">Detail</a></li>
							<li><a href="#review" id="review">Review</a></li>
							<li><a href="#qa">Q&amp;A</a></li>
						</ul>
					</div>
					<div class="detail_menu">
						<table class="review">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>이름</th>
									<th>날짜</th>
									<th>조회</th>
								</tr>
							<tbody>
								<!-- .공지사항 리스트 시작 -->
								<c:if test="${Blist.size()>0 }">
									<c:forEach var="item" items="${Blist }">
										<tr>
											<td>${item.brdNo }</td>
											<td class="brdReview"><a href="#">${item.brdtitle }</a></td>
											<td>${item.brdwriter }</td>
											<td>${item.brdregdate }</td>
											<td>${item.brdch }</td>
										</tr>
										<tr class="brdhide">
											<td>${itme.brdcontent}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="button">
							<button id="reviewBtn"><a href="${pageContext.request.contextPath}/shop/ReviewForm.do">후기작성</a></button>
							<button id="reviewListBtn"><a href="${pageContext.request.contextPath}/shop/ReviewBoard.do">목록으로</a></button>
						</div>
						<div>페이징</div>
					</div>
					<div class="detail_menu" id="detail_menu_qa">
						<ul>
							<li><a href="#detail">Detail</a></li>
							<li><a href="#review">Review</a></li>
							<li><a href="#qa" id="qa">Q&amp;A</a></li>
						</ul>
					</div>
					<div class="detail_menu">
						<table class="qa">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>이름</th>
									<th>날짜</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
								<!-- .Q&A공지사항 리스트 시작 -->
								<c:if test="${list.size()>0 }">
									<c:forEach var="item" items="${list }">
										<tr>
											<td>${item.brdNo }</td>
											<td class="brdReview"><a href="#">${item.brdtitle }</a></td>
											<td>${item.brdwriter }</td>
											<td>${item.brdregdate }</td>
											<td>${item.brdch }</td>
										</tr>
										<tr class="brdhide">
											<td>${itme.brdcontent}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="button">
							<button id="qaBtn">문의하기</button>
							<button id="qaListBtn">목록으로</button>
						</div>
						<div>페이징</div>
					</div>
				</div>
			</section>
		</form>
		<c:import url="../modules/footer.jsp" />
	</div>
</body>
</html>