$(function(){
		//checked 작업
		var flag = $("input:checkbox[name='checkPro']").is(":checked");
		if(flag == true){
			$("input:checkbox[name='chkAll']").prop("checked",true);
		}
		
		$("input:checkbox[name='checkPro']").click(function(){
			var flag = $("input:checkbox[name='checkPro']").is(":checked");
			if(flag == false){
				$("input:checkbox[name='chkAll']").prop("checked",false);
			}else if(flag == true){
				$("input:checkbox[name='chkAll']").prop("checked",true);
			}
		})
		$(".proContent").each(function(i,obj){
			$("input:checkbox[name='chkAll']").eq(i).click(function(){
				var flag = $("input:checkbox[name='chkAll']").eq(i).is(":checked");
				if(flag == false){
					$("input:checkbox[name='checkPro']").prop("checked",false);
				}else if(flag == true){
					$("input:checkbox[name='checkPro']").prop("checked",true);
				}				
			})			
		})
		//전체 체크된것 계산
		var priceArray1 = new Array();
		var priceSum1 = 0;
		$(".proContent").each(function(i,obj){
			var checkPr = $("input:checkbox[name='chkAll']").eq(i).is(":checked"); //체크
			if(checkPr==true){
				var checkedPrdPrice =parseInt($(".proContent").eq(i).children().eq(5).children().eq(0).text());//체크된 가격들
				priceArray1[i] = checkedPrdPrice;
				priceSum1 += priceArray1[i];
			}
		})
		$(".prdsPrice").text(priceSum1); //상품 합 금액
		$("input:hidden[name='prdsPrice']").val(priceSum1);//상품 합 금액 인풋
		$(".prdsPrice2").text(priceSum1); //상품 합 금액
		$("input:hidden[name='prdsPrice2']").val(priceSum1);//상품 합 금액 인풋
		var deliveryFee = parseInt($(".deliveryfee").text());
		$(".prdplusdel").text(priceSum1+deliveryFee); //상품+배송비
		//체크 된것만 계산할 때
		var priceSum2 = 0;
		$("input:checkbox[name='chkAll']").click(function(){
			priceSum2 = 0;
			$(".proContent").each(function(i,obj){
				var ischecked = $("input:checkbox[name='chkAll']").eq(i).is(":checked"); //체크된것만
				if(ischecked == true){
					var checkedPrdPrice =parseInt($(".proContent").eq(i).children().eq(5).children().eq(0).text());//체크된 된가격들
					priceSum2+=checkedPrdPrice;
				}
			})
				$(".prdsPrice").text(priceSum2);
				$("input:hidden[name='prdsPrice']").val(priceSum2);//상품 합 금액 인풋
				$(".prdsPrice2").text(priceSum2);
				$("input:hidden[name='prdsPrice2']").val(priceSum2);//상품 합 금액 인풋
				var deliveryFee = parseInt($(".deliveryfee").text());
				$(".prdplusdel").text(priceSum2+deliveryFee); //상품+배송비
				
				var sumprice2 = $("input:hidden[name='prdsPrice']").val();
				if(sumprice2>35000){
					$(".firstTd").css("display","none");
					$(".secondTd").css("display","table-cell");
				}else if(sumprice2 < 35000){
					$(".firstTd").css("display","table-cell");
					$(".secondTd").css("display","none");   
				}
		})
		
		//수량 카운트 작업
			$(".plus").click(function(){
				var countPr = parseInt($(this).parent().next().find(".productPrice").data("price"));
				var prSum = parseInt($(this).parent().next().find(".productPrice").text());
				var totalPrdPrice = parseInt($(".prdsPrice").text());
				var totalPrdPrice = parseInt($(".prdsPrice2").text());
				var count = $(this).next().val();
				count++;
				$(this).next().val(count);
				var stock = $(this).next().next().next().val();
				if(count>stock){
					alert("이 상품은 "+stock+"까지 주문할 수 있습니다.");
					count = stock;
					$(this).next().val(count);					
					return false;   
				}
				var PrdtotalPrice = countPr+prSum;
				totalPrdPrice += countPr;
				$(this).parent().next().find(".productPrice").text(PrdtotalPrice);
				$(".prdsPrice").text(totalPrdPrice);
				var total = parseInt($(".prdsPrice").text());
				$("input:hidden[name='prdsPrice']").val(total);
				
				$(".prdsPrice2").text(totalPrdPrice);
				var total = parseInt($(".prdsPrice2").text());
				$("input:hidden[name='prdsPrice2']").val(total);
				var delivery = parseInt($(".deliveryfee").text());
				$(".prdplusdel").text(total+delivery);
				var sumprice2 = $("input:hidden[name='prdsPrice']").val();
				if(sumprice2>35000){
					$(".firstTd").css("display","none");
					$(".secondTd").css("display","table-cell");
				}else if(sumprice2 < 35000){
					$(".firstTd").css("display","table-cell");
					$(".secondTd").css("display","none");   
				}
				return false;
			})
			
		
		$(".minus").click(function(){
			var countPr = parseInt($(this).parent().next().find(".productPrice").data("price"));
			var prSum = parseInt($(this).parent().next().find(".productPrice").text());
			var totalPrdPrice = parseInt($(".prdsPrice").text());
			var totalPrdPrice = parseInt($(".prdsPrice2").text());
			var count = $(this).prev().val();
			count--;
			var PrdtotalPrice =countPr;
			if(count < 1){
				count = 1;
			}else{
				PrdtotalPrice = prSum-countPr;
				totalPrdPrice -= countPr;
			}
			$(this).prev().val(count);			
			$(this).parent().next().find(".productPrice").text(PrdtotalPrice);
			$(".prdsPrice").text(totalPrdPrice);
			var total = parseInt($(".prdsPrice").text());
			$("input:hidden[name='prdsPrice']").val(total);
			
			$(".prdsPrice2").text(totalPrdPrice);
			var total = parseInt($(".prdsPrice2").text());
			$("input:hidden[name='prdsPrice2']").val(total);
			var delivery = parseInt($(".deliveryfee").text());
			$(".prdplusdel").text(total+delivery);
			var sumprice2 = $("input:hidden[name='prdsPrice']").val();
			if(sumprice2>35000){
				$(".firstTd").css("display","none");
				$(".secondTd").css("display","table-cell");
			}else if(sumprice2 < 35000){
				$(".firstTd").css("display","table-cell");
				$(".secondTd").css("display","none");   
			}
			return false;
		})
		//배송비 작업
			
			var sumprice1 = $("input:hidden[name='prdsPrice2']").val();
			if(sumprice1 > 35000){
				$(".firstTd").css("display","none");
				$(".secondTd").css("display","table-cell");
			}else if(sumprice1 < 35000){
				$(".firstTd").css("display","table-cell");
				$(".secondTd").css("display","none");    
			}
			
		//삭제하기 버튼으로 각각 삭제 --안됨
		$(".delete").click(function(){
			jQuery.ajaxSettings.traditional = true;
			var cartNum = $(this).parent().parent().children().eq(0).find("input:checkbox[name='chkAll']").val();//장바구니 번호
			var buyingMemberNum = $(this).parent().parent().children().eq(0).find("input:hidden[name='buyingMem']").val();//멤버번호
			
			
			$.ajax({
				url:"delCartClickRemove.do",
				type:"post",
				dataType:"json",
				data:{"cartNum":cartNum,"clickRemovemNo":buyingMemberNum},
				success:function(data){
					location.href="cart.do"
				}
			})
			return false;
		})
		
		//갯수 업데이트
	
		
		//장바구니 비우기
		$("#clean_cart").click(function(){
			jQuery.ajaxSettings.traditional = true;
			var buyingMemberNum = $(this).parent().parent().children().eq(0).find("input:hidden[name='buyingMem']").val();//멤버번호
			
			$.ajax({
				url:"delCartAllRemove.do",
				type:"post",
				dataType:"json",
				data:{"clickRemovemNo":buyingMemberNum},
				success:function(data){
					if(data.result == "ok"){
						location.href="cart.do"
					};
				}
			})
		})
		//체크박스선택 삭제
		$("#select_del").click(function(){
			jQuery.ajaxSettings.traditional = true;
			var cartNo = [];
			var buyingMemberNum = $(this).parent().parent().children().eq(0).find("input:hidden[name='buyingMem']").val();
			$(".proContent").each(function(i,obj){
				var flag = $("input:checkbox[name='chkAll']").eq(i).is(":checked");
				if(flag == true){
					var valueCartNum = $("input:checkbox[name='chkAll']").eq(i).val();
					cartNo.push(valueCartNum);
				}
			})
			$.ajax({
				url:"delCartSelectRemove.do",
				type:"post",
				dataType:"json",
				data:{"cartNo":cartNo,"clickRemovemNo":buyingMemberNum},
				success:function(data){
					if(data.rel == "ok"){
						location.href="cart.do"
					};
				}

			})
			return false;
		})
		
		//상품 옵션 input val
		var oprionname = $(".optionname").text();
		$("input:hidden[name='proNamehr']").val(oprionname);
		
		//상품 이름
		var name = $(".prdName").text();
		$("input:hidden[name='prdName']").val(name);
		
		//상품 이미지
		$("#go_order").click(function(){
			var imgsrc =$(".proImg").attr("src");
			var src = imgsrc.split("/");
			$("input:hidden[name='proImg']").val(src[src.length-1]);
			console.log($("input:hidden[name='proImg']").val());
		})
		
		
		$(".gobackpage").click(function(){
			history.back();
		})
			
			
		
		
	})