<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="/resources/assets/css/activities.css" rel="stylesheet" />
<script type="text/javascript">
function test(){
	var h= &{"000"};
	alert(h);	
}
</script>
</head>
<body onload="test()">
${userCookie}
</body>
</html>