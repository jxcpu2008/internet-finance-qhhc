<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post"  action=""   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent">	
		   <dl>
			   <dt>待发放金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumActivityMonkeyTwo}"/>" />元
				</dd>
			</dl>
			 <dl>
			   <dt>已发放金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumActivityMonkeyOne}"/>" />元
				</dd>
			</dl>
			 <dl>
			   <dt>总金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumActivityMonkey}"/>" />元
				</dd>
			</dl>
		</div>
	</div>
</form>