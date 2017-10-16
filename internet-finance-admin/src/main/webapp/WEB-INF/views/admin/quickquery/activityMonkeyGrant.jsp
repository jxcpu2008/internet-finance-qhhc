<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/activityMonkeyGrant.js"></script>
<style>
	#activityMonkeyG-search-panel {vertical-align: middle;}
</style>
<div id="activityMonkeyG-search-panel">
	<div>
		<form method="post" id="activityMonkeyGSearchForm">		
		    <span class="label">搜索手机号：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="mobilePhoneG"/>   			
			<span class="label">奖励类型：</span>
			<select name="type" style="float: none;" id="typeG">
				<option value="0">全部</option>
				<option value="1">猴声大噪</option>
				<option value="2">金袍加身</option>
				<option value="3">红筹理财师</option>
				<option value="4">桃花朵朵开</option>
				<option value="5">抽奖活动</option>
				<option value="6">排位活动</option>
				<option value="7">5月活动</option>
			</select>
			<span class="label">发放状态：</span>
			<select name="status" style="float: none;" id="statusG">
				<option value="0">全部</option>
				<option value="1">待发放</option>
				<option value="2">已发放</option>
				<option value="3">宝付已受理</option>
				<option value="4">发放失败</option>
			</select>
			<br><br>
			<span class="label">项目名称：</span>		   		
			<input type="text"  name="loanName" class="input-text" id="loanNameG"/>
			<span class="label">发放时间搜索：</span>
			<input name="createTime" id="createtime-timeG" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="examineTime" id="examineTime-timeG" readonly="readonly" style="width: 100px" />
			<span id="activityMonkeyG-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
		    <li><a class="edit" id="updateActivityMonkey" href="javascript:void(0);"><span>现金发放</span></a></li>
		    <li class="line">line</li>
		      <li><a class="edit" id="updateBatchActivtiyMonkey" href="javascript:void(0);"><span>批量现金发放</span></a></li>
		    <li class="line">line</li>
		    <li><a class="icon" id="getLoanActivityMonkey" href="javascript:void(0);"><span>发放状态查询</span> </a></li>
		    <li class="line">line</li>
		    <li><a class="add" onclick="activityMonkeyGrantCashFile()"><span>导出</span></a></li>
		    <li class="line">line</li>
			<li><a class="add" id="sumActivityMonkey"><span>统计总额</span></a></li>
		</ul>
	</div>
	<table id="activityMonkeyGrantGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>