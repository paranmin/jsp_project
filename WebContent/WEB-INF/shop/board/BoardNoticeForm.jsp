<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Boardcss/writeform.css"
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
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/base.js"></script>


<title>Insert title here</title>
<style type="text/css">
.titleArea h2 {
	font-size: 17px;
}

#submit {
	padding: 8px;
	border: 0;
}
</style>
</head>
<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
	<section>
		<div class="titleArea">
			<h2>Notice</h2>
		</div>
		<div class="top_box">
			<ul>
				<li><a href="#">Notice</a></li>
				<li><span><a>/</a></span></li>
				<li><a href="#">Q&amp;A</a></li>
				<li><span><a>/</a></span></li>
				<li><a href="#">Review(후기)</a></li>
			</ul>
		</div>

		<div id="bbsData">
			<div class="page-body">
				<form action="BoardNoticeForm.do" method="post"
					enctype="multipart/form-data" style="position: relative;"
					autocomplete="off">
					<div id="passimg" name="passimg"
						style="position: absolute; visibility: hidden; z-index: 999;"></div>
					<input type="hidden" name="attach1" value=""> <input
						type="hidden" name="type" value="i"> <input type="hidden"
						name="data" value="yes"> <input type="hidden" name="code"
						value="curiouswiz_board3"> <input type="hidden"
						name="num1" value=""> <input type="hidden" name="num2"
						value=""> <input type="hidden" name="page" value="1">
					<input type="hidden" name="ok" value="N"> <input
						type="hidden" name="board_cate" value=""> <input
						type="hidden" name="b_score[1]" value=""> <input
						type="hidden" name="b_score[2]" value=""> <input
						type="hidden" name="b_score[3]" value=""> <input
						type="hidden" name="b_score[4]" value=""> <input
						type="hidden" name="b_score[5]" value=""> <input
						type="hidden" name="branduid" value=""> <input
						type="hidden" name="BRO_CHK_KEY"
						value="95becf641cdef54229ba48b8c6fc8138c9f632df2d199eb86bcf2b56772dd75f">
					<div class="bbs-table-write">
						<fieldset>
							<legend>일반게시판 쓰기</legend>
							<table summary="">
								<caption>게시판 글쓰기</caption>
								<colgroup>
									<col width="95">
									<col width="190">
									<col width="90">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th class=""><div class="title">작성자</div></th>
										<td><div>
												<input id="bw_input_writer" type="text" name="hname"
													class="MS_input_txt input_style" readonly="readonly"
													value="qowlsgh1">
											</div></td>
										<th><div class="title">비밀번호</div></th>
										<td>
											<div>
												<input id="bw_input_passwd" type="password" name="passwd"
													class="MS_input_txt input_style">
											</div>
										</td>
									</tr>
									<tr>
										<th><div class="title">제목</div></th>
										<td colspan="3">
											<div class="title">
												<input id="bw_input_subject"
													class="MS_input_txt input_style2" type="text"
													name="subject" value="">
											</div>
										</td>
									</tr>
									<tr>
										<th><div class="title">내용</div></th>
										<td colspan="3">
											<div>
												<textarea rows="120" cols="500"></textarea>
											</div>
										</td>
									</tr>
									<tr>
										<th><div class="title">파일</div></th>
										<td colspan="3">
											<div>
												<input id="bw_input_file" type="file" name="file_name1"
													value="첨부">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>

					<dl class="bbs-link bbs-link-btm">
						<dt></dt>
						<dd>
							<input type="submit" value="글등록" id="submit"> <a
								href="${pageContext.request.contextPath}/shop/NoticeBoard.do"
								class="btn_light btn_box_01">목록</a>
						</dd>
					</dl>
				</form>

			</div>
			<!-- .page-body -->
		</div>
	</section>
	<c:import url="../modules/footer.jsp" />
</body>
</html>