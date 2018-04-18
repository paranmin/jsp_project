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
section {
	width: 1410px;
	margin: 0 auto;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.bbs-table-view tbody td {
	padding: 12px 0;
}

.bbs-table-view thead th {
	font-size: 11px;
	color: #222;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	background: #f5f5f5;
	padding: 12px 0;
}

.tb-center {
	text-align: center;
}

.tb-left, .tb-center, .tb-right {
	padding: 0 10px;
}

.bbs-table-view tbody td.line {
	border-bottom: 1px solid #e8e8e8;
}

.bbs-table-view tbody td {
	padding: 12px 0;
}

tbody td.line {
	clear: both;
	float: left;
	border-bottom: 1px solid #e8e8e8;
	float: left;
}

.bbs-table-view .data-bd-cont {
	padding: 20px 0 40px 0;
}

.cont-sub-des {
	text-align: left;
}

.view-link {
	text-align: right;
	padding: 20px 0 60px;
}
</style>
</head>
<body>
	<c:import url="modules/header.jsp" />
	<section>
		<div id="bbsData">
			<div class="page-body">
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

				<div class="bbs-table-view">
					<table summary="게시글 보기">
						<caption>게시글 보기</caption>
						<thead>
							<tr>
								<th><div class="tb-center">[03/23] 워크샵 휴무/배송 공지</div></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- .page-body -->
		</div>
	</section>
	<c:import url="modules/footer.jsp" />
</body>
</html>