$(function(){
		$(".couponCan").click(function(){
			window.close();
		})
		
		
		
		
		//쿠폰가격 제한
	
		
		$(".itemNo").click(function(){
			var price1 = parseInt($(".oriPrice").text());
			var clickusemore = $(this).parent().parent().find(".moreprice").text();
			console.log(clickusemore);
			if(price1<clickusemore){
				alert("해당 쿠폰은 총 주문금액이 "+clickusemore+"원 이상일 경우 사용 가능합니다.");
				return false;
			}
			var salePrice =  parseInt($(this).parent().parent().find(".findValue").text());
			$(".couponPrice").text(salePrice);
			$(".finallyPrice").text(price1-salePrice);
			
			var itemno = $(this).text();
			var finallyprice = $(".finallyPrice").text();
			
			//유저쿠폰 번호
			var userno = $(this).next().val();
			//사용여부
			var uesyn = $(this).next().next().val();
			$(".couponSub").click(function(){
				var result = confirm("쿠폰을 적용하시겠습니까?");
				if(result){
					 var returnCpValue = {
							    "couponNo": itemno,//쿠폰번호
							    "couponusePrice": finallyprice,//쿠폰할인된 가격
							    "userno": userno, //유저쿠폰 번호
							    "uesyn": uesyn //사용여부
							  };
					window.opener.getReturnValue(JSON.stringify(returnCpValue));
					window.close();
				}
			
			})
		})
			
	})