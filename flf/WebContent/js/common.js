/**
 * @author lufoz 2012-1-11
 */
(function($) {
	
	$.fc = {
		
		/***************************************************************************
		 * ajax请求的方法
		 * config为json格式参数，{
		 * 		url:"请求链接",
		 * 		dataType:"数据类型",
		 * 		data:"提交的数据",
		 * 		callBackFn:"成功后执行的回调函数"
		 * }
		 **************************************************************************/
		ajaxSubmit : function(config) {
			var defaultConfig = {
				type: "POST",
				dataType : 'json'
			};
			$.extend(config, $.extend(true, {}, defaultConfig, config));
			$.ajax({
				url: config.url,
				dataType: config.dataType,
				data: encodeURI(config.data),
				async: false,
			  	success: function(msg){
			  		var errMsg = msg["ajaxExceptionMsg"];
			    	if (errMsg) { // 处理ajax异常提示
						$.fc.alert(errMsg);
					} else {
						if ($.isFunction(config.callBackFn)) {
							config.callBackFn(msg);
						}
					}
			  	},
			  	error: function(jqXHR){ // 跳到错误页面
			  		window.location.href = "err";
			  	}
			});
		},
		/****************************************************************************
		 * 信息提示框alert
		 * @param options {
		 * 		title       标题
		 * 		msg         提示的信息内容
		 * 		callBackFn  内容提示完后的回调函数
		 * }
		 ****************************************************************************/
		alert : function(options) {
			var id = "dialogAlert";
			var $div = $("<div></div>");
			$div.append("<h3>" + options && options.title ? options.title : "系统提示" + "</h3>");
			$div.append("<font>" + options.msg + "</font>");
			var $OkBtn = $("<input type=\"image\" src=\"images/qudingBut.jpg\" />");
			$OkBtn.click(function(){
				if(options && options.callBackFn) {
					options.callBackFn();
				}
				closeBox(id);
				$("#"+id).remove();
			});
			$div.append($OkBtn);
			var $divP = $("<div id=\""+id+"\" class=\"dialogMsg\"></div>");
			$divP.append($div);
        	$("body").append($divP);
			showBox(id);  		
		},
		/****************************************************************************
		 * 信息确认框confirm
		 * @param options {
		 * 		title       标题
		 * 		msg         提示的信息内容
		 * 		callBackFn  内容提示完后的回调函数
		 * }
		 ****************************************************************************/
		confirm : function(options) {
			var id = "dialogConfirm";
			var $div = $("<div></div>");
			$div.append("<h3>" + options && options.title ? options.title : "系统提示" + "</h3>");
			$div.append("<font>" + options.msg + "</font>");
			var $OkBtn = $("<input type=\"image\" src=\"images/queding.jpg\" style=\"margin-right:10px;\" />");
			var $CancelBtn = $("<input type=\"image\" src=\"images/quxiao1.jpg\" />");
			$OkBtn.click(function(){
				if(options && options.callBackFn) {
					options.callBackFn();
				}
				closeBox(id);
				$("#"+id).remove();
			});
			$CancelBtn.click(function(){
				closeBox(id);
				$("#"+id).remove();
			});
			$div.append($OkBtn).append($CancelBtn);
			var $divP = $("<div id=\""+id+"\" class=\"dialogMsg\"></div>");
			$divP.append($div);
        	$("body").append($divP);
			showBox(id);  		
		}
		
	};

})(jQuery);
