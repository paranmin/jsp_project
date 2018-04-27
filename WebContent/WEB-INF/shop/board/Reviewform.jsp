<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.prd-tinfo {
	zoom: 1;
	overflow: hidden;
	padding: 10px 0 10px 80px;
	border: 1px solid #ddd;
	margin-bottom: 40px;
}

.prd-tinfo>dd>ul {
	padding: 15px 0 0 10px;
	min-height: 45px;
	_height: 45px;
	border-left: 1px solid #ddd;
}
</style>
</head>
<body>
	<c:import url="../modules/header.jsp" />
	<c:import url="../modules/leftSide.jsp" />
	<c:import url="../modules/rightSide.jsp" />
	<section>
		<div class="titleArea">
			<h2>REVIEW</h2>
		</div>
		<div class="top_box">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/shop/NoticeBoard.do">Notice</a></li>
				<li><span><a>/</a></span></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/BoardQandA.do">Q&amp;A</a></li>
				<li><span><a>/</a></span></li>
				<li><a
					href="${pageContext.request.contextPath}/shop/ReviewBoard.do">Review(후기)</a></li>
			</ul>
		</div>

		<div id="bbsData">
			<div class="page-body">
				<form action="ReviewForm.do" method="post"
					enctype="multipart/form-data">

					<input type="hidden" name="prdno" value="${pro.prdNo}">
					<dl class="prd-tinfo">
						<dt>
							<img src="${pageContext.request.contextPath}/upload/${pro.mainImg }" width="64" height="64">
						</dt>
						<dd>
							<ul>

								<li class="name"><span class="tit">상 품 명:</span><a href="#">${pro.name }</a>
									<span class="MK-product-icons"> <!--/coupon_icon/--></li>
								<li class="price"><span class="tit">상품가격:</span><strong>${pro.sellingPrice }</strong></li>
							</ul>
						</dd>
					</dl>
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
										<th><div class="title">작성자</div></th>
										<td><div>
												<input id="bw_input_writer" type="text" name="brdwriter"
													class="MS_input_txt input_style">
											</div></td>
										<th><div class="title">비밀번호</div></th>
										<td>
											<div>
												<input id="bw_input_passwd" type="password"
													name="brdpassword" class="MS_input_txt input_style">
												<input type="hidden" name="brdcode" value="ReviewBoard">
											</div>
										</td>

									</tr>
									<tr>
										<th><div class="title">제목</div></th>
										<td colspan="3">
											<div class="title">
												<input id="bw_input_subject"
													class="MS_input_txt input_style2" type="text"
													name="brdtitle" value=""> <input id="bw_input_file"
													type="hidden" name="brdch" value="0">
											</div>
										</td>
									</tr>
									<tr>
										<th><div class="title">내용</div></th>
										<td colspan="3">
											<div>
												<textarea rows="120" cols="500" name="brdcontent"></textarea>
											</div>
										</td>
									</tr>
									<tr>
										<th><div class="title">파일</div></th>
										<td colspan="3">
											<div>
												<input id="bw_input_file" type="file"
													name="brduseattachment" value="첨부">
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
								href="${pageContext.request.contextPath}/shop/ReviewBoard.do"
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