(function($){
	/**
	 * 下拉控件
	 * @param options  Json格式的分页属性{
	 * 		defVal:没选择时的默认值,
	 * 		width:下拉层的宽度,
	 * 		selectId:初始选中的项的id,
	 * 		data:下拉选项内容,
	 * 		absolute:是否绝对定位,
	 * 		clickFn:单击选项时执行的函数
	 * }
	 */
	$.fn.htmlSelect = function(options){
		var defaultConfig = {
			width:$(this).width(),
			absolute:true
		};
		$.extend(options, $.extend(defaultConfig, options));
		
		var displayDiv = null; // 记录当前弹出的层
		var obj = $(this);
		var list = []; // 记录所有选项数组
		var $divLayer = createHTML();
		
		obj.val(options.defVal ? " " + options.defVal : "");
		obj.attr("autocomplete", "off");
		
		// 绑定input的焦点事件
		obj.focus(function(){
			$divLayer.show();
			displayDiv = $divLayer;
		});
		
		// 绑定选项li的单击事件
		$divLayer.find("li").click(function(){
			obj.val(" " + $(this).text());
			$("input:hidden[name="+obj.attr("id")+"]").val($(this).attr("id"));
			$divLayer.hide();
			
			if(options.clickFn) { // 单击后执行事件
				options.clickFn($(this).attr("id"));
			}
		}).mouseover(function(){
			$(this).css("background-color","#BB0E13");
		}).mouseout(function(){
			$(this).css("background-color","#FFF");
		});
		
		// 生成隐藏域记录选中项的id
		obj.attr("name", "_" + obj.attr("id"));
		obj.after($divLayer);
		var $hidden = $("<input type=\"hidden\" name=\""+obj.attr("id")+"\"/>");
		obj.after($hidden);
		if($divLayer.height() > 150){ // 超过高度自动显示滚动条
			$divLayer.find("ul").css({overflowY:"auto",overflowX:"hidden",height:"150px"});
		}
		
		// 通过坐标判断鼠标点击其它地方下拉框消失
		$(document).click(function(event){
			if(event.target.id != obj.attr("id") && displayDiv) {
				var x = event.clientX;
				var y = event.clientY;
				var divTop = displayDiv.offset().top;
				var divLeft = displayDiv.offset().left;
				var divWidth = displayDiv.width();
				var divHeight = displayDiv.height();
				if(x < divLeft || x > divLeft + divWidth || y < divTop || y > divTop + divHeight) {
					displayDiv.hide();
					displayDiv = null;
				}
			}
		});
		
		// 初始化选中的值
		if(typeof(options.selectId) !== 'undefined') {
			$hidden.val(options.selectId);
			if(list[options.selectId])
				obj.val(" " + list[options.selectId]);
			else // 没有json数据data是数组没有id的情况
				obj.val(" " + options.selectId);
		}
		
		/*
		 * 创建下拉列表的HTML
		 */
		function createHTML(){
			var $layer = $("<div class=\"menu\"></div>");
			// 设置下拉层的位置
			$layer.css("width", options.width);
			if(options.absolute) {
	            $layer.css("left", obj.offset().left);
	            $layer.css("top", obj.offset().top + obj.outerHeight());
			}
			
			var $layerUL = $("<ul></ul>");
			if(options.defVal) {
				var $li = $("<li>"+options.defVal+"</li>");
				$li.css("width", options.width);
				$layerUL.append($li);
			}
			$.each(options.data, function(i, m){
				var $li;
				if(typeof(m.id) !== 'undefined') {
					list[m.id] = m.text;
					$li = $("<li id=\""+m.id+"\">"+m.text+"</li>");
				} else { // 没有json数据data是数组没有id的情况
					$li = $("<li id=\""+m+"\">"+m+"</li>");
				}
				$li.css("width", options.width);
				$layerUL.append($li);
			});
			$layer.append($layerUL);
			return $layer;
		}
	}
	
})(jQuery);

