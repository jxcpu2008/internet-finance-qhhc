<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/msgman/smsEmailTemplateList.js"></script>
<div class="pageContent">
	<form id="a_doAddSmsEmailTemplateForm" method="post" action="/templateManager/addSmsEmailTemplate" 
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<div>
				<label>消息类型</label> 
				<select id="a_msgType" name="msgType" style="float: none;">
					<option value="0">请选择</option>
					<option value="1">短信</option>
					<option value="2">邮件</option>
				</select>
			</div><br/>
			<div>
				<label>模板名称</label> 
				<select id="a_oneLevelTemplateId" name="templateType" style="float: none;">
					<option value="">请选择</option>
					<c:forEach items="${oneLevelTypeList}" var="pro">
						<option value="${pro.switchEnName}">${pro.switchZhName}</option>
					</c:forEach>
				</select>&nbsp;
				<select id="a_twoLevelTemplateId" name="templateEnName"  style="float: none;">
					<option value="">请选择</option>
				</select>
			</div><br/>
			<div>
				<label>模板标题</label> 
				<input id="a_templateTitle" name="templateTitle" type="text" style="width: 500px;" class="required" minlength="6" maxlength="128" />
			</div><br/>
			<div style="clear: both; height: 290px; width: 100%; margin-top: 30px;">
				<label>模板内容</label>
				<textarea id="a_templateContent" rows="13" cols="80" name="templateContent"></textarea>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="a_doAddSmsEmailTemplateBtn">保存</button>
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