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
</style>
</head>
<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
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
			<div class="bbsData">

				<div class="page-body">


					<div class="bbs-table-list">
						<table summary="No, content,Name,Data,Hits">
							<caption>일반게시판 게시글</caption>
							<thead>
								<tr>
									<th><div class="tb-center">번호</div></th>
									<th><div class="tb-center">&nbsp;</div></th>
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
											<td><a href="ReviewBoardRead.do?abNo=${item.brdNo }">${item.brdNo }</a></td>
											<td>${item.brdtitle }</td>
											<td display="hidden">${item.brdtitle }</td>BoardReview
											<td>${item.brdwriter }</td>
											<td>${item.brdregdate }</td>
											<td>${item.brdch }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>


					<!-- .bbs-sch -->
					<div class="bbs-sch">
						<form action="board.do" method="post"">
							<!-- .검색 폼시작 -->
							<fieldset>
								<legend>게시판 검색 폼</legend>
								<label> <input type="radio" name="check" value="ok"
									onclick="change(1);" class="MS_input_checkbox"> 이름
								</label> <label> <input type="radio" name="check" value="ok"
									onclick="change(2);" checked="checked"
									class="MS_input_checkbox">제목
								</label> <label> <input type="radio" name="check" value="ok"
									onclick="change(3);" class="MS_input_checkbox"> 내용
								</label>
								<!-- .상품정보가 있을 경우에만 나타남 -->
								<label> <input type="radio" name="check" value="ok"
									onclick="change(4);" class="MS_input_checkbox"> 상품
								</label> <span class="key-wrap"> <input type="text" name="stext"
									value="" class="MS_input_txt"> <a href="#"
									class=" btn_light btn_box_01">검색</a>
								</span>
							</fieldset>
						</form>
						<!-- .검색 폼 끝 -->
					</div>
					<dl class="bbs-link bbs-link-btm">
						<dd>
							<a class="write  btn_dark btn_box_01"
								href="${pageContext.request.contextPath}/shop/ReviewFormBoard.do">글쓰기</a>
						</dd>
					</dl>
					<!-- .page-body -->
					<div class="paging">
						<ol class="paging">
							<li class="next"><a href="#"><img
									src="BoardImg/next_btn.gif" alt="다음"></a></li>
							<li class="last"><a href="#"><img
									src="BoardImg/last_btn.gif" alt="끝"></a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="../modules/footer.jsp" />
</body>
</html>