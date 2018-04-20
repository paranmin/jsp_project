$(function(){
		//배송비 작업
		var sumprice1 = parseInt($("input:hidden[name='prdsPrice']").val(priceSum1));
		if(sumprice1>35000){
			$(".allProPrice").html("<td colspan='6'><p>총 결제 금액:<spanclass='prdplusdel'></span>원</p></td>");
		}else if(sumprice1<35000){
			$(".allProPrice").html("<td colspan='6'><p>총 결제 금액:<span class='prdsPrice'></span>원+배송료"+
							"<span class='deliveryfee'>2500</span>원 = <span	class='prdplusdel'></span>원"+
							"<input type='hidden' name='prdsPrice'></p></td>");
		}
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
				var deliveryFee = parseInt($(".deliveryfee").text());
				$(".prdplusdel").text(priceSum2+deliveryFee); //상품+배송비
		})
		
		//수량 카운트 작업
			$(".plus").click(function(){
				var countPr = parseInt($(this).parent().next().find(".productPrice").data("price"));
				var prSum = parseInt($(this).parent().next().find(".productPrice").text());
				var totalPrdPrice = parseInt($(".prdsPrice").text());
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
				var delivery = parseInt($(".deliveryfee").text());
				$(".prdplusdel").text(total+delivery);
				return false;
			})
			
		
		$(".minus").click(function(){
			var countPr = parseInt($(this).parent().next().find(".productPrice").data("price"));
			var prSum = parseInt($(this).parent().next().find(".productPrice").text());
			var totalPrdPrice = parseInt($(".prdsPrice").text());
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
			var delivery = parseInt($(".deliveryfee").text());
			$(".prdplusdel").text(total+delivery);
			return false;
		})
		
	
		
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