<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/activityMonkeyQuery.js"></script>
<style>
	#activityMonkeyQ-search-panel {vertical-align: middle;}
</style>
<div id="activityMonkeyQ-search-panel">
	<div>
		<form method="post" id="activityMonkeyQSearchForm">		
		    <span class="label">搜索手机号：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="mobilePhone"/>   			
			<span class="label">奖励类型：</span>
			<select name="type" style="float: none;" id="type">
				<option value="0">全部</option>
				<option value="1">猴声大噪</option>
				<option value="2">金袍加身</option>
				<option value="3">红筹达人</option>
			</select>
			<span class="label">时间搜索：</span>
			<input name="createTime"  id="createtime-timeH" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="examineTime" id="examineTime-timeH" readonly="readonly" style="width: 100px" />
			<span class="label">项目名称：</span>		   		
			<input type="text"  name="loanName" class="input-text" id="loanName"/>
			<span id="activityMonkeyQ-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="activityMonkeyQCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="activityMonkeyQueryGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>