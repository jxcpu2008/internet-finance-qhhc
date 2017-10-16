<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/noviceTaskStatistics.js"></script>
<style>
	#noviceTaskStatistic-search-panel {vertical-align: middle;}
</style>
<div id="noviceTaskStatistic-search-panel">
	<div>
	 <form method="post" id="noviceTaskStatisticSearchForm">		
			<span class="label">搜索：</span>
			<input name="mobilePhone" id="mobilePhone" placeholder="按手机号/真实姓名搜索" style="width: 140px"/>	
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span class="label">注册时间：</span>
			<input name="beginTime"  id="beginTime" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="endTime" id="endTime" readonly="readonly" style="width: 100px" />
			 &nbsp;&nbsp;
			<span id="noviceTaskStatistic-button-search">搜索</span>
	    </form>
	 </div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="noviceTaskStatisticCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="noviceTaskStatisticGride"></table>
	<table id="taskCompletionScheduleGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>