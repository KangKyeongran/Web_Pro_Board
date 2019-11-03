<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>



<script type="text/javascript">
		
</script>
<script>
</script>




</head>


<body>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h2>With 이메일 인증 성공</h2>
	
	</div>
	<br>
	<h2 style="text-align: center" id="name">${name1}</h2>
	<h4 style="text-align: center" id="email"></h4>

<script>
$(function(){
	$("body").hide();
	$("body").fadeIn(1000);
	
	setTimeout(function(){$("body").fadeOut(1000);},1000);
	setTimeout(function(){location.href="/with"},2000);
})
</script>

</body>
</html>