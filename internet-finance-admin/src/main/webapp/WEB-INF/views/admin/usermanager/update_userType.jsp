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

		if ($("#userType").val() == "2") {
			$("#department").attr("disabled", false);
		} else {
			$("#department").attr("disabled", true);
		}

		$("#userType").change(function() {
			if ($(this).val() == "2") {
				$("#department").prop("disabled", false);
			} else {
				$("#department").prop("disabled", true);
			}
		});

	});
</script>
<div class="pageContent">
	<form method="post" action="<%=basePath%>userinfo/updateUserType"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<input type="hidden" name="ids" value="${ user.id}" /> <input
				type="hidden" name="type" value="${type }" />
			<p>
				<label>是否是员工：</label> 							
				<select name="userType" id="userType" >
					<option value="1"
						<c:if test="${user.userType eq  '1'}">selected="selected"</c:if>>普通会员</option>
					<option value="2"
						<c:if test="${user.userType eq  '2'}">selected="selected"</c:if>>员工</option>
							<option value="4"
						<c:if test="${user.userType eq  '4'}">selected="selected"</c:if>>居间人</option>
				</select>
			</p>
			<p>
				<label>所属部门：</label> <select name="department" id="department">
					<option value="1"
						<c:if test="${user.department==1}">selected="selected"</c:if>>总裁办</option>
					<option value="2"
						<c:if test="${user.department==2}">selected="selected"</c:if>>财务部</option>
					<option value="3"
						<c:if test="${user.department==3}">selected="selected"</c:if>>行政部</option>
					<option value="4"
						<c:if test="${user.department==4}">selected="selected"</c:if>>副总办</option>
					<option value="5"
						<c:if test="${user.department==5}">selected="selected"</c:if>>运营中心</option>
					<option value="6"
						<c:if test="${user.department==6}">selected="selected"</c:if>>培训部</option>
					<option value="7"
						<c:if test="${user.department==7}">selected="selected"</c:if>>风控部</option>
					<option value="8"
						<c:if test="${user.department==8}">selected="selected"</c:if>>IT部</option>
					<option value="9"
						<c:if test="${user.department==9}">selected="selected"</c:if>>摄影部</option>
					<option value="10"
						<c:if test="${user.department==10}">selected="selected"</c:if>>推广部</option>
					<option value="11"
						<c:if test="${user.department==11}">selected="selected"</c:if>>项目部</option>
					<option value="12"
						<c:if test="${user.department==12}">selected="selected"</c:if>>客服部</option>
					<option value="13"
						<c:if test="${user.department==13}">selected="selected"</c:if>>事业一部</option>
					<option value="14"
						<c:if test="${user.department==14}">selected="selected"</c:if>>事业二部</option>
					<option value="15"
						<c:if test="${user.department==15}">selected="selected"</c:if>>离职员工</option>
				</select>

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

