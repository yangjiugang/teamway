$.extend({
	/**
	 * 生成多选弹出层
	 * @param id      文本框的id
	 * @param defVal  文本框显示的默认值
	 * @param obj     Json格式的多选弹出层内容{
	 * 		titleImg:"弹出层标题图片",
	 *  	width:"弹出层宽度",
	 *  	datas:"选项内容",
	 * 		selectIds:初始选中的项的id
	 * }
	 */
	multiSelect:function(id, defVal, obj){
		var thisObj = $("#"+id);
		thisObj.val(defVal);
		thisObj.click(function(){
			showBox(""+id+"Div");
		});
		
		var datas = obj.datas;
		var allObj; // 全选按钮对象
		var bolAll = false; // 是否全选了
		var list = []; // 记录所有选项数组
		var checkedList = []; // 记录选中的项数组
		if(obj.selectIds) {
			checkedList = obj.selectIds;
		}
		var $divObj = generateDiv();
    	$(document.body).append($divObj);
		thisObj.attr("name", "_" + id);
    	var $hidden = $("<input type=\"hidden\" name=\""+id+"\"/>");
		thisObj.after($hidden);
    	
    	function generateDiv(){ // 生成div
	    	var $div = $("<div class=\"tanchu\" id=\""+id+"Div\" style=\"width:"+obj.width+"px;\"></div>");
	    	var $title = $("<div name=\"title\" class=\"tanchus\"></div>");
			var $title1 = $("<div class=\"tanchu-tel\" style=\"width:"+(obj.width-16)+"px;\"><img src=\""+obj.titleImg+"\" /></div>");
			var $queding = $("<span>[ 确定 ]</span>");
	    	$queding.click(function(){
	    		closeBox(id+"Div");
	    	});
			$title1.append($queding);
			allObj = $("<span>[ 全选 ]</span>");
			$title1.append(allObj);
			$title.append($title1).append("<div class=\"tanchu-tel-right\"></div>");
	    	$div.append($title);
	    	var $divList = $("<div class=\"tanchu-cos\" style=\"width:"+(obj.width-1)+"px;\"></div>");
	    	$.each(datas, function(i, m){
				var $dl = $("<dl style=\"width:"+(obj.width-17)+"px;\"></dl>");
	    		$dl.append("<dt>"+m.title+"</dt>");
				var $dd = $("<dd></dd>");
	    		$.each(m.options, function(j, n){
	    			list[n.id] = n.text;
	    			var $span = $("<span id=\""+n.id+"\">"+n.text+"</span>");
					$span.mouseover(function(){ // 选项的移动事件
						if(!$span.hasClass("selectstyle")) {
							$span.addClass("movestyle");
						}
					}).mouseout(function(){
						if($span.hasClass("movestyle")) {
							$span.removeClass("movestyle");
						}
					});
	    			if ($.inArray(n.id, checkedList) > -1) {
	    				$span.addClass("selectstyle");
	    			};
	    			$dd.append($span);
	    		});
				$dl.append($dd);
	    		$divList.append($dl);
	    	});
	    	$div.append($divList);
			var $divBottom = $("<div class=\"tanchu-bottom\"></div>");
			$divBottom.append("<div class=\"tanchu-bottom-left\"><img src=\"images/bottom-leftbg.png\" /></div>");
			$divBottom.append("<div class=\"tanchu-bottom-con\" style=\"width:"+(obj.width-33)+"px;\"></div>");
			$divBottom.append("<div class=\"tanchu-bottom-right\"><img src=\"images/rightjiao-bg.png\" /></div>");
			$div.append($divBottom);
	    	return $div;
    	}
		
		var options = $divObj.find("dl span"); // 所有选项对象
		if(obj.selectIds) {
			handleResult();
			checkIfAll();
		}
    	options.click(function(){ // 绑定选项的点击事件
			$(this).toggleClass("selectstyle");
			// 设置文本框的值
			var seledId = $(this).attr("id");
			if($(this).hasClass("selectstyle")) {
				checkedList.push(seledId); // 添加选中的值
			} else {
				checkedList.splice($.inArray(seledId,checkedList),1); // 删除取消的值
			}
			handleResult();
			checkIfAll();
		});
		
		allObj.click(function(){ // 绑定全选按钮的单击事件
			checkedList = []; // 不管是全选还是全不选都清空数组
			if(bolAll) { // 全不选
				options.removeClass("selectstyle");
			} else { // 全选
				options.addClass("selectstyle");
				// 设置全选中后的值
				$.each(datas, function(i, m){
		    		$.each(m.options, function(j, n){
		    			checkedList.push(n.id);
		    		});
		    	});
			}
			handleResult();
			bolAll = !bolAll;
		});
		
		function checkIfAll(){ // 检查是否为全选
			var flag = true;
			options.each(function(i){ // 循环检查每一个选项
				if(!$(this).hasClass("selectstyle")){
					flag = false;
					return false;
				}
			});
			if(flag) bolAll = true;
			else bolAll = false;
		}
		
		function handleResult(){
    		var v = "";
			var value = "";
			$.each(checkedList, function(i, e){
				v += (i==0?"":"+") + list[e];
				value += (i==0?"":",") + e;
			});
			$hidden.val(value);
			v = (v==""?defVal:v); // 文本框显示内容
			thisObj.val(v);
			thisObj.attr("title", v); // 鼠标移到时显示文本内容（内容太长时）
    	}
    } 
});