<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>面试及交流记录窗口</title>
<link href="css/Tanchu.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="javascript/curvycorners.src.js"></script>
<script type="text/javascript">
function settab_zzjs(name,num,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById(name+"_"+"zzjs"+i);
  menu.className=i==num?"on_zzjs":"";
    con.style.display=i==num?"block":"none";
 }
}
</script>

</head>

<body>

<div class="HR_lishichaxun29 myBox">
<div class="myBox01">
<div class="myBox02">

<div class="HR_lishichaxun_Top">
<div class="HR_lishichaxun_TopL">面试及交流记录窗口</div>
<div class="HR_lishichaxun_TopR"><a href="#"><img src="images/Tanchu04.gif" /></a> <a  href="javascript:parent.closeFrame();" ><img src="images/Tanchu05.gif" style="margin-left:10px;" /></a></div></div>

<div class="HR_lishichaxun_Bottom myBox03">
<div class="tabL">
<ul><li id="zzjs1" onClick ="settab_zzjs('zzjs',1,2)" class="on_zzjs">面试录入</li>
<li id="zzjs2" onClick ="settab_zzjs('zzjs',2,2)">面试历史查询</li>
</ul></div>

<div id="zzjs_zzjs1"><div class="HR_mianshijiaoliujilu">
<div class="HR_lishichaxun_top29">任务号：<input style="width:120px;" /> 面试官：<input style="width:120px;" /> 候选人：<input style="width:120px;" /></div>
<div class="HR_lishichaxun_top29">面试开始时间：<input style="width:84px;" /> 面试结束时间：<input style="width:84px;" /></div>
<div class="HR_lishichaxun_top29">面试地点：<input style="width:482px;" /></div>
<div class="HR_lishichaxun_top29">面试问题（1）：<input style="width:451px;" /></div>
<P style="padding-top:15px;">回答：<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual"></textarea></P>
<div class="HR_mianshijiaoliujilu_Submit"><input type="button" class="HR_mianshijiaoliujilu_tjmswt" /></div>

<h3 style="font-size:12px; font-weight:normal;">对候选人综合评价：</h3>

<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual">

</textarea>
<form>
<div class="HR_mianshijiaoliujilu13">面试结果: <input type="radio" name="radio" id="radio" value="radio" /> 面试通过<span><input type="radio" name="radio" id="radio" value="radio" /> 面试不通过</span><input type="radio" name="radio" id="radio" value="radio" /> 可备选</div></form>


<div class="HR_mianshijiaoliujilu_Submit"><input type="button" class="HR_Submit_qdtj29" /></div>


</div></div>

<div id="zzjs_zzjs2" style="display:none;">
<ul class="HR_jiarurencaitidui_tabs">
<li><a href="#" style="color:#0566AD;">初试</a></li>
<li><a href="#">复试1</a></li>
<li><a href="#">复试2</a></li>
</ul>
<div class="HR_mianshijiaoliujilu">
<div class="HR_lishichaxun_top29">任务号：<input style="width:120px;" /> 面试官：<input style="width:120px;" /> 候选人：<input style="width:120px;" /></div>
<div class="HR_lishichaxun_top29">面试开始时间：<input style="width:84px;" /> 面试结束时间：<input style="width:84px;" /></div>
<div class="HR_lishichaxun_top29">面试地点：<input style="width:482px;" /></div>
<div class="HR_lishichaxun_top29">面试问题（1）：<input style="width:451px;" /></div>
<P style="padding:15px 0;">回答：<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual"></textarea></P>


<h3 style="font-size:12px; font-weight:normal;">对候选人综合评价：</h3>
<textarea node-type="textEl" name="" title="请输入......." tabindex="1" class="HR_mianshijiaoliujilu_Casual">

</textarea>
<form>
<div class="HR_mianshijiaoliujilu13">面试结果: <input type="radio" name="radio" id="radio" value="radio" /> 面试通过<span><input type="radio" name="radio" id="radio" value="radio" /> 面试不通过</span><input type="radio" name="radio" id="radio" value="radio" /> 可备选</div></form>





</div></div>


</div>


</div>
</div>
</div>
</body>
</html>
