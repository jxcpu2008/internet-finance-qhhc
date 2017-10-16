<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 该页面为测试环讯注册页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<h3>正在提交信息,请稍后......</h3>
<form action="${map.url}" id="f456" method="post">
	<input type="hidden" name="terminal_id" value="${map.terminal_id}">
	<input type="hidden" name="merchant_id" value="${map.merchant_id}"> 
	<input type="hidden" name="user_id" value="${map.user_id}">
	<input type="hidden" name="service_url" value="${map.service_url}">
	<input type="hidden" name="page_url" value="${map.page_url}"> 
</form>
<script type="text/javascript">
	document.getElementById("f456").submit();
</script>


</html>
