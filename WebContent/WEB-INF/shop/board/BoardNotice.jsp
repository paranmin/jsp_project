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
<script src="${pageContext.request.contextPath}/js/base.js"></script>
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
	border-top: 1px solid rgb(232, 232, 232);
}

.bbs-link-btm {
	float: right;
	margin: 20px 0px 0;
	text-align: left;
}

.bbs-link {
	position: relative;
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
				<h1>Notice</h1>
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
			<div class="bbs-table-list">
				<table>
					<caption>일반게시판 게시글</caption>
					<colgroup>
						<col width="70">
						<col width="30">
						<col width="*">
						<col width="110">
						<col width="120">
						<col width="60">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><div class="tb-center">번호</div></th>
							<th scope="col"><div class="tb-center">&nbsp;</div></th>
							<th scope="col"><div class="tb-center">제목</div></th>
							<th scope="col"><div class="tb-center">작성자</div></th>
							<th scope="col"><div class="tb-center">작성일</div></th>
							<th scope="col"><div class="tb-center">조회</div></th>
						</tr>
					</thead>
					<tbody>
						<!--. 공지사항 리스트 끝! -->

						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">125</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="#" style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999737&amp;num2=00000&amp;number=125&amp;lock=N">[03/23]
										워크샵 휴무/배송 공지</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2018/03/21</div></td>
							<td><div class="tb-center">1745</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">124</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999738&amp;num2=00000&amp;number=124&amp;lock=N">[03/01]
										삼일절 휴무/배송 공지</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2018/02/28</div></td>
							<td><div class="tb-center">1144</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">123</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999739&amp;num2=00000&amp;number=123&amp;lock=N">[02/15~02/18]
										설연휴 특별할인</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2018/02/13</div></td>
							<td><div class="tb-center">5198</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">122</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999740&amp;num2=00000&amp;number=122&amp;lock=N">[02/12]
										설연휴 휴무/배송 공지</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2018/02/12</div></td>
							<td><div class="tb-center">2587</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">121</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999741&amp;num2=00000&amp;number=121&amp;lock=N">[01/20]
										8주년기념 전상품 8%할인 이벤트</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2018/01/19</div></td>
							<td><div class="tb-center">7281</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">120</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999742&amp;num2=00000&amp;number=120&amp;lock=N">[12/29]
										신정 휴무 안내</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2017/12/29</div></td>
							<td><div class="tb-center">1982</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">119</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999743&amp;num2=00000&amp;number=119&amp;lock=N">[12/22]
										크리스마스 휴무 안내</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2017/12/22</div></td>
							<td><div class="tb-center">1891</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">118</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999744&amp;num2=00000&amp;number=118&amp;lock=N">[11/27]
										2017 수능 수험표 이벤트</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2017/11/27</div></td>
							<td><div class="tb-center">6477</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">117</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999746&amp;num2=00000&amp;number=117&amp;lock=N">[06/05]
										휴면 ID 포인트 소멸 공지</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2017/06/05</div></td>
							<td><div class="tb-center">2065</div></td>
						</tr>
						<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
						<tr>
							<td><div class="tb-center">116</div></td>
							<td><div class="tb-left">
									<img src="images/noticeusepic.gif">
								</div></td>
							<!-- .product image 관련 -->
							<td>
								<div class="tb-left">
									<img src="/board/images/neo_head.gif"
										style="padding-left: 00px;">

									<!--. 스팸글 처리 -->
									<a
										href="/board/board.html?code=curiouswiz_board2&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999747&amp;num2=00000&amp;number=116&amp;lock=N">[06/05]
										현충일 휴무 안내 공지</a>
								</div>
							</td>
							<td>
								<div class="tb-center">
									<img src="/board/images/neo_adminimg.gif">
								</div>
							</td>
							<td><div class="tb-center">2017/06/05</div></td>
							<td><div class="tb-center">1873</div></td>
						</tr>
						<!--. 게시글 리스트 끝 -->
					</tbody>
				</table>
			</div>
			<div class="boardText"></div>
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
						onclick="change(2);" checked="checked" class="MS_input_checkbox">제목
					</label> <label> <input type="radio" name="check" value="ok"
						onclick="change(3);" class="MS_input_checkbox"> 내용
					</label> </label> <span class="key-wrap"> <input type="text" name="stext"
						value="" class="MS_input_txt"> <a href="#"
						class=" btn_light btn_box_01">검색</a>
					</span>
				</fieldset>
			</form>
			<!-- .검색 폼 끝 -->
		</div>
		<dl class="bbs-link bbs-link-btm">
			<dd>
				<a class="write  btn_dark btn_box_01" href="${pageContext.request.contextPath}/shop/BoardNoticeForm.do">글쓰기</a>
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
	</section>
	<c:import url="../modules/footer.jsp" />
</body>
</html>