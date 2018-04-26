<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Boardcss/Board.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Board.css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.bbs-table-pwd {
	margin-top: 25px;
}

.bbs-table-pwd table {
	width: 260px;
	margin-left: auto;
	margin-right: auto;
}

hr, caption, legend {
	display: none;
}

.bbs-table-pwd tbody th, .bbs-table-pwd tbody td {
	padding: 6px 0;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	color: #222;
	font-size: 11px;
}

.MS_input_txt {
	margin-right: 5px;
	padding: 6px 7px;
	line-height: 17px;
	border: 1px solid #e8e8e8;
}

input, select, textarea {
	font-size: 12px;
	color: #494849;
	font-family: 'Raleway', 'Nanum Gothic', sans-serif;
}

.pwd-link {
	margin-top: 15px;
	text-align: center;
}

.btn_box_01 {
	width: auto;
	padding: 6px 15px;
}

.btn_light {
	display: inline-block;
	text-align: center;
	background: #e5e5e5;
	color: #555;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #e5e5e5;
	font-size: 12px;
}

.btn_light_border {
	display: inline-block;
	text-align: center;
	background: #fff;
	color: #555;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #999;
	font-size: 12px;
}

#submit {
	padding: 8px;
	border: 0;
}

.boardhidden {
	display: none;
}
</style>

</head>
<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
	<section>
		<div id="container">

			<div class="titleArea">
				<h1>REVIEWDEL(삭제)</h1>
			</div>
			<div>
				<!--#top_box-->
				<div class="top_box">
				<ul>
					<li><a href="${pageContext.request.contextPath}/shop/NoticeBoard.do">Notice</a></li>
					<li><span><a>/</a></span></li>
					<li><a href="${pageContext.request.contextPath}/shop/BoardQandA.do">Q&amp;A</a></li>
					<li><span><a>/</a></span></li>
					<li><a href="${pageContext.request.contextPath}/shop/ReviewBoard.do">Review(후기)</a></li>
				</ul>
				</div>
			</div>
			<div id="bbsData">
				<div class="page-body">

					<div class="bbs-table-pwd">
						<form action="BoardDel.do" method="post" autocomplete="off"
							id="delform">
							<input type="hidden" name="brdno" value="${number }">
							<fieldset>
								<legend>비밀번호 찾기</legend>
								<table summary="비밀번호찾기테이블">
									<caption>비밀번호 찾기</caption>
									<colgroup>
										<col width="90">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th><div>비밀번호</div></th>
											<td><div>
													<input id="bp_input_passwd" type="password"
														class="MS_input_txt" name="brdpassword">
												</div></td>
										</tr>
									</tbody>
								</table>
							</fieldset>
							<dl class="bbs-link pwd-link">
								<dt></dt>
								<dd>
									<input type="submit" value="확인" id="submit"> <a
										href="ReviewBoardRead.do?brdno=${number }"
										class="btn_light_border btn_box_01">취소</a> <a
										href="${pageContext.request.contextPath}/shop/ReviewBoard.do"
										class="btn_light_border btn_box_01">목록</a>
								</dd>
							</dl>
						</form>
					</div>
				</div>
				<!-- .page-body -->
			</div>
			<!-- #bbsData -->
		</div>
	</section>

	<script type="text/javascript">
		$(function() {

			$("#submit").click(function() {
				var con_test = confirm("삭제하실건가요?");
				if (con_test == true) {
					
					alert('삭제하겠습니다.');
				} else if (con_test == false) {
					alert('취소하셨습니다.');
					return false;
				}
			})
		})
	</script>
	<c:import url="../modules/footer.jsp" />
	<c:if test="${notsamepassword !=null }">

		<script type="text/javascript">
			alert('비밀번호가 틀렸습니다.')
		</script>
	</c:if>
</body>
</html>