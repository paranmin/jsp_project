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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css?v=<%= new Date().getTime() %>"
	media="all" />
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
</style>
</head>
<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
	<section>
		<div id="container">

			<div class="titleArea">
				<h1>Q&amp;A</h1>
			</div>
			<div>
				<!--#top_box-->
				<div class="top_box">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do">Notice</a></li>
						<li><span><a>/</a></span></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do">Q&amp;A</a></li>
						<li><span><a>/</a></span></li>
						<li><a
							href="${pageContext.request.contextPath}/manager/board/adminBoard.do">Review(후기)</a></li>
					</ul>
				</div>
			</div>
			<div class="bbsData">

				<div class="page-body">


					<div class="bbs-table-list">
						<table summary="No, content,Name,Data,Hits">
							<caption>일반게시판 게시글</caption>
							<thead>
								<tr>
									<th><div class="tb-center">번호</div></th>
									<th><div class="tb-center">&nbsp;</div></th>
									<th class="hidden"><div>
											<input type="hidden" name="brdcode" value="QandABoard">
										</div></th>
									<!-- .상품정보가 있을 경우에만 나타남 -->
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
											<td></td>
											<td>${item.prdno }</td>
											<td><a href="QandABoardRead.do?brdno=${item.brdNo }">${item.brdtitle }</a></td>
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

					<input type="hidden" name="prdno" value="${pro.prdNo} ">
					<!-- .bbs-sch -->
					<dl class="bbs-link bbs-link-btm">
						<dd>
							<a class="write  btn_dark btn_box_01"
								href="${pageContext.request.contextPath}/shop/BoardQandAForm.do">글쓰기</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</section>
	<c:import url="../modules/footer.jsp" />
</body>
</html>