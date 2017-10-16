<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<div>
				<label>消息类型</label> 
				<select name="msgType" style="float: none;" disabled="disabled">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${1==smsEmailTemplate.msgType}">selected="selected"</c:if>>短信</option>
					<option value="2" <c:if test="${2==smsEmailTemplate.msgType}">selected="selected"</c:if>>邮件</option>
				</select>
			</div><br/>
			<div>
				<label>模板名称</label> 
				<select name="templateType" id="oneLevelTemplateId"  style="float: none;" disabled="disabled">
					<option value="">请选择</option>
					<c:forEach items="${oneLevelTypeList}" var="pro">
						<option value="${pro.switchEnName}" <c:if test="${pro.switchEnName==smsEmailTemplate.templateType}">selected="selected"</c:if>>${pro.switchZhName}</option>
					</c:forEach>
				</select>&nbsp;
				<select name="templateEnName" id="twoLevelTemplateId" style="float: none;" disabled="disabled">
					<option value="">请选择</option>
					<c:forEach items="${twoLevelTypeList}" var="pro">
						<option value="${pro.switchEnName}" <c:if test="${pro.switchEnName==smsEmailTemplate.templateEnName}">selected="selected"</c:if>>${pro.switchZhName}</option>
					</c:forEach>
				</select>
			</div><br/>
			<div>
				<label>模板标题</label> 
				<input name="templateTitle" style="width: 500px;" value="${smsEmailTemplate.templateTitle}"
				type="text" class="required" minlength="6" maxlength="120" readonly="readonly"/>
			</div><br/>
			<div style="clear: both; height: 290px; width: 100%; margin-top: 30px;">
				<label>模板内容</label>
				<div>${smsEmailTemplate.templateContent}</div>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="reset" class="close">确定</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
</div>