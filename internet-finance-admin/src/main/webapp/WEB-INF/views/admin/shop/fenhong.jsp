<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>

<div class="pageContent">
	<form id="form-saveUser"
		action="/projectManage/fenhongShop" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="70">
			<input type="hidden" name="pId" value="${project.id }" />
			<p>
				<label>填写店铺分红金额${project.id }：</label> <input name="fhmoney"
					class="required number" type="text" size="20" maxlength="9" />
			</p>
			<p>
				<input type="submit" name="" value="确认" style="margin-left: 40%" />
			</p>
		</div>
	</form>
</div>