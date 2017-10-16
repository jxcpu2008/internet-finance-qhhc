<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html;  charset="utf-8">
<title>渠道信息查询</title>
<style type="text/css">
</style>
</head>
<body>
<div>
</div>
<form action="/channelQuery/checkUser.htm" method="post">
<label class="text-label">用户名</label> 
<input type="text" id="loginName" name="loginName" value="${loginName }"  data-content="用户名">
<label class="text-label">密码</label>
<input type="password" id="password" name="password" value="${password }"  data-content="密码">
<button type="submit" id="formSubmit">立即登录</button>
</form>
</body>
</html>