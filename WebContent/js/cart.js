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
		//전체 체크된것 계산
		var priceArray = new Array();
		var priceSum = 0;
		$(".proContent").each(function(i,obj){
			var checkPr = $("input:checkbox[name='chkAll']").eq(i).is(":checked"); //체크
			if(checkPr==true){
				var checkedPrdPrice =parseInt($(".proContent").eq(i).children().eq(5).children().eq(0).text());//체크된 가격들
				priceArray[i] = checkedPrdPrice;
				priceSum += priceArray[i];
			}
		})
		$(".prdsPrice").text(priceSum); //상품 합 금액
		$("input:hidden[name='prdsPrice']").val(priceSum);//상품 합 금액 인풋
		var deliveryFee = parseInt($(".deliveryfee").text());
		$(".prdplusdel").text(priceSum+deliveryFee); //상품+배송비
		//체크 된것만 계산할 때
		$(".proContent").each(function(i,obj){
			$("input:checkbox[name='chkAll']").click(function(){
				var ischecked = $("input:checkbox[name='chkAll']").eq(i).is(":checked"); //체크된것만
				if(ischecked == true){
					var o = $("proContent").eq(i).children().eq(5).children().eq(0).text();
					console.log(o);          
				}
				
			})
		})
		
		
		//수량 카운트 작업
		var ProductCheckBox = $("input:checkbox[name='chkAll']").is(":checked"); //체크된 상품들
		if(ProductCheckBox == true){
			
		}
		
	
		
		//상품 삭제 (삭제버튼으로) -- 각각 삭제
		$(".delete").click(function(){
			$(this).parent().parent().remove();
		})
		//장바구니 비우기
		$("#clean_cart").click(function(){
			$(".proContent").children().remove();
			$(".allProPrice").remove();
			$(".proContent").wrap("<td colspan='6' class='emptycart' />");
			$(".emptycart").html("<p>장바구니에 담겨있는 상품이 없습니다.</p>");
		})
		//선택 삭제
		$("#select_del").click(function(){
			var flag = $("input:checkbox[name='checkPro']").is(":checked");
			if(flag == true){
				$("input:checkbox[name='chkAll']").parent().parent().remove();
			}
		})
		//상품 번호 번호(체크박스) 숫자 임의로 넣음 ->나중에 수정하기
		
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
	
		
	})