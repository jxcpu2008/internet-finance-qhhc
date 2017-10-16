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
		<c:forEach var="result" items="${result}" >
			<tr>
				<td>${result[0]}</td><td>${result[1]}</td><td>${result[2]}</td>
				<td>${result[3]}</td><td>${result[4]}</td><td>${result[5]}</td>
				<td>${result[6]}</td><td>${result[7]}</td><td>${result[8]}</td>
			</tr>
		</c:forEach> 
</body>
</html>