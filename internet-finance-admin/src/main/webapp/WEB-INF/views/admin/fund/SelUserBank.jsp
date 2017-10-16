<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<style>
	td{
	padding: 6px;
	font-size: 14px;
	}
</style>
<form method="post" action=""  class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" >
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td width="80">真实姓名</td>
					<td width="200">银行账号</td>
					<td width="80">开户名称</td>
					<td width="80">开户省会</td>
					<td width="80">开户城市</td>
					<td width="80">开户支行</td>
				</tr>
				<c:forEach items="${bankList}" var="userBank">
					<tr>
						<td>${userBank.userbasicsinfo.name}</td>
						<td>${userBank.bank_no}</td>
						<td>${userBank.bank_name}</td>
						<td>${userBank.pro_value}</td>
						<td>${userBank.city_value}</td>	
						<td>${userBank.bank_address}</td>	
					</tr>				
					
				</c:forEach>
			</table>
			</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>