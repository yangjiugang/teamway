(function($){
	/**
	 * 分页组件
	 * @param options  Json格式的分页属性{pageSize:每页显示条数,pageCount:总页数,goPageCall:点击分页执行函数}
	 */
	$.fn.LayerSort = function(options){
		var temp=$(this);	
		var obj = "";		//<ul><li>
		
		var defaults = {
			inputTXT:"",
			fDiv:"",
			data : [],	//要创建的li 如果 {"中国","美国","韩国"}
			selected: -1,		//默认选中的行    
			width : 0,
			showScorll : "false",
			height : 0,
			color : ""
		};
		var inputDiv=$(options.inputTXT);
		
		$.extend({},defaults, options);
		
		init();
		
		function init(){
			
			initList();
			if(options.fDiv!=null){
				$(options.fDiv).append(obj);
			}else{
				temp.after(obj);
			}
			selected();
		}
		
		function initList(){
			obj=createHTML();
			bindClick(obj);
		}
		
		function selected(){
			if(options.selected!=-1 && options.selected<options.data.length){
				inputDiv.val(options.data[options.selected-1]);
				inputDiv.attr({ name:options.selected+1});
			}
		}
		
		function setWidth($layer){
			if(options.width!=null && options.width>0){
				$layer.css({ width:options.width+"px" });
			}
		}
		
		function setHeight($layer){
			if(options.height!=null && options.height>0){
				$layer.css({ height:options.height+"px" });
			}
		}
		
		function setScorll(){
			if(options.showScorll=="true"){
				obj.css({ overflow : "scroll" });
			}
		}
		
		function bindMouseOver($layer){
			$layer.find("li").mouseover(function(){
				if(options.fDiv!=null)
					setWidth($layer);
				$(this).css( {background : options.color} );
			});
		}
		
		function bindMouseOut($layer){
			$layer.find("li").mouseout(function(){
				if(options.fDiv!=null)
					setWidth($(options.fDiv));
				$(this).css( {background : "#FFF" } );
			});
		}
		
		function bindInputClick($input,$div){
			$input.click(function(){
//				$div.css({top:$input.css("top") });
//				$div.css({left:$input.css("left") });;
				if($div.css("display")=="block"){
					$div.hide();
				}else{
					$div.show();
				}
			});
		}
		/*
		 * 创建下拉列表的HTML
		 */
		function createHTML(){
			var $layer=$("<ul></ul>");
			setWidth($layer);
			setHeight($layer);
			if(options.showScorll=="true"){
					$layer.css({ overflowY:"auto",overflowX:"hidden",height:"150px"});
			}
			
			if(options.data!=null && options.data.length >0){
				for (var i = 0; i < options.data.length; i++){
					var liHtml=$("<li>"+options.data[i]+"</li>");
					$layer.append(liHtml);
				};
			}
			return $layer;
		}
		
		/*
		 * 隐藏或显示 父级DIV
		 */
		function showAndHide(types){
			if(obj!=null){
				if (options.fDiv == null) {
					switch (types) {
						case "show":
							obj.show();
							break;
						case "hide":
							obj.hide();
							break;
						default:
							obj.hide();
							break;
					}
				}else{
					switch (types) {
						case "show":
							$(options.fDiv).show();
							break;
						case "hide":
							$(options.fDiv).hide();
							break;
						default:
							$(options.fDiv).hide();
							break;
					}
				}
			}
		}
		
		/*
		 * <Li>单击事件
		 */
		function bindClick($layer){
			if($layer!=null){
					$layer.find("li").click(function(){
						if (inputDiv!= null) {
							inputDiv.val($(this).text());
							inputDiv.attr({ name:$(this).index()+1});
							showAndHide("hide");
						}
					})
			}
		}
	}
	
	
	
})(jQuery);

