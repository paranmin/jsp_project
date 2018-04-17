<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="Boardcss/Board.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Serif|Nanum+Myeongjo|Playfair+Display">
<link rel="stylesheet" href="css/base.css" media="all" />
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

.list-link li {
	padding: 4px 0px;
}
</style>

</head>

<body>
	<c:import url="modules/header.jsp" />
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
		<section>
			<div class="page-body">


				<dl class="prd-tinfo">
					<dt>
						<a
							href="/shop/shopdetail.html?branduid=976526&amp;xcode=068&amp;mcode=001&amp;scode=&amp;GfDT=bm54W1w%3D"><img
							src="#"></a>
					</dt>
					<dd>
						<ul>
							<li class="name"><span class="tit">상 품 명:</span><a
								href="/shop/shopdetail.html?branduid=976526&amp;xcode=068&amp;mcode=001&amp;scode=&amp;GfDT=bm54W1w%3D">타이니
									크로스 바벨</a> <span class="MK-product-icons"></span> <!--/coupon_icon/--></li>
							<li class="price"><span class="tit">상품가격:</span><strong>3,000원</strong></li>
						</ul>
					</dd>
				</dl>
				<div class="bbs-table-view">
					<table summary="게시글 보기">
						<caption>게시글 보기</caption>
						<thead>
							<tr>
								<th><div class="tb-center">왼쪽귓볼</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="line">
									<div class="cont-sub-des">
										<div>
											<span><em>작성일 :</em> 2018-04-06</span>
										</div>
										<div>
											<span><em>작성자 :</em> rnlwlsdl10</span> <span><em>파일
													:</em> <a
												href="http://board.makeshop.co.kr/board/special132/curiouswiz_board3/20180406142851.jpg">20180406142851.jpg</a></span>
										</div>
										<div class="hit">
											<span><em>조회 :</em> 7</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="data-bd-cont">
										<div class="attach">
											<img width="999"
												src="http://board.makeshop.co.kr/board/special132/curiouswiz_board3/20180406142851.jpg">
										</div>
										작아서 귀여워요!
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="comment_list_0"></div>
					<form id="comment_form" name="comment"
						action="board.html?code=curiouswiz_board3&amp;page=2&amp;type=v&amp;board_cate=&amp;num1=942911&amp;num2=00000&amp;number=102643&amp;lock=N"
						method="post" autocomplete="off">
						<input type="hidden" name="page_type" value="board_view">
						<input type="hidden" name="formnum" value="0"> <input
							type="hidden" name="code" value="curiouswiz_board3"> <input
							type="hidden" name="num1" value="942911"> <input
							type="hidden" name="num2" value="00000"> <input
							type="hidden" name="page" value="1"> <input type="hidden"
							name="lock" value="N"> <input type="hidden" name="type"
							value="v"> <input type="hidden" name="type2"> <input
							type="hidden" name="comnum"> <input type="hidden"
							name="comtype"> <input type="text" name="___DUMMY___"
							readonly="" disabled="" style="display: none;"><input
							type="hidden" name="secret" value="N">
						<fieldset>
							<legend>코멘트 쓰기</legend>
							<div class="new-privercy-contract">
								<div class="new-privercy-contract">
									<p>개인정보 수집·이용</p>
									<div class="privercy-contract">
										<table class="tbl" summary="목적, 항목, 보유기간">
											<caption>개인정보 수집/이용</caption>
											<colgroup>
												<col width="30%">
												<col width="*">
												<col width="20%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">목적</th>
													<th scope="col">항목</th>
													<th scope="col">보유기간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="purpose"><div class="txt-l">게시판 서비스
															제공</div></td>
													<td class="items"><div class="txt-l">이름, 비밀번호,
															작성내용, IP Address</div></td>
													<td class="holding"><div class="txt-l">게시글 삭제 시</div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<table summary="코멘트 쓰기" class="comment-box">
								<caption>코멘트 쓰기</caption>
								<colgroup>
									<col width="120">
									<col>
									<col width="150">
								</colgroup>
								<tbody>
									<tr>
										<td colspan="3" class="com-wrt-box">
											<div>
												<div class="wrt">
													<label>작성자</label><span><input type="text"
														name="cname" class="MS_input_txt input-style input-style2"
														value="" onclick="CheckLogin()" onkeypress="CheckLogin()"
														placeholder="이름"></span> <label>비밀번호</label><span><input
														type="password" name="cpass"
														class="MS_input_txt input-style input-style2"
														onclick="CheckLogin()" onkeypress="CheckLogin()"
														placeholder="패스워드"> </span>
												</div>
												<div class="wrt">
													<textarea name="comment" onchange="Checklength(this);"
														onkeyup="Checklength(this);" onclick="CheckLogin()"
														placeholder="내용"></textarea>
													<a href="javascript:comment_save('');"
														class="btn_light btn_box_02">확인</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</form>
					<div class="view-link">
						<dl class="bbs-link con-link">
							<dt></dt>
							<dd>
								<a
									href="/board/board.html?code=curiouswiz_board3&amp;page=2&amp;board_cate=&amp;num1=942911&amp;num2=00000&amp;type=q&amp;type2=u"
									class="none btn_light_border btn_box_01">수정</a> <a
									href="/board/board.html?code=curiouswiz_board3&amp;page=2&amp;board_cate=&amp;num1=942911&amp;num2=00000&amp;type=q&amp;type2=d"
									class="btn_light_border btn_box_01">삭제</a> <a
									href="/board/board.html?code=curiouswiz_board3&amp;page=2&amp;board_cate=&amp;num1=942911&amp;num2=00000&amp;type=r&amp;lock_re=N"
									class="btn_light btn_box_01">답변</a>
							</dd>
						</dl>
						<dl class="bbs-link">
							<dt></dt>
							<dd>
								<a class="write btn_dark btn_box_01"
									href="/board/board.html?code=curiouswiz_board3&amp;page=2&amp;board_cate=&amp;type=i">글쓰기</a>
								<a
									href="/board/board.html?code=curiouswiz_board3&amp;page=2&amp;board_cate=&amp;s_id=&amp;stext=&amp;ssubject=&amp;shname=&amp;scontent=&amp;sbrand=&amp;sgid=&amp;datekey=&amp;branduid="
									class="btn_light btn_box_01"> 목록</a>
							</dd>
						</dl>
					</div>
					<ul class="list-link">
						<li><span class="arrow prev">이전글 :</span> <a
							href="/shop/shopdetail.html?branduid=979417">[베이직 초승달 바벨]</a> <a
							href="/board/board.html?code=curiouswiz_board3&amp;board_cate=&amp;num1=942910&amp;num2=10000&amp;type=v&amp;&amp;s_id=&amp;stext=&amp;ssubject=&amp;shname=&amp;scontent=&amp;sbrand=&amp;sgid=&amp;datekey=&amp;branduid=&amp;lock=N">Re:
								실버 오른쪽 아웃컨츠</a></li>
						<li><span class="arrow next">다음글 :</span> <a
							href="/shop/shopdetail.html?branduid=976526">[타이니 크로스 바벨]</a> <a
							href="/board/board.html?code=curiouswiz_board3&amp;board_cate=&amp;num1=942911&amp;num2=10000&amp;type=v&amp;&amp;s_id=&amp;stext=&amp;ssubject=&amp;shname=&amp;scontent=&amp;sbrand=&amp;sgid=&amp;datekey=&amp;branduid=&amp;lock=N">Re:
								왼쪽귓볼</a></li>
					</ul>
				</div>
			</div>
		</section>
		<c:import url="modules/footer.jsp" />
</body>
</html>