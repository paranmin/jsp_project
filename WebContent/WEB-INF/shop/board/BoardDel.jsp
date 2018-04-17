<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="Boardcss/Board.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="css/base.css" media="all" />
<link rel="stylesheet" href="css/Board.css" media="all" />
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
</style>
</head>
<body>
	<c:import url="modules/header.jsp" />
	<section>
		<div id="container">

			<div class="titleArea">
				<h1>REVIEW</h1>
			</div>
			<div>
				<!--#top_box-->
				<div class="top_box">
					<ul>
						<li><a href="#">Notice</a></li>
						<li><span><a>/</a></span></li>
						<li><a href="#">Q&amp;A</a></li>
						<li><span><a>/</a></span></li>
						<li><a href="#">Review(후기)</a></li>
					</ul>
				</div>
			</div>
				<div id="bbsData">
					<div class="page-body">

						<div class="bbs-table-pwd">
							<form action="Del.do" method="post"
								autocomplete="off">
								<input type="hidden" name="BRO_CHK_KEY"
									value="8bbc6ef77da9e371044f00cc1a8a06310a761d7ab63b5b0a42db20dc7a2ca3c9">
								<input type="hidden" name="code" value="curiouswiz_board3">
								<input type="hidden" name="num1" value="941772"> <input
									type="hidden" name="num2" value="00000"> <input
									type="hidden" name="page" value="1"> <input
									type="hidden" name="type" value="u">
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
															class="MS_input_txt" name="passwd">
													</div></td>
											</tr>
										</tbody>
									</table>
								</fieldset>
								<dl class="bbs-link pwd-link">
									<dt></dt>
									<dd>
										<a href="javascript:document.form1.submit();"
											class="none btn_light btn_box_01">확인</a> <a
											href="javascript:history.go(-1);"
											class="btn_light_border btn_box_01">취소</a> <a
											href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;board_cate="
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
	<c:import url="modules/footer.jsp" />
</body>
</html>