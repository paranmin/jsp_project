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
		$(".proContent").each(function(i,obj){
			var checkPr = $("input:checkbox[name='chkAll']").eq(i).is(":checked"); //체크
			if(checkPr==true){
				var checkedPrdPrice =parseInt($(".proContent").eq(i).children().eq(5).children().eq(0).text());//체크된 가격들
				console.log(checkedPrdPrice);
				for(var n =0; n<checkedPrdPrice.length; n++){
				}
				
				
			}
		})
		//체크 된것만 계산할 때
		$(".proContent").each(function(i,obj){
			$("input:checkbox[name='chkAll']").click(function(){
				//console.log($("input:checkbox[name='chkAll']").eq(i).is(":checked"));
				
			})
		})
		
		
		//수량 카운트 작업
		var ProductCheckBox = $("input:checkbox[name='chkAll']").is(":checked"); //체크된 상품들
		if(ProductCheckBox == true){
			
		}
		
		
		//수량 카운트 작업,가격작업
		var count = $(".cartnum").val();
		var str = parseInt($(".productPrice").text());
		$("input:hidden[name='productPrice']").val(str);
		$(".prdsPrice").text(str);
		$(".prdplusdel").text(str+2500);
		$(".plus").click(function(){
			count++;
			$(".cartnum").val(count);
			$(".productPrice").text(str*count);
			if(count>10){
				alert("상품 한개당 10개 이하로만 주문 하실 수 있습니다.");
				$(".cartnum").val(10);
				$(".productPrice").text(10*str);
				return false;
			}
			var productPrice1 = parseInt($(".productPrice").text());
			$(".prdsPrice").text(productPrice1);
			$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
			$("input:hidden[name='productPrice']").val($(".productPrice").text());
			$(".prdplusdel").text(productPrice1+2500);
			return false;
		})
		$(".minus").click(function(){
			count--;
			$(".cartnum").val(count);
			$(".productPrice").text(str*count);
			if(	$(".cartnum").val()<=1){
				$(".cartnum").val(1);
				$(".productPrice").text(1*str);
				return false;
			}
			var productPrice1 = parseInt($(".productPrice").text());
			$(".prdsPrice").text(productPrice1);
			$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
			$("input:hidden[name='productPrice']").val($(".productPrice").text());
			$(".prdplusdel").text(productPrice1+2500);
			return false;
		})
		$("input:hidden[name='prdsPrice']").val($(".productPrice").text());
		
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