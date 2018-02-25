<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Flot Examples</title>
    <script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jquery.flot.js"></script>

 </head>
    <body>  
    <div id="placeholder" style="width:700px;height:400px; text-align: left;"></div>
    <p><input id="enableTooltip" checked="checked" type="checkbox"></p>
    
<script type="text/javascript">
$(document).ready(function(){
	
    var plot = $.plot($("#placeholder"),
           [
            <c:forEach items="${list}" var="priceBtStat" varStatus="status">
				{
					data: [<c:forEach items="${priceBtStat}" var="stat" varStatus="status2">[${stat.month},${stat.avgPrice}]<c:if test="${!status2.last}">,</c:if></c:forEach>],
					<c:if test="${status.count ==1}">
					label: "开发商",
					</c:if>
					<c:if test="${status.count ==2}">
					label: "房客",
					</c:if>
					<c:if test="${status.count ==3}">
					label: "经纪人",
					</c:if>
					lines: { show: true },
					points: { show: true }
				}<c:if test="${!status.last}">,</c:if>
			</c:forEach>
           ], 
             {
               series: {
                   lines: { show: true },
                   points: { show: true }
               },
               grid: { hoverable: true, clickable: true },
			   xaxis: {ticks : [[1,'1月份'],[2,'2月份'],[3,'3月份'],[4,'4月份'],[5,'5月份'],[6,'6月份'],[7,'7月份'],[8,'8月份'],[9,'9月份'],[10,'10月份'],[11,'11月份'],[12,'12月份']]}
             });

    function showTooltip(x, y, contents) {
        $('<div id="tooltip">&nbsp;&nbsp;' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #fdd',
            padding: '2px',
            'background-color': '#fee',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#placeholder").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

        if ($("#enableTooltip:checked").length > 0) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    
                    $("#tooltip").remove();
                    var x = Math.floor(item.datapoint[0].toFixed(2)),
                        y = Math.floor(item.datapoint[1].toFixed(2));
                    
                    showTooltip(item.pageX, item.pageY,
                                 x + "月份 " + y + "均价");
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;            
            }
        }
    });

    $("#placeholder").bind("plotclick", function (event, pos, item) {
        if (item) {
            $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
            plot.highlight(item.series, item.datapoint);
        }
    });
});
</script>

 </body>
</html>
