<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<link href="js/page/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/page/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/JavaScript" src="js/map.js"></script>

<script type="text/javascript">  
    var time=${questionTest.testDuration };  //答题时长
    var leftTime = time*60;  
    function showLeftTime(){  
        var leftHours=parseInt(leftTime/(60 * 60));
		var leftMinutes = parseInt(leftTime/(60)); 
		if(leftMinutes>=60){
		   leftMinutes=parseInt(leftMinutes%60);
		}
        var leftSeconds =parseInt(leftTime%60); 	       
        if(leftTime < 0){  
        	handExamPaper();
           // clearInterval(timer);  
           // document.location.href = document.location.href;  
        }else{  
            document.getElementById('leftTime').innerHTML = '总剩余时间：'+leftHours+'时'+leftMinutes+'分'+leftSeconds+'秒';  
            document.getElementById('leftTime1').innerHTML = '总剩余时间：'+leftHours+'时'+leftMinutes+'分'+leftSeconds+'秒';
            //$("#leftTime").append('总剩余时间：'+leftHours+'时'+leftMinutes+'分'+leftSeconds+'秒');
            //$("#leftTime1").append('总剩余时间：'+leftHours+'时'+leftMinutes+'分'+leftSeconds+'秒');
        }  
        leftTime--;  
    }  
    var timer = setInterval('showLeftTime()',1000);  
  </script> 
 
  <script type="text/javascript">
    //得到单选框值
    function values(name){
    	var d=name.lastIndexOf(",");
    	var id=name.substring(d+1);   //题目的id号
    	var _value = $("input[@type=radio][name='"+name+"'][checked]").val();  //调查对象的答案
    	if(undefined!=_value){
    		getSbumitAnswer(id,_value);
    	}
    	
    }
    // 复选框的值
    function jqchk(test){  //jquery获取复选框值  
      var d=test.lastIndexOf(",");
      var id=test.substring(d+1);   //题目的id号
      var chk_value =[];  
      var _input="input[name='"+test+"']:checked"; 
      $(_input).each(function(){  
       chk_value.push($(this).val());  
      });  
    //  alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);    //调查对象的答案
      if(chk_value.length!=0){
  		getSbumitAnswer(id,chk_value);	
  	  }
    }  
  
  </script> 
   
   <script type="text/javascript">
     var type=${questionTest.testAnswer };  //答题方式
   //  var type=1;
     var page = 1;
     var num = 1;
     var num2 = 1;
     var num3 = 1;
     var radioSubject="";
	 var moreSubject="";
	 var answerSubject="";
	 var a=0;
	 var b=0;
	 var c=0;
     $(document).ready(function(){
    	 if(type==0){
    		 $("#test1").css("display","block");
    		 $("#test2").css("display",'none');
    		 getAjax(1,page,1);
    	 }else if(type==1){
    		 $("#test2").css("display","block");
    		 $("#test1").css("display",'none');
    		 getAjax2(1,page,5);
    	 }
     
     });
     
     function getPager(paging,g){
    	 if(g==1){
    		// getInputValue();
    		 switch (paging){
	      	   case '-':
	      		   page--;
	      		  if(page==0){
	      			  page=1;
	      			  alert("已经是第一题了！");
	      		  }else{
	      			  num--;
		      		  if(num==0){
		      			  num=1;
		      		  }
		      		  getAjax(1,page,g);  
	      		  }
	      	      break;
	      	   case '+':
	      		   page++;
	      		   num++;
	      		   getAjax(1,page,g);
	      		  break;
	      	 }
    	}else{
    		radioSubject="";
    	    moreSubject="";
    		answerSubject="";
    		switch (paging){
	      	   case '-':
	      		   page--;
	      		  if(page==0){
	      			  page=1;
	      			  alert("已经是第一页了！");
	      		  }else{
	      			  num=num-a-5;
		      		  num2=num2-b-5;
		      	 	  num3=num3-c-5;
		      		  if(num<=0){
		      			  num=1;
		      		  }
		      		  if(num2<=0){
		      			  num2=1;
		      		  }
		      		  if(num3<=0){
		      			  num3=1;
		      		  }
		      		  getAjax2(1,page,g);
		      		  a=0;
		      		  b=0;
		      		  c=0;  
	      		  }
	      	      break;
	      	   case '+':
	      		   page++;
	      		   getAjax2(1,page,g);
	      		  a=0;
	      		  b=0;
	      		  c=0;
	      		  break;
	      	 }
    	}
    	 
    	 
     }
     
    function gclick(nac){
    	var gna="input[name='"+nac+"']";
    	var type1 = $(gna)[0].type;
    	var na = $(gna)[0].name;
    	switch (type1){
 	     case 'radio':   //单选题
 	    	values(na);	
 	      break;
 	     case 'checkbox':   //多选题
 	    	jqchk(na);
  	      break;
    	}
    }
    
    function gblur(na){
    	var name="input[name='"+na+"']";
    	var text=$(name).val();
    	var d=na.lastIndexOf(",");
    	var id=na.substring(d+1);   //题目的id号
    	if(text!=""){
    		getSbumitAnswer(id,text);	
    	}
    }
     
     var map = new Map();
		map.put(1, 'a');
		map.put(2, 'b');
		map.put(3, 'c');
		map.put(4, 'd');
		map.put(5, 'e');
		map.put(6, 'f');
		map.put(7, 'g');
		map.put(8, 'h');
		map.put(9, 'i');
     
     function getTest(length,isA,context,id,correctA){
    	 var answer="";
    	 if(isA==1){
    		 if(context!=null){
    			 if(correctA!=null&&correctA==context){
    				 answer="<dd><input name='answer,"+id+"' type='radio' onclick=\"gclick('answer,"+id+"')\" value='"+context+"' checked='checked'/>"+map.get(length)+"."+context+"</dd>";
    			 }else{
    			    answer="<dd><input name='answer,"+id+"' type='radio' onclick=\"gclick('answer,"+id+"')\" value='"+context+"'/>"+map.get(length)+"."+context+"</dd>";
    			 }
    		 }
    	 }else if(isA==2){
    		 if(context!=null){
    			 if(correctA!=null){
    			 var ca=correctA.split(",") ;
    			 for(var i=0;i<ca.length;i++){
    				 if(ca[i]!=null&&ca[i]==context){
        				 answer="<dd><input type='checkbox' onclick=\"gclick('answer,"+id+"')\"  name='answer,"+id+"' value='"+context+"' checked='checked'/>"+map.get(length)+"."+context+"</dd>";
        				 break;
        			 }else{
        		     answer="<dd><input type='checkbox' onclick=\"gclick('answer,"+id+"')\"  name='answer,"+id+"' value='"+context+"' />"+map.get(length)+"."+context+"</dd>";
        			 }	 
    			 }
    			}else{
    				answer="<dd><input type='checkbox' onclick=\"gclick('answer,"+id+"')\"  name='answer,"+id+"' value='"+context+"' />"+map.get(length)+"."+context+"</dd>";
    			}
    		 }
    	 }
    	 return answer;
     }
     var paperId=${questionTest.paperId};
     var testId=${questionTest.testId};
     function getAjax2(id,p,r){
    	  	 $.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/broker_getPaper',
				dataType:'json',
				data:"paperId="+paperId+"&page="+p+"&rows="+r+"&testId="+testId,
				callBackFn:function(msg){
					if (msg.datas.length!=0) {
						$("#radioSubject2").empty();
						$("#moreSubject2").empty();
						$("#answerSubject2").empty();
						for(var i=0;i<msg.datas.length;i++){
							var questionType=msg.datas[i].questionType;
							if(questionType==1){
								radioSubject+="<dl><dt>"+num+". "+msg.datas[i].questionContent+"【"+msg.datas[i].questionPoints+"分】</dt>"
		    				    +getTest(1,1,msg.datas[i].answer,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(2,1,msg.datas[i].answer2,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(3,1,msg.datas[i].answer3,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(4,1,msg.datas[i].answer4,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(5,1,msg.datas[i].answer5,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(6,1,msg.datas[i].answer6,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(7,1,msg.datas[i].answer7,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(8,1,msg.datas[i].answer8,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(9,1,msg.datas[i].answer9,msg.datas[i].questionId,msg.datas[i].correctAnswer)+"</dl>";
		    		            num++;
		    		            a=a+1;
							}else if(questionType==2){
								moreSubject+="<dl><dt>"+num2+". "+msg.datas[i].questionContent+"【"+msg.datas[i].questionPoints+"分】</dt>"
		    				    +getTest(1,2,msg.datas[i].answer,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(2,2,msg.datas[i].answer2,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(3,2,msg.datas[i].answer3,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(4,2,msg.datas[i].answer4,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(5,2,msg.datas[i].answer5,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(6,2,msg.datas[i].answer6,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(7,2,msg.datas[i].answer7,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(8,2,msg.datas[i].answer8,msg.datas[i].questionId,msg.datas[i].correctAnswer)
		    		            +getTest(9,2,msg.datas[i].answer9,msg.datas[i].questionId,msg.datas[i].correctAnswer)+"</dl>"
		    		            num2++;
		    		            b=b+1;
							}else if(questionType==3){
								if(msg.datas[i].correctAnswer!=null){
									answerSubject+= "<dl><dt>"+num3+". "+msg.datas[i].questionContent+"【"+msg.datas[i].questionPoints+"分】</dt>"
				                    +"<dd>答案：<input type='text' name='answer,"+msg.datas[i].questionId+"' onblur=\"gblur('answer,"+msg.datas[i].questionId+"')\" value='"+msg.datas[i].correctAnswer+"'/></dd></dl>"
								}else{
									answerSubject+= "<dl><dt>"+num3+". "+msg.datas[i].questionContent+"【"+msg.datas[i].questionPoints+"分】</dt>"
				                    +"<dd>答案：<input type='text' name='answer,"+msg.datas[i].questionId+"' onblur=\"gblur('answer,"+msg.datas[i].questionId+"')\" value=''/></dd></dl>"
								}
								
		    				    num3++;
		    				    c=c+1;
							}
						}
						if (radioSubject!="") {
							$("#radioSubject1").css("display","block");
							$("#radioSubject2").append(radioSubject);
						}else{
							$("#radioSubject1").css("display",'none');
						}
						
						if (moreSubject!="") {
							$("#moreSubject1").css("display","block");
							$("#moreSubject2").append(moreSubject);
						}else{
							$("#moreSubject1").css("display",'none');
						}
						
						if (answerSubject!="") {
							$("#answerSubject1").css("display","block");
							$("#answerSubject2").append(answerSubject);
						}else{
							$("#answerSubject1").css("display",'none');
						} 
						
					} else {
						page--;
                        alert("已经是最后一页了！");
					}
				}
				});
     } 
     
     function getAjax(id,p,r){
    	 $.fc.ajaxSubmit({
				url:'${pageContext.request.contextPath}/broker_getPaper',
				dataType:'json',
				data:"paperId="+paperId+"&page="+p+"&rows="+r+"&testId="+testId,
				callBackFn:function(msg){
					if (msg.datas.length!=0) {
						$("#subject").empty();
						var questionType=msg.datas[0].questionType;
						switch (questionType){
				    	   case 1:   //单选题
				    		  $("#subject").append(
				    				     "<dt>"+num+". "+msg.datas[0].questionContent+"【"+msg.datas[0].questionPoints+"分】</dt>"
				    				    +getTest(1,1,msg.datas[0].answer,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(2,1,msg.datas[0].answer2,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(3,1,msg.datas[0].answer3,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(4,1,msg.datas[0].answer4,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(5,1,msg.datas[0].answer5,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(6,1,msg.datas[0].answer6,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(7,1,msg.datas[0].answer7,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(8,1,msg.datas[0].answer8,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(9,1,msg.datas[0].answer9,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		  );
				    	      break;
				    	   case 2:  //多选题
				    		   $("#subject").append(
				    				     "<dt>"+num+". "+msg.datas[0].questionContent+"【"+msg.datas[0].questionPoints+"分】</dt>"
				    				    +getTest(1,2,msg.datas[0].answer,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(2,2,msg.datas[0].answer2,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(3,2,msg.datas[0].answer3,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(4,2,msg.datas[0].answer4,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(5,2,msg.datas[0].answer5,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(6,2,msg.datas[0].answer6,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(7,2,msg.datas[0].answer7,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(8,2,msg.datas[0].answer8,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		            +getTest(9,2,msg.datas[0].answer9,msg.datas[0].questionId,msg.datas[0].correctAnswer)
				    		  );
				    		  break;
				    	   case 3:  //问答题
				    		   if(msg.datas[0].correctAnswer!=null){
					    		   $("#subject").append(
					    				     "<dt>"+num+". "+msg.datas[0].questionContent+"【"+msg.datas[0].questionPoints+"分】</dt>"
					    				     +"<dd>答案：<input type='text' name='answer,"+msg.datas[0].questionId+"' onblur=\"gblur('answer,"+msg.datas[0].questionId+"')\" value='"+msg.datas[0].correctAnswer+"'/></dd>"
					    		   );
				    		   }else{ 
				    			   $("#subject").append(
		    					   "<dt>"+num+". "+msg.datas[0].questionContent+"【"+msg.datas[0].questionPoints+"分】</dt>"
			    				     +"<dd>答案：<input type='text' name='answer,"+msg.datas[0].questionId+"' onblur=\"gblur('answer,"+msg.datas[0].questionId+"')\" value=''/></dd>"
		    				      );
				    		   } 	   
				    		  break;	   
				    	 }
					} else {
						  page--;
						  num--;
                          alert("已经是最后一题了！");
					}
				}
		  });
     }
     
   </script>
  
  <script type="text/javascript">
  var testId=${questionTest.testId};
   function getSbumitAnswer(id,val){
	   $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/broker_saveExamPaper',
			dataType:'json',
			data:"testId="+testId+"&questionId="+id+"&answerContent="+val,
			callBackFn:function(msg){
			  }
			});
   }

   
   function handExamPaper(){
	   $.fc.ajaxSubmit({
			url:'${pageContext.request.contextPath}/broker_handExamPaper',
			dataType:'json',
			data:"testId="+testId,
			callBackFn:function(msg){
				if(msg.length!=0){
					var qlCount=msg[0];					
					var qlCount2=msg[1];
					javascript:location.href='broker_success?qlCount='+qlCount+"&qlCount2="+qlCount2;
				}
			  }
			});
   }
   
   
  </script>
  
  
</head>

<body>
<div id="test1" class="right1" style="display: block;">
<div class="dt4">房立方最新功能的相关知识考查试卷</div>
  <span class="dt2"><font id="leftTime"></font><input type="button" value="交 卷" class="but1 dt2_but" onclick="handExamPaper()" /></span>
      <div class="tm">
      	<font>单选题(<span>共${subjectCount }题 共${subjectPointCount }分</span>) &nbsp; 多选题(<span>共${subjectCount2 }题 共${subjectPointCount2 }分</span>) &nbsp; 问答题(<span>共${subjectCount3 }题 共${subjectPointCount3 }分</span>)</font>
          <dl id="subject" >
            
          </dl> 
         <span class="updwon"><input type="button" value="上一题" class="but1" onclick="getPager('-',1)"/><input type="button" value="下一题" class="but1" onclick="getPager('+',1)"/></span>
      </div> 
</div>
<!-- style="display: none;" -->
<div id="test2" class="right1" style="display: none;">
<div class="dt4">房立方最新功能的相关知识考查试卷</div>
  <span class="dt2"><font id="leftTime1"></font><input type="button" value="交 卷" class="but1 dt2_but" onclick="handExamPaper()" /></span>
      <div class="tm">
       
      	<font id="radioSubject1">单选题 <span>共${subjectCount }题 共${subjectPointCount }分</span></font>
      	<div id="radioSubject2">
        </div>
        <font id="moreSubject1">多选题 <span>共${subjectCount2 }题 共${subjectPointCount2 }分</span></font>
        <div id="moreSubject2">
        </div>
        <font id="answerSubject1">问答题 <span>共${subjectCount3 }题 共${subjectPointCount3 }分</span></font>
        <div id="answerSubject2"> 
        </div> 
          <span class="updwon"><input type="button" value="上一页" class="but1" onclick="getPager('-',5)"/><input type="button" value="下一页" class="but1" onclick="getPager('+',5)"/></span>
      </div> 
</div>

</body>
</html>
