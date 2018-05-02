<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
	border-spacing: 0px;
}

.bbs-table-list tbody td {
	padding: 10px 0px;
}

.bbs-table-list tbody td {
	border-top: 1px solid rgb(232, 232, 232);
}

td {
	text-align: center;
}

.titleArea {
	padding: 0 0 50px;
	clear: both;
	text-align: center;
	padding: 30px 30px;
}

#content {
	margin: 0;
	overflow: hidden;
	min-height: 900px;
	border-left: 1px solid #ccc;
	overflow: hidden;
}

#sidebar {
	float: left;
	min-width: 200px;
	margin-top: 40px;
}

section {
	width: 80%;
}
</style>
</head>
<body>
	<section>
		<div id="container">

			<div class="titleArea">
				<h1>게시판</h1>
			</div>
			<div>
				<!--#top_box-->
				<div class="top_box">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do?brdcode=NoticeBoard">Notice</a>
							<input type="hidden" name="brdcode" value="NoticeBoard">
						</li>
						<li><span><a>/</a></span></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do?brdcode=QandABoard">Q&amp;A</a>
							<input type="hidden" name="brdcode" value="QandABoard"></li>

						<li><span><a>/</a></span></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do?brdcode=ReviewBoard">Review(후기)</a>
							<input type="hidden" name="brdcode" value="ReviewBoard">
						</li>
					</ul>
				</div>
			</div>
			<div class="bbsData">

				<div class="page-body">


					<div class="bbs-table-list">
						<table>
							<caption>일반게시판 게시글</caption>
							<thead>
								<tr>
									<th><div class="tb-center">번호</div></th>
									<th><div class="tb-center">게시판 이름</div></th>
									<th><div class="tb-center">상품</div></th>
									<th><div class="tb-center">제목</div></th>
									<th><div class="tb-center">작성자</div></th>
									<th><div class="tb-center">작성일</div></th>
									<th><div class="tb-center">조회</div></th>
								</tr>
							</thead>
							<tbody>
								<!-- .공지사항 리스트 시작 -->
								<c:if test="${list.size()>0 }">
									<c:forEach var="item" items="${list }">
										<tr>
											<td>${item.brdNo }</td>
											<td>${item.brdcode }</td>
											<td>${item.prdno }</td>
											<td><a href="ReadBoard.do?brdno=${item.brdNo }">${item.brdtitle }</a></td>
											<td>${item.brdwriter }</td>
												<td><fmt:formatDate value="${item.brdregdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${item.brdch }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>
</html>