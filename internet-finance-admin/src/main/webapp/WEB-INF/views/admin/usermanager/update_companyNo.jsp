<%--    
创建时间：2014年1月27日下午2:01:33   
创 建 人：frank   
相关说明：   修改会员信息页面
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
<form method="post" action="<%=basePath %>userinfo/updateCompanyNo"   class="pageForm required-validate"   onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageFormContent" layoutH="50">
			<input type="hidden" name="ids" value="${ user.id}" />
			<p>
				<label>企业编号：</label>
				   <input name="staffNo"   type="text" class="required"   value="${ user.staffNo}" >
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

