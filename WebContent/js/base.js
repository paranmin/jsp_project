$(function(){
	$("#header .btn_left_menu").on("click", function() {
		var $leftSide = $("#left_side"); 
		if ($leftSide.css("display") == "none") {
			$leftSide.show();
		} else {
			$leftSide.hide();
		}
	});
	$("div#left_side img.close_left").on("click", function() {
		$("#left_side").hide();
	});
	$("#header .btn_right_menu").on("click", function() {
		var $rightSide = $("#right_sub_menu"); 
		if ($rightSide.css("display") == "none") {
			$rightSide.show();
		} else {
			$rightSide.hide();
		}
	});
	$("div#right_sub_menu .btn_close_right").on("click", function() {
		$("#right_sub_menu").hide();
	});

});

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function daumPostcode(postEl, addr1, addr2) {
	new daum.Postcode({
		oncomplete: function(data) {
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수
			var zipcode = '';
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
				zipcode = data.zonecode;

				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
				zipcode = data.postcode;
			}
			
			$(postEl).val(zipcode);
			$(addr1).val(fullAddr);
			$(addr2).focus();
		}
	}).open();
}

function checkDulpEmail(emailId, emailBody) {
	var chkEmail = $(emailId).val()+"@"+$(emailBody).val();
	$.ajax({
		url: "checkEmail.do",
		type: "post",
		data: {email: chkEmail},
		dataType: "json",
		success: function(result) {
			console.log(result);
		}
	});
}
