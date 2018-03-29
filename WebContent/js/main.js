$(function(){
	window.mySwipe=$("#mySwipe").Swipe({
		auto:3000,
		continuous:true,
		callback:function(index,element){
			$(".touch_bullet .active").attr("src",$(".touch_bullet .active")
					.attr("src").replace("on.png","off.png")).removeClass("active");
			$(".touch_bullet img").eq(index).attr("src",$(".touch_bullet img")
					.eq(index).attr("src").replace("off.png","on.png")).addClass("active");
		}
	}).data('Swipe');
	
	$(".touch_left_btn a").on("click",function(){
		mySwipe.prev();
		return false;
	})
	$(".touch_right_btn a").on("click",function(){
		mySwipe.next();
		return false;
	})
	$("#roll_banner_wrap dd").not(":first").hide();
	
	
	var onBtn = $("#roll_banner_wrap dt a:first");
	
	$("roll_banner_wrap dt a").on("click",function(){
		$("#roll_banner_wrap dd:visible").hide();
		$("img",onBtn).attr("src",
				$("img",onBtn).attr("src").replace("over.gif","out.gif"));
		
		var num=$("#roll_banner_wrap dt a").index(this);
		$("#roll_banner_wrap dd").eq(num).show();
		$("img",this).attr("src",
				$("img",this).attr("src").replace("out.gif","over.gif"));
		
		onBtn=$(this);
		return false;
	})
	
	$(".playBtn").on("click",function(){
		clearTimeout(auto1);
		auto1 = setTimeout(autoplay,1000);
		
		$("img",this).attr("src",
				$("img",this).attr("src").replace("off.gif","on.gif"));
		
		$(".stopBtn img").attr("src",
				$(".stopBtn img").attr("src").replace("on.gif","off.gif"));
		
		return false;
	})
	
	$(".stopBtn").on("click",function(){
		clearTimeout(auto1);
		
		$("img",this).attr("src",
				$("img",this).attr("src").replace("off.gif","on.gif"));
		
		$(".playBtn img").attr("src",
				$(".playBtn img").attr("src").replace("on.gif","off.gif"));
		return false;
	})
	
	var btnNum=0;
	function autoPlay(){
		btnNum++;
		if(btnNum>=4){
			btnNum=0;
		}
		
		$("#roll_banner_wrap dt a").eq(btnNum).trigger("click");
		
		auto1 = setTimeout(autoPlay,4000);
	}
	
	var auto1 = setTimeout(autoPlay,3000);
			
	
	var onTab=$("#tabmenu dt a:first");
	
	$("#tabmenu dt a").on("mouseover focus click",function(){
		$("#tabmenu dd:visible").hide();
		
		$("img",onTab).attr("src",$("img",onTab).attr("src").replace("over.gif","out.gif"));
		
		$(this).parent().next().show();
		
		$("img",this).attr("src",$("img",this).attr("src").replace("out.gif","over.gif"));
		
		onTab=$(this);
		return false;
	})
	
	var mySlider = $("#best_bg ul").bxSlider({
		mode:"horizontal",
		speed:500,
		pager:false,
		moveSlides:1,
		slideWidth:125,
		minSlides:5,
		maxSlides:5,
		slideMargin:30,
		auto:true,
		autoHover:true,
		controls:false
	})
	
	$(".prev_btn").on("click",function(){
		mySlider.goToPrevSlide();
		return false;
	});
	
	$(".next_btn").on("click",function(){
		mySlider.goToNextSlide();
		return false;
	});
	
	
	//coockie
	
	if($.cookie("pop")!="no")
		$("#pop_wrap").show();
	
	$("#pop_wrap").css("cusor","move").draggable();
	$("#pop_wrap area:eq(0)").on("click",function(){
		$("#pop_wrap").fadeOut("fast");
		return false;
	})
	
	$("#pop_wrap area:eq(1)").on("click",function(){
		$.cookie("pop","no",{expires:1});
		$("#pop_wrap").fadeOut("fast");
		return false;
	})
	
})
