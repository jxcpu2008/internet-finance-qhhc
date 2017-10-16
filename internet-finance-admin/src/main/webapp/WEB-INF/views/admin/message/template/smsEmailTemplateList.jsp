<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/msgman/smsEmailTemplateList.js"></script>
<style>
	#smsEmailTemplate-search-panel {vertical-align: middle;}
</style>
<div id=smsEmailTemplate-search-panel>
	<div >
		<form method="post" id="searchSmsEmailTemplateForm">		   			
			<span class="label">消息类型：</span>
			<select name="msgType" style="float: none;">
				<option value="0">全部</option>
				<option value="1">短信</option>
				<option value="2">邮件</option>
			</select>
			<span id="smsEmailTemplate-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="toAddSmsEmailTemplate" href="javascript:void(0);" ><span>添加模板</span></a></li>
			 <li class="line">line</li>
			<li><a class="add" id="viewSmsEmailTemplate" onclick="viewSmsEmailTemplate()"><span>预览</span></a></li>
			  <li class="line">line</li>
			<li><a class="edit" id="toSmsEmailUpdateTemplate" href="javascript:void(0);" ><span>编辑</span></a></li>
			  <li class="line">line</li>
			<li><a class="delete" onclick="deleteSmsEmailTemplateConfirmMsg()"><span>删除</span></a></li>
		</ul>
	</div>
	<table id="smsEmailTemplateGride"></table>
</div>