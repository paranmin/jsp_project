<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset{
	width:30%;
	margin:50px auto;
}
label{
	width:150px;
	float:left;
}
input[type='text']{
	width:400px;
}
p.submit{
	text-align:center;
}
p.submit input{
	margin-top:10px;
	width:70px;
	height: 30px;
	border: none;
}
p.submit input[type='submit']{
	background: wheat;
}
</style>
</head>
<body>
	<form action="" method="post">
		<fieldset>
			<legend>상품 등록</legend>
			<p>
				<label>상품 카테고리</label>
				<select name="cate">
					<option>귀걸이</option>
					<option>이어커프</option>
					<option>목걸이</option>
					<option>팔찌</option>
					<option>발찌</option>
					<option>반지</option>
					<option>발가락지/토링</option>
					<option>헤어 CSS</option>
					<option>시계</option>
					<option>폰 ACC</option>
					<option>기타</option>
				</select>
			</p>
			<p>
				<label>상품 이름</label>
				<input type="text" name="name">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>상품 부가설명</label>
				<input type="text" name="sub_desc">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>원가(원)</label>
				<input type="text" name="cost">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>할인</label>
				<select name="discount">
					<option>0%</option>
					<option>7%</option>
					<option>10%</option>
					<option>20%</option>
					<option>30%</option>
					<option>50%</option>
				</select>
			</p>
			<p>
				<label>판매가(원)</label>
				<input type="text" name="price">
				<!-- <p class="error">제목을 입력하세요.</p> -->
			</p>
			<p>
				<label>재고</label>
				<input type="text" name="stock">
			</p>
			<p>
				<label>상품 메인 이미지</label>
				<input type="file" name="mainimg" value="이미지 불러오기">
				<button class="img_plus">추가</button>
			</p>
			<p>
				<label>상품 이미지</label>
				<input type="file" name="files" value="이미지 불러오기">
				<button class="img_plus">추가</button>
			</p>

			<p>
				<label>옵션 유무</label>
				<input type="radio" id="option" name="use_option" value="1">사용 <input type="radio" id="option" name="use_option" value="0">사용안함
			</p>
					
			<p class="submit">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>