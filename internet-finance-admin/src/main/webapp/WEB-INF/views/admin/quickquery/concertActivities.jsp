<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/concertActivities.js"></script>
<style>
	#noviceTaskStatistic-search-panel {vertical-align: middle;}
</style>
<div id="concertActivities-search-panel">
	<div>
	 <form method="post" id="concertActivitiesSearchForm">		
			<span class="label">搜索：</span>
			<input name="mobilePhone" id="mobilePhone" placeholder="按手机号/真实姓名搜索" style="width: 140px"/>	
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="label">门票张数</span>
			<select name="ticketNumber" style="float: none;width: 100px" id="ticketNumber" >
			  <option value="0">全部</option>
			  <option value="1">1张</option>
			  <option value="2">2张</option>
			</select>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    <span class="label">注册时间：</span>
			<input name="startTime"  id="startTime" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="stopTime" id="stopTime" readonly="readonly" style="width: 100px" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="concertActivities-button-search">搜索</span>
	    </form>
	 </div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="concertActivitiesCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="concertActivitiesGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>