<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/lotteryDrawActivity.js"></script>
<style>
	#lotteryDrawActivity-search-panel {vertical-align: middle;}
</style>
<div id="lotteryDrawActivity-search-panel">
	<div>
		<form method="post" id="lotteryDrawActivitySearchForm">		
			<span class="label">获奖时间：</span>
			<input name="createTime"  id="createTimeActivity" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="examineTime" id="examineTimeActivity" readonly="readonly" style="width: 100px" />
			 <span class="label">手机号码：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="mobilePhoneActivity"  style="width: 100px"/>   
			<span class="label">获奖类型：</span>
			<select name="type" style="float: none;width: 100px" id="typeActivity" >
				<!-- <option value="0">全部</option>
				<option value="1">抽奖活动</option>
				<option value="2">排位活动</option> -->
				<option value="2">全部</option>
				<option value="12">一鸣惊人</option>
				<option value="13">一锤定音</option>
			</select>
			<span id="lotteryDrawActivity-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="lotteryDrawActivityCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="lotteryDrawActivityGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>