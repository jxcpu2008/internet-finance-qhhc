<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/msgman/smsEmailTemplateList.js"></script>
<div class="pageContent">
	<form id="u_doUpdateSmsEmailUpdateTemplateForm" method="post" action="/templateManager/doUpdateSmsEmailUpdateTemplate" 
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input name="id" type="hidden" value="${smsEmailTemplate.id}"/>
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<div>
				<label>消息类型</label> 
				<select id="u_msgType" name="msgType" style="float: none;">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${1==smsEmailTemplate.msgType}">selected="selected"</c:if>>短信</option>
					<option value="2" <c:if test="${2==smsEmailTemplate.msgType}">selected="selected"</c:if>>邮件</option>
				</select>
			</div><br/>
			<div>
				<label>模板名称</label> 
				<select id="u_oneLevelTemplateId" name="templateType" style="float: none;">
					<option value="">请选择</option>
					<c:forEach items="${oneLevelTypeList}" var="pro">
						<option value="${pro.switchEnName}" <c:if test="${pro.switchEnName==smsEmailTemplate.templateType}">selected="selected"</c:if>>${pro.switchZhName}</option>
					</c:forEach>
				</select>&nbsp;
				<select id="u_twoLevelTemplateId" name="templateEnName" style="float: none;">
					<option value="">请选择</option>
					<c:forEach items="${twoLevelTypeList}" var="pro">
						<option value="${pro.switchEnName}" <c:if test="${pro.switchEnName==smsEmailTemplate.templateEnName}">selected="selected"</c:if>>${pro.switchZhName}</option>
					</c:forEach>
				</select>
			</div><br/>
			<div>
				<label>模板标题</label> 
				<input id="u_templateTitle" name="templateTitle" value="${smsEmailTemplate.templateTitle}"
				type="text" class="required" style="width: 500px;" minlength="6" maxlength="128" />
			</div><br/>
			<div style="clear: both; height: 290px; width: 100%; margin-top: 30px;">
				<label>模板内容</label>
				<textarea id="u_templateContent" rows="13" cols="80" name="templateContent" <c:if test="${smsEmailTemplate.msgType eq 1 }">maxlength="65"</c:if>>${smsEmailTemplate.templateContent}</textarea>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="u_doUpdateSmsEmailUpdateTemplateBtn">保存</button>
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