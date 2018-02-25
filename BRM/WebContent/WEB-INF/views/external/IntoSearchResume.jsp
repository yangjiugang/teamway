<%
/**********************************************************************
 * 在线抓取简历  搜索
 * 2011-3-20 邓祥 新建
 **********************************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<%@ include file="../common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经纪人管理-简历搜索</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<link rel="stylesheet" media="screen" href="css/index.css"/>
<script type="text/javascript">
	
	//在线简历设置
	function resumeConfig(){
		ShowIframe('在线简历设置','intoResumeConfig',700,450);
		
	}
	
	function into(){
		var leng = ${fn:length(cfgResumeAccount)};
		if(leng==0){
			alert("您没有关联招聘网站");
			return;
		}
		
	}
	//搜索
	function searchResume(){
		var leng = ${fn:length(cfgResumeAccount)};
		if(leng==0){
			alert("您没有关联招聘网站");
			return;
		}
		if($("#key").val()==""){
			alert("关键字不能为空");
			return;
		}
		var check = $("input:checked"); 
		var actorConfig = "";              //定义变量
		check.each(function(i){        //循环拼装被选中项的值
			actorConfig += $(this).val()+",";
	   });
	   if(check.length==0){
		   alert("至少关联一个招聘网站");
	  }
	   //var val=$('input:radio[name="rd"]:checked').val();
	  // if(val==null){
		 //  alert("请关联一个招聘网站");
		//   return;
		//}
	   $("#actorConfig").val(actorConfig);
	   //search.submit();
		
	}
	
</script>
</head>
<body onLoad="into();">
<!--中间-->
<div class="middle">
    <div class="jl_right">
    	<div class="glwz">
        	<font>已关联的网站：</font>
            <ul>
                <c:forEach items="${cfgResumeAccount}" var="cfgResumeAccount">
                	<c:if test="${cfgResumeAccount.accountName==1}">
                		<li><input type="checkbox"  name="checked" checked="true" id="1" value="1"/><font>人才热线</font></li>
                	</c:if>
                	<c:if test="${cfgResumeAccount.accountName==2}">
                		<li><input type="checkbox"  name="checked" checked="true" id="2" value="2"/><font>前程无忧</font></li>
                	</c:if>
                	<c:if test="${cfgResumeAccount.accountName==3}">
                		 <li><input type="checkbox"  name="checked" checked="true" id="3" value="3"/><font>58同城</font></li>
                	</c:if>
                	<c:if test="${cfgResumeAccount.accountName==4}">
                		<li><input type="checkbox"  name="checked" checked="true" id= "4" value="4"/><font>中华英才网</font></li>
                	</c:if>
                </c:forEach> 
            	
            </ul>
			<span style="margin-left:220px;" class="span_bg">
				<a href="<%=path%>/intoCjol">快速搜索</a>
			</span>
    		<span>
    			<a href="">精准搜索</a>
    		</span>
    		<span>
    			<a onclick="resumeConfig()">在线简历设置</a>
    		</span>
        </div>
       <!--<div class="jl_tab">
        	<ul>
                <li style="margin-left:20px; _display:inline;">
                <a href=""><img src="images/51job.gif" /> 前程无忧</a></li>
                <li><a href=""><img src="images/chinahr.gif" /> 智联招聘</a></li>
                <li><a href=""><img src="images/58.gif" /> 58同城</a></li>
                <li><a href=""><img src="images/cjol.gif" /> 人才热线</a></li>
       		 </ul>
        </div>  --> 
        
        <div class="jl_seach">
	        <form name="search" id="search" action="allResumeList" method="post">
	        	<input type="hidden" name="actorConfig" id="actorConfig" value="">
	        	<font>关键字搜索</font>
	            <span>
		            <input type="text" name = "key" id = "key" value="" size="50" />&nbsp;&nbsp;
		                                 更新时间：
		            <select id = "updateTime" name = "updateTime">
		            	<option selected="selected" value="-1">系统默认</option>
						<option value="3">三天内</option>
						<option value="7">一周内</option>
						<option value="31">一月内</option>
						<option value="62">二月内</option>
						<option value="93">三月内</option>
						<option value="180">半年内</option>
		            </select>  &nbsp;&nbsp; 
		                                 期望工作地区：
		             <select id="location" name="location"> 
		             	<option value="-1"></option>
		            	<option value="20">广东省</option>
						<option value="2008">...深圳市</option>
						<option value="200801">......南山区</option>
						<option value="200802">......罗湖区</option>
						<option value="200803">......福田区</option>
						<option value="200804">......宝安区</option>
						<option value="200805">......龙岗区</option>
						<option value="200806">......盐田区</option>
						<option value="200807">......光明新区</option>
						<option value="200808">......坪山新区</option>
						<option value="200809">......大鹏新区</option>
						<option value="200810">......龙华新区</option>
						<option value="2010">...广州市</option>
						<option value="201001">......越秀区</option>
						<option value="201002">......东山区</option>
						<option value="201003">......荔湾区</option>
						<option value="201004">......海珠区</option>
						<option value="201005">......天河区</option>
						<option value="201006">......白云区</option>
						<option value="201007">......黄埔区</option>
						<option value="201008">......芳村区</option>
						<option value="201009">......花都区</option>
						<option value="201010">......番禺区</option>
						<option value="201011">......从化市</option>
						<option value="201012">......增城市 </option>
						<option value="2011">...东莞市</option>
						<option value="2012">...中山市</option>
						<option value="2013">...珠海市</option>
						<option value="2014">...汕头市</option>
						<option value="2015">...惠州市</option>
						<option value="2018">...江门市</option>
						<option value="2019">...佛山市</option>
						<option value="201910">......禅城区</option>
						<option value="201920">......顺德市</option>
						<option value="201930">......南海市</option>
						<option value="201940">......三水区</option>
						<option value="201950">......高明区</option>
						<option value="2022">...韶关市</option>
						<option value="2024">...河源市</option>
						<option value="2026">...梅州市</option>
						<option value="2028">...汕尾市</option>
						<option value="2030">...阳江市</option>
						<option value="2032">...湛江市</option>
						<option value="2034">...茂名市</option>
						<option value="2036">...肇庆市</option>
						<option value="2038">...清远市</option>
						<option value="2040">...潮州市</option>
						<option value="2042">...揭阳市</option>
						<option value="2044">...云浮市</option>
						<option value="30">上海市</option>
						<option value="300101">......黄浦区</option>
						<option value="300102">......卢湾区</option>
						<option value="300103">......徐汇区</option>
						<option value="300104">......长宁区</option>
						<option value="300105">......静安区</option>
						<option value="300106">......普陀区</option>
						<option value="300107">......闸北区</option>
						<option value="300108">......虹口区</option>
						<option value="300109">......杨浦区</option>
						<option value="300110">......宝山区</option>
						<option value="300111">......闵行区</option>
						<option value="300112">......嘉定区</option>
						<option value="300113">......浦东新区</option>
						<option value="300114">......松江区</option>
						<option value="300115">......金山区</option>
						<option value="300116">......青浦区</option>
						<option value="300117">......南汇区</option>
						<option value="300118">......奉贤区</option>
						<option value="300119">......崇明县</option>
						<option value="31">北京市</option>
						<option value="310101">......东城区</option>
						<option value="310102">......西城区</option>
						<option value="310103">......崇文区</option>
						<option value="310104">......宣武区</option>
						<option value="310105">......朝阳区</option>
						<option value="310106">......海淀区</option>
						<option value="310107">......丰台区</option>
						<option value="310108">......石景山区</option>
						<option value="310109">......门头沟区</option>
						<option value="310110">......房山区</option>
						<option value="310111">......通州区</option>
						<option value="310112">......顺义区</option>
						<option value="310113">......昌平区</option>
						<option value="310114">......大兴区</option>
						<option value="310115">......怀柔区</option>
						<option value="310116">......平谷区</option>
						<option value="32">天津市</option>
						<option value="33">河北省</option>
						<option value="3301">...石家庄市 </option>
						<option value="34">山西省</option>
						<option value="35">内蒙古</option>
						<option value="36">辽宁省</option>
						<option value="37">吉林省</option>
						<option value="38">黑龙江省</option>
						<option value="39">江苏省</option>
						<option value="3901">...南京市</option>
						<option value="3902">...无锡市</option>
						<option value="3903">...苏州市</option>
						<option value="40">浙江省</option>
						<option value="4001">...杭州市</option>
						<option value="4002">...宁波市</option>
						<option value="4003">...温州市</option>
						<option value="4004">...金华市</option>
						<option value="41">安徽省</option>
						<option value="4101">...合肥市</option>
						<option value="42">福建省</option>
						<option value="4201">...福州市</option>
						<option value="4202">...厦门市</option>
						<option value="43">江西省</option>
						<option value="4301">...南昌市</option>
						<option value="44">山东省</option>
						<option value="4401">...济南市</option>
						<option value="4402">...青岛市</option>
						<option value="45">河南省</option>
						<option value="4501">...郑州市</option>
						<option value="46">湖北省</option>
						<option value="4601">...武汉市</option>
						<option value="47">湖南省</option>
						<option value="4701">...长沙市</option>
						<option value="48">广西</option>
						<option value="4801">...南宁市</option>
						<option value="4802">...柳州市</option>
						<option value="4803">...桂林市</option>
						<option value="49">四川省</option>
						<option value="4901">...成都市</option>
						<option value="50">贵州省</option>
						<option value="51">云南省</option>
						<option value="52">西藏自治区</option>
						<option value="53">陕西省</option>
						<option value="5301">...西安市</option>
						<option value="54">甘肃省</option>
						<option value="55">青海省</option>
						<option value="56">宁夏</option>
						<option value="57">新疆</option>
						<option value="60">香港</option>
						<option value="61">台湾省</option>
						<option value="62">澳门</option>
						<option value="63">重庆市</option>
						<option value="64">海南省</option>
						<option value="65">国外</option>
						<option value="99">其他</option>
		            </select> &nbsp;&nbsp; 
		            <input type="button" class="seach_but" onclick="searchResume();" value="&nbsp;搜&nbsp;索&nbsp;" />
	            </span>
          	</form>
          	<form name="search1" id ="search1" action="searchCjol" method="post">
	            <font>搜索器搜索</font>
	            <span>
		            <select id = "xx" name = "xx">
		            	<option selected="selected" value="-1" >请选择搜索器</option>
						<option value="3">搜索器</option>
		            </select>&nbsp;&nbsp; 
		            <input type="submit" class="seach_but" value="&nbsp;搜&nbsp;索&nbsp;"/>
	            </span>
            </form>
        </div>
    </div>
</div>
<!--end中间-->
	
</body>
</html>