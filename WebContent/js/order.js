$(function(){
	$(".checksameus").click(function(){
		var flag = $(".checksameus:checked").val();
		
		if($(this).val()==flag){
			var name = $(".username").val();
			var middleNum = $(".middleNum").val();
			var lastNum = $(".lastNum").val();
			
			$("#orderusername").val(name);
			$("#phoneNum1").val(middleNum);
			$("#phoneNum2").val(lastNum);
		}else{
			$("#orderusername").val("");
			$("#phoneNum1").val("");
			$("#phoneNum2").val("");
		}
		
	});
	
	var value1 = parseInt($(".orderChargePrice").text());
	var value2 =  parseInt($(".delfee").text());
	
	var price = $(".toalpriceorder").text(value1+value2);
	
	$(".btnCoupon").click(function(){
		var price = $(".toalpriceorder").text();
		 window.open('coupon.do?price='+price, '쿠폰 적용', 'width=650, height=550');
		 return false;
	})
	if($(".optionYN").text()!=""){     
		$("input:hidden[name='optionValue']").val("1");
	}else if($(".optionYN").text()==""){
		$("input:hidden[name='optionValue']").val("0");
	}
	var optionName = $(".optionYN").text();
	$("input:hidden[name='optionYN']").val(optionName);
	
	
	var price1 = $(".productPrice").text();
	$("input:hidden[name='productPrice']").val(price1);
	var count1 = $(".productCount").text();
	$("input:hidden[name='productCount']").val(count1);
	
	//계산
	var array = new Array();
	var priceSum = 0;
	$(".proContent").each(function(i,obj){
		var productPrice = parseInt($(".productPrice").eq(i).text());
		array[i] = productPrice;
		priceSum += array[i];
	})
	
	$(".orderChargePrice").text(priceSum); //결제금액 값 넣음
	var delFee = parseInt($(".delfee").text());
	var delFeePlus = $(".toalpriceorder").text(priceSum+delFee);
	
	if(priceSum>35000){
		$(".unusedelFee").css("display","table-cell");
		$(".usedelFee").css("display","none");
		$("input:hidden[name='orderChargePrice']").val(priceSum);
	}else if(priceSum<35000){
		$(".unusedelFee").css("display","none");
		$(".usedelFee").css("display","table-cell");
		$("input:hidden[name='orderChargePrice']").val(priceSum);
	}
	 var totalprice =$("input:hidden[name='orderChargePrice']").val();
	 
	 
	 //최종 결제 금액 !! 마지막에 오는거
	if(priceSum>35000){
		$(".finalPrice").text(priceSum);
	 }else if(priceSum<35000){
		 $(".finalPrice").text(priceSum+delFee);

	 }
	 
	 //수량 input
	$(".productCount").each(function(i,obj){
		$("input:hidden[name='productCount']").eq(i).val($(obj));
		
	})
	console.log($("input:hidden[name='productCount']").val());
	
	/*var ordertotalPrice = $(".orderChargePrice").text();
	var deliveryFee = $(".delfee").text();
	if(ordertotalPrice>35000){
		$(".unusedelFee").css("display","table-cell");
		$(".usedelFee").css("display","none");
		$("input:hidden[name='orderChargePrice']").val(ordertotalPrice);
	}else if(ordertotalPrice<35000){
		$(".unusedelFee").css("display","none");
		$(".usedelFee").css("display","table-cell");
		$(".toalpriceorder").text(ordertotalPrice+deliveryFee);
		$("input:hidden[name='orderChargePrice']").val(ordertotalPrice);
		$("input:hidden[name='delfee']").val(deliveryFee);
	}*/
	
	//이메일 직접 입력인 경우
	$(".checkEmail").on("change",function(){
		if($(this).val()=="input"){
			$(".eamilAddress").val("");
			$(".eamilAddress").css("display","inline");
		}else{
			$(".eamilAddress").css("display","none");
			$(".eamilAddress").val($(this).val());
		}
	})
	
	$("#newaddr").click(function(){
		$("input:text[name='post1']").val("");
		$("input:text[name='basicaddr']").val("");
		$("input:text[name='detailaddr']").val("");
		getPostCode();
	})
	$("#homeaddr").click(function(){
		
		$.ajax({
			url:"homeComming.do",
			dataType:"json",
			success:function(data){
				if(data.rel == "ok"){
					console.log(data.result);
					$("input:text[name='post1']").val(data.result.zipcode);
					$("input:text[name='basicaddr']").val(data.result.addr1);
					$("input:text[name='detailaddr']").val(data.result.addr2);
				};
			}
		})
	})
	$("#recentaddr").click(function(){
		shipList();
	})
	
	
})
function getPostCode(){
	daumPostcode("input:text[name='post1']","input:text[name='basicaddr']","input:text[name='detailaddr']");
}
function shipList(){
	window.open('shipping.do', '배송지 목록', 'width=500, height=400');
	return false;
}