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
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<!-- .상품정보가 있을 경우에만 나타남 -->
									<td colspan="2">
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942962&amp;num2=00000&amp;number=102640&amp;lock=N&amp;flag=notice">[2018.03]
												베스트 포토후기 romance7님</a> <img src="/board/images/neo_hit.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2018/04/05</div></td>
									<td><div class="tb-center">175</div></td>
								</tr>
								<!--. 공지사항 리스트 끝! -->

								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102650</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680040001453.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=979232">[크리비즈 드롭
												쥬얼리 바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942906&amp;num2=00000&amp;number=102650&amp;lock=N">실버
												왼쪽 귓볼</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102649</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680040001453.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=979232">[크리비즈 드롭
												쥬얼리 바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942907&amp;num2=00000&amp;number=102649&amp;lock=N">실버
												오른쪽 귓볼</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102648</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680040000933.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=974235">[입체 큐빅 꽃
												쥬얼리 바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942908&amp;num2=00000&amp;number=102648&amp;lock=N">롱
												오른쪽 귓볼</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102647</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680010010473.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=979437">[도트 하트 큐빅
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942909&amp;num2=00000&amp;number=102647&amp;lock=N">실버
												왼쪽 이너컨츠</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">5</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102646</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;"> <a
												href="/shop/shopdetail.html?branduid=979437">[도트 하트 큐빅
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942909&amp;num2=10000&amp;number=102646&amp;lock=N">실버
												왼쪽 이너컨츠</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102645</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680010010413.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=979417">[베이직 초승달
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942910&amp;num2=00000&amp;number=102645&amp;lock=N">실버
												오른쪽 아웃컨츠</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">5</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102644</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;"> <a
												href="/shop/shopdetail.html?branduid=979417">[베이직 초승달
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942910&amp;num2=10000&amp;number=102644&amp;lock=N">실버
												오른쪽 아웃컨츠</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102643</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680010009513.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=976526">[타이니 크로스
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942911&amp;num2=00000&amp;number=102643&amp;lock=N">왼쪽귓볼</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											rnlwlsdl10
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">3</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102642</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;"> <a
												href="/shop/shopdetail.html?branduid=976526">[타이니 크로스
												바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942911&amp;num2=10000&amp;number=102642&amp;lock=N">왼쪽귓볼</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">102641</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680060000133.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=954432">[원터치 일루젼
												원볼링]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz_board3&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=942912&amp;num2=00000&amp;number=102641&amp;lock=N">이뻐요</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											tyhj2960
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">7</div></td>
								</tr>
								<!--. 게시글 리스트 끝 -->
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
							<a class="write  btn_dark btn_box_01" href="${pageContext.request.contextPath}/shop/ReviewFormBoard.do">글쓰기</a>
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