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
	var priceSum = 0;
	$(".proContent").each(function(i,obj){
		var productPrice = parseInt($(".productPrice").eq(i).text());
		priceSum += productPrice;
	})
	$(".orderChargePrice").text(priceSum);
	var ordertotalPrice = $(".orderChargePrice").text();
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
	}
	
})