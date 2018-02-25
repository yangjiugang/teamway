<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link rel="stylesheet" media="screen" href="js/jqgrid/jquery-ui-1.8.18.custom.css"/>
<link rel="stylesheet" media="screen" href="js/jqgrid/ui.jqgrid.css"/>
<link rel="stylesheet" media="screen" href="js/validate/validate.css"/>
<style>
	.ui-jqgrid-sortable{font-size:13px;font-weight: normal;}
	.ui-jqgrid-btable{font-size:13px;}
	.ui-paging-info{font-size:13px;}
	.ui-pg-input{font-size:13px;}
	.ui-pg-selbox{font-size:13px;}
</style>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/date/WdatePicker.js"></script>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/jqgrid/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="js/jqgrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="js/jqgrid/jquery.jqGrid.js"></script>
<script type="text/javascript" src="js/validate/excanvas.min.js"></script>
<script type="text/javascript" src="js/validate/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/popup/popup.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript">
var pageSize = [36,100,200];
function mousePos(e){
	var x,y;
	var e = e || window.event;		
	return {
		x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
		y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
	};
}
</script>