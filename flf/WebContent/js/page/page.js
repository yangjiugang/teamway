(function($) {
	/**
	 * 分页组件
	 * @param options  Json格式的分页属性{curPage:当前页,pageSize:每页显示条数,pageCount:总页数,goPageCall:点击分页执行函数}
	 */
	$.fn.pager = function(options) {
		var obj = $(this);
		var defVal = $.fn.pager.defaults;
        $.extend({}, defVal, options);
        
        var curPage    = parseInt(options.curPage);   // 当前页数
        var pageSize   = parseInt(options.pageSize);  // 每页显示条数
        var pageCount  = parseInt(options.pageCount); // 总页数
        var goPageCall = options.goPageCall;          // 点击分页执行函数
        
        init();
        
        function init() { // 分页初始化
        	if(curPage < 1 || isNaN(curPage)) curPage = defVal.curPage;
	    	if(pageCount < 1 || isNaN(pageCount)) pageCount = defVal.pageCount;
	    	if(pageSize < 1 || isNaN(pageSize)) pageSize = defVal.pageSize;
	    	
        	obj.addClass("page");
        	var pageHtml = generatePageHtml();
        	bindMove(pageHtml);
        	bindClick(pageHtml);
        	obj.empty().append(pageHtml).append("<span>跳转：<input type=\"text\" class=\"Gotext\"/> 页&nbsp;<input type=\"image\" src=\"images/Go.jpg\" style=\"position:absolute;bottom:2px; _bottom:3px;\"/></span>");
        	obj.find("input:image").click(function(){
        		go(obj.find("input:text").val());
        	});
        	obj.find("input:text").keydown(function(e){
        		if(e.keyCode == 13)
        			go($(this).val());
        	});
        }
	    
	    function generatePageHtml() { // 生成分页的html代码
	    	var $pager = $("<ul></ul>");
	    	
	    	$pager.append(curPage == 1 ? "<li class=\"noPage\">&lt;</li>" : "<li>&lt;</li>");
	        if(pageCount <= 10) { // 10页或以下的直接全部显示
	        	loopLi(1, pageCount, $pager);
	        } else {
		        if(curPage < 6) {
		        	loopLi(1, 7, $pager);
		        	$pager.append("<li class=\"noBorder\">&hellip;</li>");
		        	$pager.append("<li>"+(pageCount-1)+"</li><li>"+pageCount+"</li>");
		        }
		        
		        if(curPage >= 6 && curPage <= pageCount - 5) {
		        	$pager.append("<li>1</li><li>2</li>");
		        	$pager.append("<li class=\"noBorder\">&hellip;</li>");
		        	loopLi(curPage - 2, curPage + 2, $pager);
		        	$pager.append("<li class=\"noBorder\">&hellip;</li>");
		        	$pager.append("<li>"+(pageCount-1)+"</li><li>"+pageCount+"</li>");
		        }
		        
		        if(curPage > pageCount - 5) {
		        	$pager.append("<li>1</li><li>2</li>");
		        	$pager.append("<li class=\"noBorder\">&hellip;</li>");
		        	loopLi(pageCount - 6, pageCount, $pager);
		        }
	        }
	        $pager.append(curPage == pageCount ? "<li class=\"noPage\">&gt;</li>" : "<li>&gt;</li>");
	    	
	        return $pager;
	    }
	    
	    function loopLi(start, end, $pager) { // 循环构造li
	    	for(var p = start; p <= end; p++) {
        		$btn = $("<li>"+p+"</li>");
		    	if(p == curPage)
		    		$btn.addClass("curPage");
		    	$btn.appendTo($pager);
        	}
	    }
	    
	    function bindMove($pager) { // 绑定移动（移到、移出）事件
	    	$pager.find("li").each(function() {
    			if(!$(this).hasClass("noBorder") && !$(this).hasClass("noPage") && !$(this).hasClass("curPage")){
    				$(this).mouseover(function(){
    					$(this).addClass("mouseOver");
    				}).mouseout(function(){
    					$(this).removeClass("mouseOver");
    				});
    			}
    		});
	    }
	    
	    function bindClick($pager) { // 绑定点击事件
	        $pager.find("li").click(function() {
    			if(!$(this).hasClass("noBorder") && !$(this).hasClass("noPage") && !$(this).hasClass("curPage")){
    				go($(this).text());
    			}
    		});
	    }
	    
	    function go(v) {// 执行处理函数
	    	var pageNum;
	    	switch (v) {
	            case "<":
	                pageNum = curPage - 1; // 上一页
	                break;
	            case ">":
	                pageNum = curPage + 1; // 下一页
	                break;
	            default:
	            	pageNum = parseInt(v); // 随机页
	            	break;
	        }
			
			if(!isNaN(pageNum) && pageNum >= 1 && pageNum <= pageCount && pageNum != curPage) {
				curPage = pageNum;
				init(); // 点击后重新初始化分页代码
				obj.find("input:text").val(curPage);
				goPageCall(curPage, pageSize);
			}
	    }
    };
	
	$.fn.miniPager = function(options) {
		var obj = $(this);
		var defVal = $.fn.pager.defaults;
        $.extend({}, defVal, options);
        
        var curPage    = parseInt(options.curPage);   // 当前页数
        var pageSize   = parseInt(options.pageSize);  // 每页显示条数
        var pageCount  = parseInt(options.pageCount); // 总页数
        var goPageCall = options.goPageCall;          // 点击分页执行函数
        
        init();
        
        function init() { // 分页初始化
        	if(curPage < 1 || isNaN(curPage)) curPage = defVal.curPage;
	    	if(pageCount < 1 || isNaN(pageCount)) pageCount = defVal.pageCount;
	    	if(pageSize < 1 || isNaN(pageSize)) pageSize = defVal.pageSize;
	    	
        	obj.addClass("page");
        	var $pager = $("<ul></ul>");
	    	$pager.append(curPage == 1 ? "<li class=\"noPage\">&lt;</li>" : "<li>&lt;</li>");
	        $pager.append("<li>" + curPage + "</li>");
	        $pager.append(curPage == pageCount ? "<li class=\"noPage\">&gt;</li>" : "<li>&gt;</li>");
			obj.empty().append($pager);
        	bindMove($pager);
        	bindClick($pager);
        }
	    
	    function bindMove($pager) { // 绑定移动（移到、移出）事件
	    	$pager.find("li").each(function() {
    			if(!$(this).hasClass("noPage") && ($(this).text() == "<" || $(this).text() == ">")){
    				$(this).mouseover(function(){
    					$(this).addClass("mouseOver");
    				}).mouseout(function(){
    					$(this).removeClass("mouseOver");
    				});
    			}
    		});
	    }
	    
	    function bindClick($pager) { // 绑定点击事件
	        $pager.find("li").click(function() {
    			if(!$(this).hasClass("noPage") && ($(this).text() == "<" || $(this).text() == ">")){
    				go($(this).text());
    			}
    		});
	    }
	    
	    function go(v) {// 执行处理函数
	    	switch (v) {
	            case "<":
	                curPage = curPage - 1; // 上一页
	                break;
	            case ">":
	                curPage = curPage + 1; // 下一页
	                break;
	        }
			init(); // 点击后重新初始化分页代码
			goPageCall(curPage, pageSize);
	    }
    };
    
    $.fn.pager.defaults = { // 默认值
        curPage   : 1,
        pageSize  : 10,
        pageCount : 1
    };
	
})(jQuery);