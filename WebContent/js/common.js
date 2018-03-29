$(function(){
	$(".login_wrap>a").on("click",function(){
		$("#login_f").animate({
			top:"20px"
		},500);
		return false;
	})
	$(".login_wrap .login_close_btn,input[alt='로그인버튼']").on("click",function(){
		$("#login_f").animate({
			"top":"-500px"
		},500);
		return false;
	})
	$("#user_id, #user_pw").on("focus",function(){
		$(this).prev().css("left","-9999px");
	})
	$("#user_id","#user_pw").on("blur",function(){
		if($(this).val()==""){
			$(this).prev().css("left","2px");
		}
	})

	var base = 100;
	var mybody = $("body");
	$("#zoom a").on("click",function(){
		var zNum=$("#zoom a").index(this);
		
		if(zNum==0){
			base+=10;
		}else if(zNum==1){
			base=100;
		}else{
			base-=10;
		}
		mybody.css("overflow-x","auto").css("transform-orign","0 0").css("transform","scale("+base/100+")")
		.css("zoom",base+"%");
		
		return false;
	})

	$(".print_btn").on("click",function(){
		window.print();
		return false;
	})
	
	$("#keyword").on("focus",function(){
		$(this).css("background-position","0 -500px");
	}).on("blur",function(){
		if($(this).val()==""){
			$(this).css("background-position","0 0");
		}
	})
	
	
	var beforeEI;
	$("#gnb>li>a").on("mouseover focus",function(){
		if(beforeEI){
			beforeEI.children("img").attr("src",beforeEI.children("img").attr("src").replace("over.gif","out.gif"));
		}
		$("#gnb ul:visible").slideUp("fase");
		
		$("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
		$(this).next().stop().slideDown("normal")
		beforeEI=$(this);
	})
	$("#gnb").on("mouseleave",function(){
		$("#gnb ul:visible").slideUp("fast");
		if(beforeEI){
			beforeEI.children("img").attr("src",beforeEI.children("img").attr("src").replace("over.gif","out.gif"))
		}
	});
	
	$("#total_btn a").on("click",function(){
		$("#total_menu").slideDown("normal");
		$("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
		return false;
	})
	$("#total_close a").on("click",function(){
		$("#total_menu").slideUp("fast");
		$("#total_btn a img").attr("src",$("#total_btn a img").attr("src").replace("over.gif","out.gif"));
		return false;
	})
	
	var t = new Date();
	var y = t.getFullYear();
	var m = t.getMonth();
	var d = t.getDate();
	
	$("#date_wrap .year").text(y);
	$("#date_wrap .month").text(m+1);
	$("#date_wrap .date").text(d);
	
	$("form[name=rel_f]").on("submit",function(){
		var url=$("select",this).val();
		
		window.open(url);
		return false;
	})
	
	//quick
	
	var defaultTop = parseInt($("#quick_menu").css("top"));
	$(window).on("scroll",function(){
		var scv=$(window).scrollTop();
		$("#quick_menu").stop().animate({
			top:scv+defaultTop+"px"
		},1000)
	})
	
	
	
})



