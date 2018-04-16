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
	<c:import url="modules/header.jsp" />
	<section>
		<div id="container">
			<div class="titleArea">
				<h1>Q&amp;A</h1>
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
								<%-- <c:if test="${board.size()>0 }">
									<c:forEach var="item" items="${board }">
										<tr>
											<td><a href="projectread.do?projectno=${board.brd_no }">${board.brd_no }</a></td>
											<td>${board.brd_no }</td>
											<td>${item.enddate }</td>
											<td>${item.nowproject }</td>
										</tr>
									</c:forEach>
								</c:if> --%>
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
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=972820&amp;num2=00000&amp;number=96877&amp;lock=N&amp;flag=notice">[교환환불]
												단순변심으로 인한 교환/반품에 대해 알려주세요.</a> <img
												src="/board/images/neo_hit.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2015/08/05</div></td>
									<td><div class="tb-center">56632</div></td>
								</tr>
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
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=972821&amp;num2=00000&amp;number=96876&amp;lock=N&amp;flag=notice">[교환환불]
												상품불량으로 인한 교환/반품에 대해 알려주세요.</a> <img
												src="/board/images/neo_hit.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2015/08/05</div></td>
									<td><div class="tb-center">54880</div></td>
								</tr>
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
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=972823&amp;num2=00000&amp;number=96875&amp;lock=N&amp;flag=notice">[품절/재입고]
												재입고, 품절 관련 안내</a> <img src="/board/images/neo_hit.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2015/08/05</div></td>
									<td><div class="tb-center">61878</div></td>
								</tr>
								<!--. 공지사항 리스트 끝! -->

								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96887</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947460&amp;num2=00000&amp;number=96887&amp;lock=Y">[배송]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											hikaros
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96886</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947461&amp;num2=00000&amp;number=96886&amp;lock=Y">[배송]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											tls4539
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">1</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96885</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947461&amp;num2=10000&amp;number=96885&amp;lock=Y">[배송]
												문의합니다.</a>
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
									<td><div class="tb-center">0</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96884</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947462&amp;num2=00000&amp;number=96884&amp;lock=Y">[기타]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											hayyp2
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">6</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96883</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947462&amp;num2=10000&amp;number=96883&amp;lock=Y">[기타]
												문의합니다.</a>
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
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96882</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947463&amp;num2=00000&amp;number=96882&amp;lock=Y">[기타]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											hayyp2
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">3</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96881</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947463&amp;num2=10000&amp;number=96881&amp;lock=Y">[기타]
												문의합니다.</a>
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
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96880</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947464&amp;num2=00000&amp;number=96880&amp;lock=Y">[교환/반품]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											gsh05115
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">96879</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">&nbsp;</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_reply.gif"
												style="padding-left: 10px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947464&amp;num2=10000&amp;number=96879&amp;lock=Y">[교환/반품]
												문의합니다.</a>
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
									<td><div class="tb-center">96878</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_lock.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td><div class="tb-left">
											<img src="/shopimages/curiouswiz/0680010004653.jpg"
												height="50" align="middle">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;"> <a
												href="/shop/shopdetail.html?branduid=946036">[하트 드로잉 바벨]</a>

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=curiouswiz&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=947466&amp;num2=00000&amp;number=96878&amp;lock=Y">[재입고]
												문의합니다.</a>
											<!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
											<!--. new아이콘처리 -->
											<img src="/board/images/neo_new.gif">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/shopimages/curiouswiz/royalicon_MX06.gif">
											tina09090
										</div>
									</td>
									<td><div class="tb-center">2018/04/06</div></td>
									<td><div class="tb-center">2</div></td>
								</tr>
								<!--. 게시글 리스트 끝 -->
							</tbody>
							</div>

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
							<a class="write  btn_dark btn_box_01" href="writeform.jsp">글쓰기</a>
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
	<c:import url="modules/footer.jsp" />
</body>
</html>