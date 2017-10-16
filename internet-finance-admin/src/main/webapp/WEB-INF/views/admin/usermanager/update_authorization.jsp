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

		if ($('input[name="isorgperson"]:checked').val() == "1") {
			if ($('input[type=text]').prop('disabled')) {
				$('input[type=text]').prop('disabled', false);
			}
		} else if ($('input[name="isorgperson"]:checked').val() == "0") {
			if (!$('input[type=text]').prop('disabled')) {
				$('input[type=text]').prop('disabled', true);
			}
		}

		$('input[name="isorgperson"]').on(
				'click',
				function() {
					if ($(this).val() == "1") {
						if ($(this).parent().find('input[type=text]').prop(
								'disabled')) {
							$(this).parent().find('input[type=text]').prop(
									'disabled', false);
						}
					} else {
						if (!$(this).parent().find('input[type=text]').prop(
								'disabled')) {
							$(this).parent().find('input[type=text]').prop(
									'disabled', true);
							$('input[type=text]').val(0.00);
						}
					}

				});

	});
</script>
<div class="pageContent">
	<form method="post" action="<%=basePath%>userinfo/updateAuthorization"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<input type="hidden" name="ids" value="${ user.id}" />
			<p>
				<label>是否成为机构投资人：</label> <input
					<c:if test="${user.isorgperson==0 || user.isorgperson eq null  }">checked="checked" </c:if>
					type="radio" name="isorgperson" value="0"> 否 <input
					<c:if test="${user.isorgperson==1}">checked="checked"</c:if>
					type="radio" name="isorgperson" value="1"> 是 <input
					<c:if test="${user.isorgperson==2}">checked="checked"</c:if>
					type="radio" name="isorgperson" value="2"> 待确认 <input
					<c:if test="${user.isorgperson==3}">checked="checked"</c:if>
					type="radio" name="isorgperson" value="3"> 不通过 &nbsp;&nbsp;<input
					type="text" style="float: none;" name="loanlines"
					value="${user.loanlines}" /> 元
			</p>

			<%-- <p>
				<label>是否成为众筹融资人：</label> <input
					<c:if test="${user.iscrowdfundingperson==0 || user.iscrowdfundingperson eq null}">checked="checked"</c:if>
					type="radio" name="iscrowdfundingperson" value="0"> 否 <input
					<c:if test="${user.iscrowdfundingperson==1 }">checked="checked"</c:if>
					type="radio" name="iscrowdfundingperson" value="1"> 是
			</p> --%>
			<p>
				<label>是否成为众持融资人：</label> <input
					<c:if test="${user.iscrowdhold==0 || user.iscrowdhold eq null}">checked="checked"</c:if>
					type="radio" name="iscrowdhold" value="0"> 否 <input
					<c:if test="${user.iscrowdhold==1 }">checked="checked"</c:if>
					type="radio" name="iscrowdhold" value="1"> 是
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

