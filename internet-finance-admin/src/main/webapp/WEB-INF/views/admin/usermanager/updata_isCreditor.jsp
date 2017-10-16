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
<script type="text/javascript">
	$(function() {
		if ($('input[name="isCreditor"]:checked').val() == "2") {
			if ($('input[type=text]').prop('disabled')) {
				$('input[type=text]').prop('disabled', false);
			}
		} else if ($('input[name="isCreditor"]:checked').val() == "0") {
			if (!$('input[type=text]').prop('disabled')) {
				$('input[type=text]').prop('disabled', true);
			}
		}
	});
</script>
<div class="pageContent">
	<form method="post" action="<%=basePath%>userinfo/updateIsCreditor"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<input type="hidden" name="ids" value="${ user.id}" />
			<p>
				<label>&nbsp;&nbsp;&nbsp;是否改为借款人：</label> <input
					<c:if test="${user.isCreditor==1 || user.isCreditor eq null}">checked="checked"</c:if>
					type="radio" name="isCreditor" value="1"> 否 <input
					<c:if test="${user.isCreditor==2 }">checked="checked"</c:if>
					type="radio" name="isCreditor" value="2"> 是
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>

