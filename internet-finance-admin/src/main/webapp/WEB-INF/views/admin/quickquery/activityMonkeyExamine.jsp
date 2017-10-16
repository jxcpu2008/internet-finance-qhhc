<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/activityMonkeyExamine.js"></script>
<style>
	#activityMonkeyE-search-panel {vertical-align: middle;}
</style>
<div id="activityMonkeyE-search-panel">
	<div>
		<form method="post" id="activityMonkeyESearchForm">		
		    <span class="label">搜索：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="mobilePhoneE"/>   			
			<span class="label">奖励类型：</span>
			<select name="type" style="float: none;" id="typeE">
				<option value="0">全部</option>
				<option value="1">猴声大噪</option>
				<option value="2">金袍加身</option>
				<option value="3">红筹理财师</option>
				<option value="4">抽奖活动</option>
				<option value="5">排位活动</option>
				<option value="6">5月活动</option>
			</select>
			<span class="label">项目名称：</span>		   		
			<input type="text"  name="loanName" class="input-text" id="loanNameE"/>
			<span class="label">获奖时间搜索：</span>
			<input name="createTime" id="createtime-timeE" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="examineTime" id="examineTime-timeE" readonly="readonly" style="width: 100px" />
			<span id="activityMonkeyE-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
		    <li><a class="edit" id="activityMonkeyExamine" href="javascript:void(0);"><span>审核通过</span></a></li>
		    <li class="line">line</li>
		    <li><a class="edit" id="updateBatchActivityMonkey" href="javascript:void(0);"><span>批量审核通过</span></a></li>
		</ul>
	</div>
	<table id="activityMonkeyExamineGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>