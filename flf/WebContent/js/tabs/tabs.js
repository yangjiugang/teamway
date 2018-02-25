(function($) {
	/* ******************************************************************
	 * 页签控件
	 * 参数options {
	 * 		width:"div内容的显示宽度"
	 * 	  	defCheck:"设置被选中的页签，为对应li的id",
	 *    	functions:"每个页签点击时要执行的函数"}
	 * ******************************************************************/
	$.fn.tabs = function(options) {
		/*$(this).css({"padding-top":"30px"});*/
		if(options && options.width)
			$(this).css({"width":options.width});
		$(this).find("ul").addClass("tabul");
		var liObj = $(this).find("ul li");
		liObj.click(function(){
			if(!$(this).hasClass("checked")) {
				liObj.removeClass("checked");
				$(this).addClass("checked");
				$(this).removeClass("mouseOver");
				if(options && options.functions)
					options.functions[$(this).attr("id")]();
				doDisplay();
			}
		});
		liObj.mouseover(function(){
			if(!$(this).hasClass("checked"))
				$(this).addClass("mouseOver");
		}).mouseout(function(){
			if(!$(this).hasClass("checked"))
				$(this).removeClass("mouseOver");
		});
		if(options && options.defCheck) // 默认选中页签
			liObj.each(function(){
				if($(this).attr("id") == options.defCheck)
					$(this).addClass("checked");
			});
		else
			$(this).find("ul li:first-child").addClass("checked");
		doDisplay();
		
		function doDisplay() { // 内容显示函数
			liObj.each(function(){
				if($(this).hasClass("checked"))
					$($(this).attr("id")).css("display", "");
				else
					$($(this).attr("id")).css("display", "none");
			});
		}
	};
	
})(jQuery);