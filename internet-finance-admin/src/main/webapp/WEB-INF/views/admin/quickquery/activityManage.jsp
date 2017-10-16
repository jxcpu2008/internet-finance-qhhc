<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/activityManage.js"></script>
<style>
 #activityManage-search-panel {vertical-align: middle;}
</style>
<div id="activityManage-search-panel">
	<div>
		<form method="post" id="activityManageSearchForm">	
		    <span class="label">搜索:</span> 
		    <input name="mobilePhone" id="mobilePhone" class="input-text" placeholder="按手机号/真实姓名搜索" style="width: 140px"/>	
			<span class="label">奖励金额：</span>
			<select name="rewardMoney" style="float: none;width: 100px" id="rewardMoney" >
				<option value="0">全部</option>
				<option value="10">10元</option>
				<option value="30">30元</option>
				<option value="60">60元</option>
			</select>
			<span class="label">活动类型：</span>
			<select name="type" style="float: none;;width: 100px" id="type" >
				<option value="0">全部</option>
				<option value="14">5月首投活动</option>
			</select>
			<span class="label">时间搜索：</span>
			<input name="createTime"  id="createTimeActivity"  readonly="readonly"  style="width: 100px" />
			<span class="label">至：</span>
			<input name="tenderTime" id="tenderTimeActivity" readonly="readonly" style="width: 100px" />
			<span id="activityManage-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="activityManageCashFile()"><span>导出</span></a></li>
		</ul>
	</div>
	<table id="activityManageGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>