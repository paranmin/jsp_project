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
