<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action=""  class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" >	
				       <input value="${msg}" disabled="disabled" name="msg" width="150">
			</div>
	</div>
</form>