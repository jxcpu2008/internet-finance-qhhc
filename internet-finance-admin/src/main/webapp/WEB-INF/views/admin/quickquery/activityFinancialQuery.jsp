<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/activityFinancialQuery.js"></script>
<style>
	#activityFinancial-search-panel {vertical-align: middle;}
</style>
<div id="activityFinancial-search-panel">
	<div>
		<form method="post" id="activityFinancialSearchForm">		
		    <span class="label">搜索：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="activityMobilePhone"/>   			
			<span class="label">奖励类型：</span>
			<select name="type" style="float: none;" id="activityType]">
				<option value="0">全部</option>
				<option value="1">188元</option>
				<option value="2">388元</option>
				<option value="3">888元</option>
				<option value="4">1888元</option>
			</select>
			<span class="label">注册时间：</span>
			<input name="createTime"  id="activityCreateTime" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="examineTime" id="activityExamineTime" readonly="readonly" style="width: 100px" />
			<span id="activityFinancial-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="activityFinancialCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="activityFinancialQueryGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>