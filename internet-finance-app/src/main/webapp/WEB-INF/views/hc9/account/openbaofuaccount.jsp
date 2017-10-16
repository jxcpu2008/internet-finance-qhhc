<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>开通宝付</title>
	</head>
	<body>
		<h3>正在提交信息,请稍后......</h3>
		<form action="${baoFuRegisterUrl}" id="doOpenBaoFuForm" method="post">
			<input type="hidden" name="terminal_id" value="${terminal_id}">
			<input type="hidden" name="merchant_id" value="${merchant_id}"> 
			<input type="hidden" name="sign" value="${sign}"> 
			<input type="hidden" name="bf_account" value="${vo.bf_account}">
			<input type="hidden" name="name" value="${vo.name}">
			<input type="hidden" name="id_card" value="${vo.id_card}">
			<input type="hidden" name="user_id" value="${vo.user_id}">
			<input type="hidden" name="service_url" value="${vo.return_url}">
			<input type="hidden" name="page_url" value="${vo.page_url}"> 
		</form>
	</body>
	<script type="text/javascript">
		document.getElementById("doOpenBaoFuForm").submit();
	</script>
</html>