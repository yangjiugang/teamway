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
				dataType : 'json',
				data : ''
			};
			$.extend(config, $.extend(true, {}, defaultConfig, config));
			$.ajax({
				url: config.url,
				dataType: config.dataType,
				data: encodeURI(config.data),
				cache: false,
			  	success: function(msg){
			    	if (msg && msg["ajaxExceptionMsg"]) { // 处理ajax异常提示
						$.fc.alert({msg:msg["ajaxExceptionMsg"]});
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
		 * 		msg         提示的信息内容
		 * 		callBackFn  内容提示完后的回调函数
		 * }
		 ****************************************************************************/
		alert : function(options) {
			var id = "dialogAlert";
			
			var $divTitle = $("<div name=\"title\" style=\"background:url(images/tel-bg01.png) no-repeat left;height:52px;color:#FFF;line-height:52px;\"></div>");
			$divTitle.append("<h1 style=\"float:left;padding-left:21px;font-size:24px;\">系统提示</h1>");
			var $CancelBtn = $("<div style=\"float:right;padding-right:21px;\"><span style=\"cursor:pointer;\">[ 取消 ]</span></div>");
			$CancelBtn.find("span").click(function(){
				closeBox(id);
				$("#"+id).remove();
			});
			$divTitle.append($CancelBtn);
			
			var $divContent = $("<div style=\"background:#FFF;float:left;\"></div>");
			$divContent.append("<span style=\"float:left; margin:20px 15px;\"><img src=\"images/gan.png\" width=\"54\" height=\"57\" /></span>");
			$divContent.append("<p style=\"float:left;margin:20px 0 0 15px;line-height:20px;width:270px;\">" + options.msg + "</p>");
			var $divContentSpan = $("<span style=\"float:right;margin:15px 20px;\"></span>");
			var $contentOkBtn = $("<input type=\"image\" src=\"images/submit-que.gif\" style=\"margin-right:15px;\" />");
			$contentOkBtn.click(function(){
				if(options && options.callBackFn) {
					options.callBackFn();
				}
				closeBox(id);
				$("#"+id).remove();
			});
			$divContentSpan.append($contentOkBtn);
			$divContent.append($divContentSpan);
			
			var $div = $("<div id=\""+id+"\" style=\"width:380px;border:1px solid #3CA6D4;position:absolute;\"></div>");
			$div.append($divTitle);
			$div.append($divContent);
			
        	$("body").append($div);
			showBox(id);
			$contentOkBtn.focus();
		},
		/****************************************************************************
		 * 信息确认框confirm
		 * @param options {
		 * 		msg         提示的信息内容
		 * 		callBackFn  内容提示完后的回调函数
		 * }
		 ****************************************************************************/
		confirm : function(options) {
			var id = "dialogConfirm";
			
			var $divTitle = $("<div name=\"title\" style=\"background:url(images/tel-bg01.png) no-repeat left;height:52px;color:#FFF;line-height:52px;\"></div>");
			$divTitle.append("<h1 style=\"float:left;padding-left:21px;font-size:24px;\">系统提示</h1>");
			var $CancelBtn = $("<div style=\"float:right;padding-right:21px;\"><span style=\"cursor:pointer;\">[ 取消 ]</span></div>");
			$CancelBtn.find("span").click(function(){
				closeBox(id);
				$("#"+id).remove();
			});
			$divTitle.append($CancelBtn);
			
			var $divContent = $("<div style=\"background:#FFF;float:left;\"></div>");
			$divContent.append("<span style=\"float:left; margin:20px 15px;\"><img src=\"images/gan.png\" width=\"54\" height=\"57\" /></span>");
			$divContent.append("<p style=\"float:left;margin:20px 0 0 15px;line-height:20px;width:270px;\">" + options.msg + "</p>");
			var $divContentSpan = $("<span style=\"float:right;margin:15px 20px;\"></span>");
			var $contentOkBtn = $("<input type=\"image\" src=\"images/submit-que.gif\" style=\"margin-right:15px;\" />");
			$contentOkBtn.click(function(){
				if(options && options.callBackFn) {
					options.callBackFn();
				}
				closeBox(id);
				$("#"+id).remove();
			});
			var $contentCancelBtn = $("<input type=\"image\" src=\"images/submit-qu.gif\" width=\"50\" height=\"17\"/>");
			$contentCancelBtn.click(function(){
				closeBox(id);
				$("#"+id).remove();
			});
			$divContentSpan.append($contentOkBtn).append($contentCancelBtn);
			$divContent.append($divContentSpan);
			
			var $div = $("<div id=\""+id+"\" style=\"width:380px;border:1px solid #3CA6D4;position:absolute;\"></div>");
			$div.append($divTitle);
			$div.append($divContent);
			
        	$("body").append($div);
			showBox(id);
			$contentOkBtn.focus();
		},
		/****************************************************************************
		 * 获取鼠标位置的方法
		 * @param e 为event
		 ****************************************************************************/
		mousePos : function(e){
			var x,y;
			var e = e || window.event;		
			return {
				x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
				y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
			};
		}
		
	};

})(jQuery);

//common mail
function sendCommonEmail(listId,title,types){
	var rows=$("#"+listId+"").jqGrid('getGridParam','selarrrow');
	if(rows ==''){
		alert('请选中要发送邮件的记录');
		return;
	}else{
		parent.showFrame("发送邮件","editCommonMail?rows="+rows+"&title="+title+"&types="+types+"&listId="+listId,450,200);
	}
}
