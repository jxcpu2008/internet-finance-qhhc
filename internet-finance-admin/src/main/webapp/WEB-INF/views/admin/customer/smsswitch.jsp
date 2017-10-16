<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2 class="contentTitle">短信通道管理</h2>

<div class="pageFormContent" layoutH="60" style="height: 400px;">
	<form action="/smsSwitch/update.htm" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input name="id" type="hidden" value="${smsswitch.id}" /> 
		<fieldset>
			<legend>触发通道</legend>
			<dl>
			<dt>触发通道选项：</dt>
			<dd>
				<select name="triger">
					<option <c:if test="${smsswitch.triger==1}">selected="selected"</c:if> value="1">亿美</option>
					<option <c:if test="${smsswitch.triger==2}">selected="selected"</c:if> value="2">梦网</option>
					<option <c:if test="${smsswitch.triger==3}">selected="selected"</c:if> value="3">互亿</option>
					<option <c:if test="${smsswitch.triger==4}">selected="selected"</c:if> value="4">沃动</option>
				</select>
			</dd>
		</dl>
		<dl></dl>
		<dl></dl>
			<dl>
				<dt>营销通道选项：</dt>
				<dd>
				<select name="marketing">
					<option <c:if test="${smsswitch.marketing==1}">selected="selected"</c:if> value="1">亿美</option>
					<option <c:if test="${smsswitch.marketing==2}">selected="selected"</c:if> value="2">梦网</option>
					<option <c:if test="${smsswitch.marketing==3}">selected="selected"</c:if> value="3">沃动</option>
				</select>
				</dd>
			</dl>
		</fieldset>

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
							<button type="reset" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
