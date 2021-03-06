<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>"
	media="all" />
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
<title>Insert title here</title>
<style type="text/css">
section {
	width: 1410px;
	margin: 0 auto;
}

.prd-tinfo {
	zoom: 1;
	overflow: hidden;
	padding: 10px 0 10px 80px;
	border: 1px solid #ddd;
	margin-top: 20px;
	margin-bottom: 20px;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
	background-color: #e3e3e3;
}

.bbs-table-view thead th {
	font-size: 11px;
	color: #222;
	padding: 12px 0;
}

.bbs-table-view tbody td.line {
	border-bottom: 1px solid #e8e8e8;
}

.cont-sub-des div {
	line-height: 20px;
}

.cont-sub-des span {
	margin-right: 15px;
	color: #222;
}

.cont-sub-des span em {
	font-size: 11px;
	color: #222;
	letter-spacing: 0.05em;
}

.tb-center {
	text-align: center;
}

address, em {
	font-style: normal;
}

.bbs-table-view tbody td {
	padding: 12px 0;
}

.tb-left, .tb-center, .tb-right {
	padding: 0 10px;
}

th {
	font-weight: bold;
}

.data-bd-cont .attach {
	text-align: center;
	margin-bottom: 10px;
}

.new-privercy-contract {
	text-align: left;
}

.new-privercy-contract {
	padding: 20px;
}

.new-privercy-contract {
	text-align: left;
}

.new-privercy-contract p {
	font-weight: bold;
	margin: 0;
	margin-bottom: 10px;
	margin-top: 20px;
	text-align: left;
}

.privercy-contract .tbl {
	width: 670px;
	padding: 0;
	margin: 0;
	border-spacing: 0;
	border-collapse: collapse;
	border-top: 1px solid #dadada;
	border-left: 1px solid #dadada;
}

.bbs-table-view td.com-wrt-box {
	border: 0;
	background: #f5f5f5;
}

.bbs-table-view .comment-box td {
	padding-bottom: 20px;
	border-top: 1px solid #e8e8e8;
	vertical-align: top;
}

.bbs-table-view tbody td {
	padding: 12px 0;
}

.com-wrt-box .wrt {
	margin-top: 7px;
}

.wrt {
	padding-left: 10px;
}

.wrt span {
	margin: 0px 10px;
}

.com-wrt-box label {
	padding-left: 7px;
	background:
		url(/design/curiouswiz/onedesign/images/d3/modern_simple/common/bull_join_required.gif)
		no-repeat 0 50%;
	font-size: 11px;
	color: #222;
}

.com-wrt-box .input-style {
	margin: 0 10px 0 7px;
	padding: 2px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #e8e8e8;
}

.input-style2 {
	width: 120px;
	margin: 0px 5px;
}

.wrt textarea {
	width: 93.8%;
	height: 47px;
	margin-right: 5px;
}

textarea {
	width: 600px;
	height: 47px;
	padding: 2px;
	border: 1px solid #dedede;
}

.btn_box_02 {
	width: auto;
	padding: 17px 20px;
}

.btn_light {
	display: inline-block;
	text-align: center;
	background: #e5e5e5;
	color: #555;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #e5e5e5;
}

.view-link {
	text-align: right;
	position: relative;
}

.view-link {
	padding: 20px 0 60px;
}

.view-link .con-link {
	position: absolute;
	left: 0px;
}

dd {
	display: block;
}

.btn_box_01 {
	width: auto;
	padding: 6px 15px;
}

.btn_dark {
	display: inline-block;
	text-align: center;
	background: #222;
	color: #fff;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #222;
}

.btn_light {
	display: inline-block;
	text-align: center;
	background: #e5e5e5;
	color: #555;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #e5e5e5;
}

.btn_light_border {
	display: inline-block;
	text-align: center;
	background: #fff;
	color: #555;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #999;
}

.list-link {
	padding: 6px 14px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.list-link span.arrow {
	padding: 0px 10px 0px 15px;
	font-size: 11px;
	color: #555;
}

a {
	text-decoration: none;
	color: #222;
	letter-spacing: 0.05em;
}

.line {
	text-align: left;
}

.list-link li {
	padding: 4px 0px;
}

.readBoardcontent {
	text-align: left;
}

.titleArea {
	padding: 0 0 50px;
	clear: both;
	text-align: center;
	padding-top: 115px;
}

.con-link {
	display: none;
}
</style>

</head>

<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
	<div id="container">

		<div class="titleArea">
			<h1>Notice</h1>
		</div>
		<div>
			<!--#top_box-->
			<div class="top_box">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/shop/NoticeBoard.do">Notice</a></li>
					<li><span><a>/</a></span></li>
					<li><a
						href="${pageContext.request.contextPath}/shop/BoardQandA.do">Q&amp;A</a></li>
					<li><span><a>/</a></span></li>
					<li><a
						href="${pageContext.request.contextPath}/shop/ReviewBoard.do">Review(후기)</a></li>
				</ul>
			</div>
		</div>
		<section>
			<div class="page-body">
				<div class="bbs-table-view">
					<table summary="게시글 보기">
						<caption>게시글 보기</caption>
						<thead>
							<tr>
								<th><div class="tb-center">
										<em>제목 :</em>${readBoard.brdtitle }</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="line">
									<div class="cont-sub-des">
										<div>

											<span><em>작성일 :</em> <fmt:formatDate
													value="${readBoard.brdregdate}" pattern="yyyy-MM-dd" /></span>
										</div>
										<div>
											<span><em>작성자 :</em>${readBoard.brdwriter }</span> <span><em>파일
													:</em> <a href="#"></a></span>
										</div>
										<div class="hit">
											<span><em>조회 :</em>${readBoard.brdch }</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="data-bd-cont">
										<div class="attach">
											<div class="readBoardcontent">
												<em>${readBoard.brdcontent }</em>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="view-link">
						<dl class="con-link">
							<dt></dt>
							<dd>
								<a href="BoardModifyCheckPassword.do?brdno=${readBoard.brdNo }"
									class="none btn_light_border btn_box_01">수정</a> <a
									href="BoardDel.do?brdno=${readBoard.brdNo }"
									class="btn_light_border btn_box_01">삭제</a> <%-- <a
									href="Boardaskanswer.do?brdno=${readBoard.brdNo }"
									class="btn_light btn_box_01">답변</a> --%>
							</dd>
						</dl>

						<dl class="bbs-link">
							<dt></dt>
							<dd>
								<a href="${pageContext.request.contextPath}/shop/NoticeBoard.do"
									class="btn_light btn_box_01"> 목록</a>
							</dd>
						</dl>
					</div>

				</div>
			</div>
		</section>
	</div>
	<c:import url="../modules/footer.jsp" />
</body>
</html>