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
							<tr>
								<td class="line">
									<div class="cont-sub-des">
										<div>
											<span><em>작성일 :</em> 2018-03-21</span>
										</div>
										<div>
											<span><em>작성자 :</em> <img
												src="/board/images/neo_adminimg.gif" border="0"
												align="absmiddle"></span> <span><em>파일 :</em> <a
												href="http://board.makeshop.co.kr/board/special132/curiouswiz_board2/%B8%F0%B9%D9%C0%CF%C6%CB%BE%F7_2.jpg">모바일팝업_2.jpg</a></span>
										</div>
										<div class="hit">
											<span><em>조회 :</em> 1747</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="data-bd-cont">
										<div class="attach">
											<img width="800"
												src="http://board.makeshop.co.kr/board/special132/curiouswiz_board2/%B8%F0%B9%D9%C0%CF%C6%CB%BE%F7_2.jpg">
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<hr size="1" color="#E5E5E5">
					<div class="view-link">
						<dl class="bbs-link con-link">
							<dt></dt>
							<dd></dd>
						</dl>
						<dl class="bbs-link">
							<dt></dt>
							<dd>
								<a
									href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;board_cate=&amp;s_id=&amp;stext=&amp;ssubject=&amp;shname=&amp;scontent=&amp;sbrand=&amp;sgid=&amp;datekey=&amp;branduid="
									class="none btn_light btn_box_01"> 목록</a>
							</dd>
						</dl>
					</div>
					<div class="bbs-table-list">
						<table summary="게시글 목록">
							<caption>게시글 목록</caption>
							<colgroup>
								<col>
								<col width="120">
								<col width="90">
								<col width="60">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><div class="tb-center">제목</div></th>
									<th scope="col"><div class="tb-center">작성자</div></th>
									<th scope="col"><div class="tb-center">작성일</div></th>
									<th scope="col"><div class="tb-center">조회</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_jpg.gif"> <img
												src="/board/images/neo_head.gif" style="margin-left: 00px">
											<a
												href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999737&amp;num2=00000&amp;s_id=&amp;stext=&amp;ssubject=&amp;shname=&amp;scontent=&amp;sbrand=&amp;sgid=&amp;datekey=&amp;branduid=&amp;number=&amp;lock=N">[03/23]
												워크샵 휴무/배송 공지</a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2018-03-21</div></td>
									<td><div class="tb-center">1747</div></td>
								</tr>
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