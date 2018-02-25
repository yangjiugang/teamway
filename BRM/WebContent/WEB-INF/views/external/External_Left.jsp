<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="css/layout.css"/>
<script type="text/javascript">
function setPersonnelSrc(type){
	var src = "external_frameJsp?jsp=Personnel&type="+type;
	parent.window.changeRight(src);
}
</script>
</head>
<body>
	<div class="left">
        <form>
        <dl>
        	<dt> <img src="images/tree2.jpg" onclick="setPersonnelSrc(0)"/>正常</dt>
			<dt> <img src="images/tree2.jpg" onclick="setPersonnelSrc(2)"/>黑名单</dt>
            <dt> <img src="images/tree2.jpg" onclick="setPersonnelSrc(1)"/>红名单</dt>
        </dl>
        </form> 
    </div>
</body>
</html>