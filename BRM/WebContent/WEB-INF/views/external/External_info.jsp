<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经纪人管理-办理入职</title>
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

<div class="HR_yidongweihu29 myBox">
<div class="myBox01">
<div class="myBox02">

<div class="HR_yidongweihu_Top">
<div class="HR_yidongweihu_TopL">简历查看及维护窗口</div>
<div class="HR_yidongweihu_TopR"><a href="#"><img src="images/Tanchu04.gif" /></a> <a href="#"><img src="images/Tanchu05.gif" style="margin-left:10px;" /></a></div></div>

<div class="HR_yidongweihu_Bottom myBox03">
<div class="tabY">
<ul><li id="zzjs1" onClick ="settab_zzjs('zzjs',1,2)" class="on_zzjs">赵山河</li>
<li id="zzjs2" onClick ="settab_zzjs('zzjs',2,2)">赵XX</li>
</ul></div>

<div class="HR_lishijixiaoContent jixiaoContent">
	<div class="M_left">
   		<ul class="ul_tittle">
        	<li><img src="images/-.jpg"  class="up"/>简历/外部人才库<br />
            	<ul class="M_manu">
                	<li><a href="">基本资料</a></li>
                    <li><a href="">工作经历</a></li>
                    <li><a href="">教育经历</a></li>
                    <li><a href="">培训经历</a></li>
                    <li><a href="">项目经验</a></li>
                    <li><a href="">技能专长</a></li>
                    <li><a href="">兴趣爱好</a></li>
                </ul>
            </li>
        </ul>
    </div>
	<div class="right">
    	<div class="HR_lishijixiaoR"><input type="button" class="HR_SearchR_DY29" /><input type="button" class="HR_SearchR_BC29" /><input type="button" class="HR_SearchR_FX29" /></div></form>
    
    </div>
</div>
</div>

	<div id="zzjs_zzjs2" style="padding:20px 20px 0 20px; display:none;">
		<div class="HR_lishijixiao"></div>
		<div class="HR_lishijixiaoR">
			<input type="button" class="HR_SearchR_DY29" />
			<input type="button" class="HR_SearchR_BC29" />
			<input type="button" class="HR_SearchR_FX29" />
		</div>
	</div>
	
	<div class="HR_lishijixiaoContent"></div>
</div>
</div>
</div>
</body>
</html>
