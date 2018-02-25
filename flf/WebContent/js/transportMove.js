var transportNum = 0; // 记录本页面中总共多少个transportMove，用这个值关联div与li的对应关系

(function($){
    $.fn.transportMove = function(options){
        transportNum++;
        
        var speed = 35; // 移动速度
        var myInterval = 0; // 记录定时功能
        var sleepTime = 0; // 最后一个点的定时
        var curPointLiId = transportNum + "li0"; // 记录当前运行的节点的li id
        var prevPointLiId; // 上一节点
        var nextPointMove = true; // 下一节点是否移动
        var mouseMove = false;
        var widthSJ = 30; // 两端缩进的宽度
        var widthT = $(this).width(); // div总宽度
        var len = options.transports.length; // 节点个数
        var widthWork = widthT - widthSJ * 2 - 15; // li图片的宽度是15
        var width = widthT - widthSJ * 2 - (len + 1) * 15; // 剩余放节点的宽度
        var widthEach = width / len; // 中间每一段的宽度
        var widthDiv = widthEach + 15;
        var widthTextMove = (widthT - $("#textSpan" + transportNum).width()) / len; // 文字层每次移动的宽度
        var $contentDiv = $("<div style=\"position:absolute;width:" + widthWork + "px;bottom:11px;left:37px;_bottom:8px;\"></div>");
        var $contentUL = $("<ul></ul>");
        $contentUL.append(generateLI(0, widthSJ));
        $.each(options.transports, function(i, o){
            var divId = transportNum + "transport" + i;
            var imgId = transportNum + "img" + i;
            
            var $childDiv = $("<div id=\"" + divId + "\" style=\"overflow:hidden;float:left;width:" + widthDiv + "px\"></div>");
            var $image = $("<img id=\"" + imgId + "\" src=\"images/" + o + ".png\" style=\"margin-left:" + widthDiv + "px;margin-right:" + widthDiv + "px;\">");
            
            $childDiv.append($image);
            $contentDiv.append($childDiv);
            
            if (i != 0) 
                $contentUL.append(generateLI(i, widthEach));
        });
        $contentUL.append(generateLI(len, widthEach));
        $(this).append($contentDiv).append($contentUL);
        
        $("#textSpan"+transportNum).mouseover(function(){ // 绑定内容层的鼠标移动事件
			nextPointMove = false;
			mouseMove = true;
		}).mouseout(function(){
			nextPointMove = true;
			startPoint();
		});
		
		setTimeout(init, 200); // 由于动态插入的图片未加载完时取不到宽度，所以停顿一下再运行下面的代码
        
        function init() {
        	$contentDiv.find("div").each(function(){ // 初始化所有img的位置
	            $(this).scrollLeft($(this).width() + $(this).find("img").width());
	        });
	        startPoint(); // 刚进入页面从第一个点开始运行
        }
        
        function generateLI(n, widthLi){ // n表示为第几个li
            var liId = transportNum + "li" + n;
            var $objLI = $("<li id=\"" + liId + "\" style=\"margin-left:" + widthLi + "px;\"></li>");
            $objLI.addClass("quanB");
            var flag = true; // 由于fadeOut很慢，当在一个点移动多次的时候nextPointMove=false;所以先让fadeOut执行完后才能执行else的nextPointMove=false;
            $objLI.mouseover(function(){
					if($(this).attr("id") != curPointLiId) { // 当前点不能重复移动
						prevPointLiId = curPointLiId;
						curPointLiId = $(this).attr("id");
						if(sleepTime > 0) { // 表示上一个点是最后一个点
							startPoint();
						} else if(myInterval != 0) { // 表示上个节点还没运行完
							flag = false;
							var liIds = prevPointLiId.split("li");
							$("#" + liIds[0] + "img" + liIds[1]).fadeOut("slow", function(){ // 交通工具消失后再停止计时器
								$(this).fadeIn(50); // 交通工具消失后必须必须重显不然被display:none
								clearInterval(myInterval);
								myInterval = 0;
								startPoint();
								flag = true;
							});
						}
					} else { // 移动到当前点的时候
						if(flag) {
							nextPointMove = false;
							mouseMove = true;
						}
					}
			}).mouseout(function(){
				if($(this).attr("id") == prevPointLiId) { // 当前点不能重复移动
					nextPointMove = true;
					startPoint();
				}
			});
            return $objLI;
        }
        
        function startPoint(){ // 参数liId表示为触发的那个节点的Id
        	if(nextPointMove && !mouseMove) {
	            $("#" + prevPointLiId).removeClass("quanH").addClass("quanB");
	            var liIds = curPointLiId.split("li");
	            var liObj = $("#" + curPointLiId); // li对象
	            var divObj = $("#" + liIds[0] + "transport" + liIds[1]); // 配套节点的div对象
	            var imgObj = $("#" + liIds[0] + "img" + liIds[1]); // 配套节点的image对象
	            if (liObj.hasClass("quanB")) {
	                liObj.removeClass("quanB");
	                liObj.addClass("quanH");
	            }
	            var scrollLeftWidth = divObj.width() + imgObj.width();
	            divObj.scrollLeft(scrollLeftWidth); // 移动滚动条，隐藏图片
            	
            	if(sleepTime > 0) {
	            	clearTimeout(sleepTime);
	            	sleepTime = 0;
	            }
	            contentDivMove(liIds[0], liIds[1]);
	            if (liIds[1] == len && sleepTime == 0) { // 表示最后一个点
	                sleepTime = setTimeout(_startPoint(liIds[0]), 4000);
	            } else if(myInterval == 0) {
	                myInterval = setInterval(_marqueeRight(divObj, liIds[0], liIds[1]), speed);
	            }
            }
        }
        
        //文字层的移动
        function contentDivMove(beforeNum, afterNum){
            $("#textSpan" + beforeNum).css({left: afterNum * widthTextMove}); // 移动文字层的位置
            $("#textSpan" + beforeNum + ">p").html(options.content[afterNum]); // 改变文字层的内容
        }
        
        function marqueeRight(divObj, beforeNum, afterNum){ // 向右移动
            if (divObj.scrollLeft() == 0) {
                clearInterval(myInterval);
                myInterval = 0;
                if(mouseMove) mouseMove = false; // 一个点运行结束，鼠标移动标识设置为false
                
                prevPointLiId = curPointLiId;
                var nextAfterNum = parseInt(afterNum) + 1;
            	var nextPoint = nextAfterNum >= len + 1 ? 0 : nextAfterNum;
            	curPointLiId = beforeNum + "li" + nextPoint;
                startPoint(); // 下一节点移动							
            }
            else 
                divObj.scrollLeft(divObj.scrollLeft() - 1);
        }
        
        function _startPoint(beforeNum){
            return function(){
            	if(mouseMove) mouseMove = false; // 一个点运行结束，鼠标移动标识设置为false
            	prevPointLiId = curPointLiId;
            	curPointLiId = beforeNum + "li0";
                startPoint();
            };
        }
        
        function _marqueeRight(_divObj, _beforeNum, _afterNum){ // 由于setInterval函数不能调用传参数的函数，所以封装该方法
            return function(){
                marqueeRight(_divObj, _beforeNum, _afterNum);
            };
        }
    };
})(jQuery);
