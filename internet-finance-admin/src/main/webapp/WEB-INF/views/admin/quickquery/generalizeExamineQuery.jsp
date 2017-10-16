<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/generalizeExamineQuery.js"></script>
<style>
	#generalizeExamine-search-panel {vertical-align: middle;}
</style>
<div id="generalizeExamine-search-panel">
	<div>
		<form method="post" id="generalizeExamineSearchForm">		
		     <span class="label">搜索：</span>		   		
			<input type="text"  name="uanme" class="input-text" id="uanme"/> 			
			<span class="label">审核状态：</span>
			<select name="state" style="float: none;" id="state">
				<option value="9">全部</option>
				<option value="0">待审核</option>
				<option value="1">关联成功</option>
				<option value="2">审核不通过</option>
			</select>
			<span class="label">时间搜索：</span>
			<input name="adddate"  id="adddateQ" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="auditTime" id="auditTimeQ" readonly="readonly" style="width: 100px" />
			<span id="generalizeExamine-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		  	<li><a class="add" id="generalizeExaminePass" href="javascript:void(0);" ><span>审核通过</span></a></li>
			<li class="line">line</li>
			<li><a class="add" id="generalizeExamineNotPass" href="javascript:void(0);" ><span>审核不通过</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="generalizeExamineCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="generalizeExamineQueryGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>